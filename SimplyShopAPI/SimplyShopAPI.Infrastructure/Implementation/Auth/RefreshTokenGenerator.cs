using SimplyShopAPI.Application.Auth.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Implementation.Auth
{
    public class RefreshTokenGenerator : IRefreshTokenGenerator
    {
        public string GenerateRawToken()
        {
            return Convert.ToBase64String(RandomNumberGenerator.GetBytes(64));
        }

        public string Hash(string rawToken)
        {
            return Convert.ToBase64String(SHA256.HashData(Encoding.UTF8.GetBytes(rawToken)));
        }
    }
}
