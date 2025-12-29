using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Interfaces
{
    public interface IRefreshTokenGenerator
    {
        public string GenerateRawToken();
        public string Hash(string rawToken);
    }
}
