using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using SimplyShopAPI.Infrastructure.Entities;

namespace SimplyShopAPI.Infrastructure.Context
{
    public partial class SimplyShopContext : DbContext
    {
        public SimplyShopContext()
        {
        }

        public SimplyShopContext(DbContextOptions<SimplyShopContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Brand> Brands { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Store> Stores { get; set; } = null!;
        public virtual DbSet<Transaction> Transactions { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseNpgsql("Host=localhost;Database=SimplyShop;Username=root;Password=root");
//            }
//        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Brand>(entity =>
            {
                entity.ToTable("brands");

                entity.Property(e => e.BrandId).HasColumnName("brand_id");

                entity.Property(e => e.BrandName)
                    .HasMaxLength(50)
                    .HasColumnName("brand_name");

                entity.Property(e => e.DateCreated).HasColumnName("date_created");

                entity.Property(e => e.LastUpdated).HasColumnName("last_updated");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("products");

                entity.HasIndex(e => new { e.ProductName, e.BrandId, e.Unit, e.UnitType }, "unique_products")
                    .IsUnique();

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.BrandId).HasColumnName("brand_id");

                entity.Property(e => e.DateCreated).HasColumnName("date_created");

                entity.Property(e => e.LastUpdated).HasColumnName("last_updated");

                entity.Property(e => e.ProductName)
                    .HasMaxLength(50)
                    .HasColumnName("product_name");

                entity.Property(e => e.Unit).HasColumnName("unit");

                entity.Property(e => e.UnitType)
                    .HasMaxLength(15)
                    .HasColumnName("unit_type");

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.BrandId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("products_brand_id_fkey");
            });

            modelBuilder.Entity<Store>(entity =>
            {
                entity.ToTable("stores");

                entity.HasIndex(e => new { e.StoreName, e.StreetAddress, e.ZipAddress }, "unique_stores")
                    .IsUnique();

                entity.Property(e => e.StoreId).HasColumnName("store_id");

                entity.Property(e => e.CityAddress)
                    .HasMaxLength(50)
                    .HasColumnName("city_address");

                entity.Property(e => e.DateCreated).HasColumnName("date_created");

                entity.Property(e => e.LastUpdated).HasColumnName("last_updated");

                entity.Property(e => e.StateAddress)
                    .HasMaxLength(2)
                    .HasColumnName("state_address");

                entity.Property(e => e.StoreName)
                    .HasMaxLength(30)
                    .HasColumnName("store_name");

                entity.Property(e => e.StreetAddress)
                    .HasMaxLength(50)
                    .HasColumnName("street_address");

                entity.Property(e => e.ZipAddress)
                    .HasMaxLength(6)
                    .HasColumnName("zip_address");
            });

            modelBuilder.Entity<Transaction>(entity =>
            {
                entity.ToTable("transactions");

                entity.Property(e => e.TransactionId).HasColumnName("transaction_id");

                entity.Property(e => e.Cost)
                    .HasPrecision(12, 2)
                    .HasColumnName("cost");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.StoreId).HasColumnName("store_id");

                entity.Property(e => e.TransactionDate).HasColumnName("transaction_date");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("transactions_product_id_fkey");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.StoreId)
                    .HasConstraintName("transactions_store_id_fkey");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("transactions_user_id_fkey");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("users");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.CityAddress)
                    .HasMaxLength(50)
                    .HasColumnName("city_address");

                entity.Property(e => e.DateCreated).HasColumnName("date_created");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .HasColumnName("email");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .HasColumnName("first_name");

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .HasColumnName("last_name");

                entity.Property(e => e.LastUpdated).HasColumnName("last_updated");

                entity.Property(e => e.StateAddress)
                    .HasMaxLength(2)
                    .HasColumnName("state_address");

                entity.Property(e => e.StreetAddress)
                    .HasMaxLength(50)
                    .HasColumnName("street_address");

                entity.Property(e => e.ZipAddress)
                    .HasMaxLength(6)
                    .HasColumnName("zip_address");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
