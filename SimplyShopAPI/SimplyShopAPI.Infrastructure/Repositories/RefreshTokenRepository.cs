using Microsoft.EntityFrameworkCore;
using SimplyShopAPI.Application.Auth.Interfaces;
using SimplyShopAPI.Application.Auth.Records;
using SimplyShopAPI.Infrastructure.Context;
using SimplyShopAPI.Infrastructure.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Repositories
{
    public class RefreshTokenRepository : IRefreshTokenRepository
    {
        private readonly AppIdentityDbContext _ctx;

        public RefreshTokenRepository(AppIdentityDbContext ctx)
        {
            _ctx = ctx;
        }

        public async Task AddAsync(string userId, string tokenHash, DateTime expiresAtUtc, CancellationToken ct = default)
        {
            var entity = new RefreshToken
            {
                UserId = userId,
                TokenHash = tokenHash,
                CreatedAtUtc = DateTime.UtcNow,
                ExpiresAtUtc = expiresAtUtc,
                RevokedAtUtc = null,
                ReplacedByTokenHash = null
            };

            await _ctx.RefreshTokens.AddAsync(entity, ct);
        }

        public async Task<RefreshTokenRecord?> GetByHashAsync(string tokenHash, CancellationToken ct = default)
        {
            var entity = await _ctx.RefreshTokens
                .AsNoTracking()
                .SingleOrDefaultAsync(x => x.TokenHash == tokenHash, ct);

            if (entity == null)
            {
                return null;
            }

            return new RefreshTokenRecord(
                entity.Id,
                entity.UserId,
                entity.TokenHash,
                entity.ExpiresAtUtc,
                entity.RevokedAtUtc,
                entity.ReplacedByTokenHash
            );
        }

        public async Task RevokeAsync(Guid id, string? replacedByTokenHash, CancellationToken ct = default)
        {
            var entity = await _ctx.RefreshTokens.SingleOrDefaultAsync(x => x.Id == id, ct);

            if (entity == null)
            {
                return;
            }

            entity.RevokedAtUtc = DateTime.UtcNow;
            entity.ReplacedByTokenHash = replacedByTokenHash;
        }
    }
}
