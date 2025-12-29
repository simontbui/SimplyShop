using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Records
{
    public record AuthResponse(
        string AccessToken,
        DateTime AccessTokenExpiresAtUtc,
        string RefreshTokenRaw,
        DateTime RefreshTokenExpiresAtUtc,
        string? FirstName,
        string? LastName,
        string? ZipCode
    );
}
