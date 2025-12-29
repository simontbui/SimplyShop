using SimplyShopAPI.Application.Auth.DTOs;
using SimplyShopAPI.Application.Auth.Records;
using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Interfaces
{
    public interface IAuthService
    {
        Task<AuthResponse> RegisterAsync(RegisterRequest request);
        Task<AuthResponse> LoginAsync(LoginRequest request);
        Task<WhoAmIResponse> WhoAmIAsync(string userId);
        Task<AuthResponse> RefreshAsync(string refreshTokenRaw);
    }
}
