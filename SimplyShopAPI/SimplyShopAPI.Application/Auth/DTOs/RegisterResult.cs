using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.DTOs
{
    public class RegisterResult
    {
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? ZipCode { get; set; }
        public string AccessToken { get; init; } = "";
        public DateTime AccessTokenExpiresAtUtc { get; init; }
    }
}
