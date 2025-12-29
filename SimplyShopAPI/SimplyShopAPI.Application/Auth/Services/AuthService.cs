using SimplyShopAPI.Application.Auth.DTOs;
using SimplyShopAPI.Application.Auth.Interfaces;
using SimplyShopAPI.Application.Auth.Records;
using SimplyShopAPI.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Services
{
    public class AuthService : IAuthService
    {
        private readonly IIdentityService _identityService;
        private readonly ITokenService _tokenService;
        private readonly IRefreshTokenGenerator _refreshTokenGenerator;
        private readonly IIdentityUnitOfWork _identityUow;
        public AuthService(IIdentityService identityService, ITokenService tokenService, IRefreshTokenGenerator refreshTokenGenerator, IIdentityUnitOfWork identityUow)
        {
            _identityService = identityService;
            _tokenService = tokenService;
            _refreshTokenGenerator = refreshTokenGenerator;
            _identityUow = identityUow;
        }

        public async Task<AuthResponse> RegisterAsync(RegisterRequest request)
        {
            var registerResult = await _identityService.RegisterAsync(request);

            if (!registerResult.Success)
            {
                throw new InvalidOperationException(registerResult.ErrorMessage);
            }

            //auto login after register
            var loginResult = await _identityService.LoginAsync(new LoginRequest
            {
                Email = request.Email,
                Password = request.Password
            });

            if (!loginResult.Success)
            {
                throw new InvalidOperationException(loginResult.ErrorMessage);
            }

            return await IssueTokensAsync(loginResult.Data);
        }

        public async Task<AuthResponse> LoginAsync(LoginRequest request)
        {
            var loginResult = await _identityService.LoginAsync(request);

            if (!loginResult.Success || loginResult.Data == null)
            {
                throw new UnauthorizedAccessException(loginResult.ErrorMessage);
            }

            return await IssueTokensAsync(loginResult.Data);
        }

        public async Task<WhoAmIResponse> WhoAmIAsync(string userId)
        {
            if (string.IsNullOrWhiteSpace(userId))
            {
                throw new UnauthorizedAccessException("Missing user id.");
            }

            var result = await _identityService.GetUserByIdAsync(userId);

            if (!result.Success || result.Data == null)
            {
                throw new UnauthorizedAccessException(result.ErrorMessage);
            }

            return new WhoAmIResponse
            {
                FirstName = result.Data.FirstName,
                LastName = result.Data.LastName,
                ZipCode = result.Data.ZipCode
            };
        }

        public async Task<AuthResponse> RefreshAsync(string refreshTokenRaw)
        {
            var tokenHash = _refreshTokenGenerator.Hash(refreshTokenRaw);
            var existing = await _identityUow.RefreshTokenRepository.GetByHashAsync(tokenHash);
            if (existing == null)
            {
                throw new UnauthorizedAccessException("Invalid refresh token.");
            }

            if (existing.RevokedAtUtc != null)
            {
                throw new UnauthorizedAccessException("Refresh token revoked.");
            }

            if (existing.ExpiresAtUtc <= DateTime.UtcNow)
            {
                throw new UnauthorizedAccessException("Refresh token expired.");
            }

            var user = await _identityService.GetUserByIdAsync(existing.UserId);
            if (!user.Success || user.Data == null)
            {
                throw new UnauthorizedAccessException("User not found.");
            }

            var response = await IssueTokensAsync(user.Data);

            var newHash = _refreshTokenGenerator.Hash(response.RefreshTokenRaw);
            await _identityUow.RefreshTokenRepository.RevokeAsync(existing.Id, newHash);
            await _identityUow.SaveChangesAsync();

            return response;
        }

        private async Task<AuthResponse> IssueTokensAsync(TokenUser user)
        {
            if (string.IsNullOrWhiteSpace(user.Id))
            {
                throw new InvalidOperationException("TokenUser.Id must be set.");
            }

            var (accessToken, accessExpiresAtutc) = await _tokenService.CreateTokenAsync(user);

            var refreshRaw = _refreshTokenGenerator.GenerateRawToken();
            var refreshHash = _refreshTokenGenerator.Hash(refreshRaw);
            var refreshExpiresAtUtc = DateTime.UtcNow.AddDays(14);

            await _identityUow.RefreshTokenRepository.AddAsync(user.Id, refreshHash, refreshExpiresAtUtc);
            await _identityUow.SaveChangesAsync();

            return new AuthResponse(
                accessToken,
                accessExpiresAtutc,
                refreshRaw,
                refreshExpiresAtUtc,
                user.FirstName,
                user.LastName,
                user.ZipCode
            );
        }
    }
}
