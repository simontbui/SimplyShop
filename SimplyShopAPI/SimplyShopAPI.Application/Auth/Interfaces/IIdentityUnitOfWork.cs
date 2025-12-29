using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Auth.Interfaces
{
    public interface IIdentityUnitOfWork
    {
        IRefreshTokenRepository RefreshTokenRepository { get; }
        Task SaveChangesAsync(CancellationToken ct = default);
    }
}
