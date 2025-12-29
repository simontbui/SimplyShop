using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SimplyShopAPI.Application.Auth.DTOs;
using SimplyShopAPI.Application.Auth.Interfaces;
using System.Security.Claims;

namespace SimplyShopAPI.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;
        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterRequest request)
        {
            var auth = await _authService.RegisterAsync(request);

            SetRefreshCookie(auth.RefreshTokenRaw, auth.RefreshTokenExpiresAtUtc);

            return Ok(new RegisterResult
            {
                FirstName = auth.FirstName,
                LastName = auth.LastName,
                ZipCode = auth.ZipCode,
                AccessToken = auth.AccessToken,
                AccessTokenExpiresAtUtc = auth.AccessTokenExpiresAtUtc
            });
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginRequest request)
        {
            var auth = await _authService.LoginAsync(request);

            SetRefreshCookie(auth.RefreshTokenRaw, auth.RefreshTokenExpiresAtUtc);

            return Ok(new LoginResult
            {
                FirstName = auth.FirstName,
                LastName = auth.LastName,
                ZipCode = auth.ZipCode,
                AccessToken = auth.AccessToken,
                AccessTokenExpiresAtUtc = auth.AccessTokenExpiresAtUtc,
            });
        }

        [HttpPost("refresh")]
        public async Task<IActionResult> Refresh()
        {
            var refreshRaw = Request.Cookies["refresh_token"];
            if (string.IsNullOrWhiteSpace(refreshRaw)) return Unauthorized();

            var auth = await _authService.RefreshAsync(refreshRaw);

            SetRefreshCookie(auth.RefreshTokenRaw, auth.RefreshTokenExpiresAtUtc);

            return Ok(new
            {
                accessToken = auth.AccessToken,
                accessTokenExpiresAtUtc = auth.AccessTokenExpiresAtUtc
            });
        }

        [Authorize]
        [HttpGet("whoami")]
        public async Task<IActionResult> WhoAmI()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrWhiteSpace(userId))
            {
                return Unauthorized();
            }

            return Ok(await _authService.WhoAmIAsync(userId));
        }

        private void SetRefreshCookie(string refreshTokenRaw, DateTime refreshExpiresAtUtc)
        {
            Response.Cookies.Append(
                "refresh_token",
                refreshTokenRaw,
                new CookieOptions
                {
                    HttpOnly = true,
                    Secure = false, //for local dev
                    SameSite = SameSiteMode.Lax,
                    Expires = refreshExpiresAtUtc,
                    Path = "/api/auth/refresh"
                }
            );
        }
    }
}
