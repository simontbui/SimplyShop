using SimplyShopAPI.Application.Auth.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Interfaces
{
    public interface ITokenService
    {
        Task<(string token, DateTime expiresAtUtc)> CreateTokenAsync(TokenUser user);
    }
}
