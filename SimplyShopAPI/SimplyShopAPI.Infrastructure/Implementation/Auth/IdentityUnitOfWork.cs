using SimplyShopAPI.Application.Auth.Interfaces;
using SimplyShopAPI.Infrastructure.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Implementation.Auth
{
    public class IdentityUnitOfWork : IIdentityUnitOfWork
    {
        private readonly AppIdentityDbContext _ctx;
        public IRefreshTokenRepository RefreshTokenRepository { get; }
        public IdentityUnitOfWork(AppIdentityDbContext ctx, IRefreshTokenRepository refreshTokenRepository)
        {
            _ctx = ctx;
            RefreshTokenRepository = refreshTokenRepository;
        }

        public Task SaveChangesAsync(CancellationToken ct = default)
        {
            return _ctx.SaveChangesAsync(ct);
        }
    }
}
