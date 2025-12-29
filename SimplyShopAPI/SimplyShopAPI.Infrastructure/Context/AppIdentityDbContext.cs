using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SimplyShopAPI.Infrastructure.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Context
{
    public class AppIdentityDbContext : IdentityDbContext<ApplicationUser>
    {
        public AppIdentityDbContext(DbContextOptions<AppIdentityDbContext> options) : base(options) 
        { 
        }

        public DbSet<RefreshToken> RefreshTokens => Set<RefreshToken>();
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<RefreshToken>(b =>
            {
                b.HasKey(x => x.Id);

                b.Property(x => x.TokenHash)
                 .IsRequired();

                b.HasIndex(x => x.TokenHash)
                 .IsUnique();

                b.Property(x => x.UserId)
                 .IsRequired();

                b.Property(x => x.ExpiresAtUtc)
                 .IsRequired();
            });
        }
    }
}
