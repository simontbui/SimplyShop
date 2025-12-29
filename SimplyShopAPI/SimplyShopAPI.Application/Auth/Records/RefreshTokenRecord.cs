using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Records
{
    public record RefreshTokenRecord(
        Guid Id,
        string UserId,
        string TokenHash,
        DateTime ExpiresAtUtc,
        DateTime? RevokedAtUtc,
        string? ReplacedByTokenHash
    )
    {
        public bool IsActive => RevokedAtUtc == null && DateTime.UtcNow < ExpiresAtUtc;
    }
}
