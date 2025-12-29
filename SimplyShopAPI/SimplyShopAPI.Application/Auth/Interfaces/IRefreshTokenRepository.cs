using SimplyShopAPI.Application.Auth.Records;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Interfaces
{
    public interface IRefreshTokenRepository
    {
        Task AddAsync(string userId, string tokenHash, DateTime expiresAtUtc, CancellationToken ct = default);
        Task<RefreshTokenRecord?> GetByHashAsync(string tokenHash, CancellationToken ct = default);
        Task RevokeAsync(Guid id, string? replacedByTokenHash, CancellationToken ct = default);
    }
}
