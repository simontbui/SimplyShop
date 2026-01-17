using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SimplyShopAPI.Infrastructure.Entities;
using SimplyShopAPI.Infrastructure.Entities.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Context
{
    public class AppIdentityDbContext : IdentityDbContext<User>
    {
        public AppIdentityDbContext(DbContextOptions<AppIdentityDbContext> options) : base(options) 
        { 
        }

        public DbSet<RefreshToken> RefreshTokens => Set<RefreshToken>();
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<User>(b =>
            {
                b.ToTable("users");

                b.Property(u => u.Id).HasColumnName("user_id");

                b.Property(u => u.UserName).HasColumnName("username");

                b.Property(u => u.NormalizedUserName).HasColumnName("normalized_username");

                b.Property(u => u.Email).HasColumnName("email");

                b.Property(u => u.NormalizedEmail).HasColumnName("normalized_email");

                b.Property(u => u.EmailConfirmed).HasColumnName("email_confirmed");

                b.Property(u => u.PasswordHash).HasColumnName("password_hash");

                b.Property(u => u.SecurityStamp).HasColumnName("security_stamp");

                b.Property(u => u.ConcurrencyStamp).HasColumnName("concurrency_stamp");

                b.Property(u => u.PhoneNumber).HasColumnName("phone_number");

                b.Property(u => u.PhoneNumberConfirmed).HasColumnName("phone_number_confirmed");

                b.Property(u => u.TwoFactorEnabled).HasColumnName("two_factor_enabled");

                b.Property(u => u.LockoutEnd).HasColumnName("lockout_end");

                b.Property(u => u.LockoutEnabled).HasColumnName("lockout_enabled");

                b.Property(u => u.AccessFailedCount).HasColumnName("access_failed_count");

                b.Property(u => u.DateCreated)
                    .HasColumnName("date_created")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                b.Property(u => u.LastUpdated)
                    .HasColumnName("last_updated")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");
            });

            builder.Entity<IdentityRole>(b =>
            {
                b.ToTable("roles");

                b.Property(r => r.Id).HasColumnName("role_id");

                b.Property(r => r.Name).HasColumnName("name");

                b.Property(r => r.NormalizedName).HasColumnName("normalized_name");

                b.Property(r => r.ConcurrencyStamp).HasColumnName("concurrency_stamp");
            });

            builder.Entity<IdentityUserRole<string>>(b =>
            {
                b.ToTable("user_roles");

                b.Property(ur => ur.UserId).HasColumnName("user_id");

                b.Property(ur => ur.RoleId).HasColumnName("role_id");
            });

            builder.Entity<IdentityUserClaim<string>>(b =>
            {
                b.ToTable("user_claims");

                b.Property(uc => uc.Id).HasColumnName("user_claim_id");

                b.Property(uc => uc.UserId).HasColumnName("user_id");

                b.Property(uc => uc.ClaimType).HasColumnName("claim_type");

                b.Property(uc => uc.ClaimValue).HasColumnName("claim_value");
            });

            builder.Entity<IdentityUserLogin<string>>(b =>
            {
                b.ToTable("user_logins");

                b.Property(ul => ul.LoginProvider).HasColumnName("login_provider");

                b.Property(ul => ul.ProviderKey).HasColumnName("provider_key");

                b.Property(ul => ul.ProviderDisplayName).HasColumnName("provider_display_name");

                b.Property(ul => ul.UserId).HasColumnName("user_id");
            });

            builder.Entity<IdentityUserToken<string>>(b =>
            {
                b.ToTable("user_tokens");

                b.Property(ut => ut.UserId).HasColumnName("user_id");

                b.Property(ut => ut.LoginProvider).HasColumnName("login_provider");

                b.Property(ut => ut.Name).HasColumnName("name");

                b.Property(ut => ut.Value).HasColumnName("value");
            });


            builder.Entity<RefreshToken>(b =>
            {
                b.ToTable("refresh_tokens");

                b.HasKey(x => x.Id);

                b.Property(x => x.Id).HasColumnName("refresh_token_id");

                b.Property(x => x.TokenHash)
                    .HasColumnName("token_hash")
                    .IsRequired();

                b.HasIndex(x => x.TokenHash)
                    .IsUnique();

                b.Property(x => x.UserId)
                    .HasColumnName("user_id")
                    .IsRequired();

                b.Property(x => x.ExpiresAtUtc)
                    .HasColumnName("expires_at_utc")
                    .IsRequired();

                b.HasOne<User>()
                    .WithMany()
                    .HasForeignKey(x => x.UserId)
                    .OnDelete(DeleteBehavior.Cascade);
            });
        }
    }
}
