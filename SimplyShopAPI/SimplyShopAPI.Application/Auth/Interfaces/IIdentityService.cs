using SimplyShopAPI.Application.Auth.DTOs;
using SimplyShopAPI.Application.DTOs.Auth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Interfaces
{
    public interface IIdentityService
    {
        Task<IdentityResult<object>> RegisterAsync(RegisterRequest request);
        Task<IdentityResult<TokenUser>> LoginAsync(LoginRequest request);
        Task<IdentityResult<TokenUser>> GetUserByIdAsync(string userId);
    }
}
