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
        public virtual DbSet<Item> Items { get; set; } = null!;
        public virtual DbSet<UnitType> UnitTypes { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<PackageDefinition> PackageDefinitions { get; set; } = null!;
        public virtual DbSet<StoreStatus> StoreStatuses { get; set; } = null!;
        public virtual DbSet<Store> Stores { get; set; } = null!;
        public virtual DbSet<UserProfile> UserProfile { get; set; } = null!;
        public virtual DbSet<Transaction> Transactions { get; set; } = null!;

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
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Brand>(entity =>
            {
                entity.ToTable("brands");

                entity.HasKey(e => e.BrandId);

                entity.HasIndex(e => new { e.BrandName }, "unique_brand_names")
                    .IsUnique();

                entity.Property(e => e.BrandId).HasColumnName("brand_id");

                entity.Property(e => e.BrandName)
                    .HasMaxLength(50)
                    .HasColumnName("brand_name");

                entity.Property(e => e.BrandNameDisplay)
                    .HasMaxLength(50)
                    .HasColumnName("brand_name_display");

                entity.Property(e => e.DateCreated)
                    .HasColumnName("date_created")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.Property(e => e.LastUpdated)
                    .HasColumnName("last_updated")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");
            });

            modelBuilder.Entity<UnitType>(entity =>
            {
                entity.ToTable("unit_types");

                entity.HasKey(e => e.UnitTypeId);

                entity.HasIndex(e => new { e.UnitTypeName }, "unique_unit_types")
                    .IsUnique();

                entity.Property(e => e.UnitTypeId).HasColumnName("unit_type_id");

                entity.Property(e => e.UnitTypeName)
                    .HasMaxLength(50)
                    .HasColumnName("unit_type_name");

                entity.Property(e => e.UnitTypeAbbrev)
                    .HasMaxLength(25)
                    .HasColumnName("unit_type_abbrev");

                entity.Property(e => e.DateCreated)
                    .HasColumnName("date_created")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.Property(e => e.LastUpdated)
                    .HasColumnName("last_updated")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");
            });

            //modelBuilder.Entity<ItemStatus>(entity =>
            //{
            //    entity.ToTable("item_statuses");

            //    entity.HasKey(e => e.ItemStatusId);

            //    entity.HasIndex(e => new { e.ItemStatusName }, "unique_item_statuses")
            //        .IsUnique();

            //    entity.Property(e => e.ItemStatusId).HasColumnName("item_status_id");

            //    entity.Property(e => e.ItemStatusName).HasColumnName("item_status_name");
            //});

            modelBuilder.Entity<Item>(entity =>
            {
                entity.ToTable("items");

                entity.HasKey(e => e.ItemId);

                entity.HasIndex(e => new { e.ItemName }, "unique_item_names")
                    .IsUnique();

                entity.Property(e => e.ItemId).HasColumnName("item_id");

                entity.Property(e => e.ItemName)
                    .HasMaxLength(50)
                    .HasColumnName("item_name");

                entity.Property(e => e.ItemNameDisplay)
                    .HasMaxLength(50)
                    .HasColumnName("item_name_display");

                //entity.Property(e => e.ItemStatusId).HasColumnName("item_status_id");

                entity.Property(e => e.DateCreated)
                    .HasColumnName("date_created")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.Property(e => e.LastUpdated)
                    .HasColumnName("last_updated")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                //entity.HasOne(s => s.ItemStatus)
                //    .WithMany(s => s.Items)
                //    .HasForeignKey(s => s.ItemStatusId)
                //    .OnDelete(DeleteBehavior.Restrict)
                //    .HasConstraintName("items_item_status_id_fkey");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("products");

                entity.HasKey(e => e.ProductId);

                entity.HasIndex(e => new { e.ItemId, e.BrandId, e.UnitTypeId }, "unique_products")
                    .IsUnique();

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.ItemId).HasColumnName("item_id");

                entity.Property(e => e.BrandId).HasColumnName("brand_id");

                entity.Property(e => e.UnitTypeId).HasColumnName("unit_type_id");

                entity.Property(e => e.DateCreated)
                    .HasColumnName("date_created")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.Property(e => e.LastUpdated)
                    .HasColumnName("last_updated")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.HasOne(p => p.Item)
                    .WithMany(p => p.Products)
                    .HasForeignKey(p => p.ItemId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("products_item_id_fkey");

                entity.HasOne(p => p.UnitType)
                    .WithMany(p => p.Products)
                    .HasForeignKey(p => p.UnitTypeId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("products_unit_type_id_fkey");

                entity.HasOne(p => p.Brand)
                    .WithMany(p => p.Products)
                    .HasForeignKey(p => p.BrandId)
                    .IsRequired(false)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("products_brand_id_fkey");
            });

            modelBuilder.Entity<PackageDefinition>(entity =>
            {
                entity.ToTable("package_definitions");

                entity.HasKey(e => e.ProductId);

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.UnitTypeId).HasColumnName("unit_type_id");

                entity.Property(e => e.PackageDescr).HasColumnName("package_description");

                entity.Property(e => e.PackageSize)
                    .HasPrecision(12, 2)
                    .HasColumnName("package_size");

                entity.HasOne(p => p.Product)
                    .WithOne(p => p.PackageDefinition)
                    .HasForeignKey<PackageDefinition>(p => p.ProductId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("package_definitions_product_id_fkey");

                entity.HasOne(p => p.UnitType)
                    .WithMany(p => p.PackageDefinitions)
                    .HasForeignKey(p => p.UnitTypeId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("package_definitions_unit_type_id_fkey");
            });

            modelBuilder.Entity<StoreStatus>(entity =>
            {
                entity.ToTable("store_statuses");

                entity.HasKey(e => e.StoreStatusId);

                entity.HasIndex(e => new { e.StoreStatusName }, "unique_store_statuses")
                    .IsUnique();

                entity.Property(e => e.StoreStatusId).HasColumnName("store_status_id");

                entity.Property(e => e.StoreStatusName).HasColumnName("store_status_name");
            });

            modelBuilder.Entity<Store>(entity =>
            {
                entity.ToTable("stores");

                entity.HasKey(e => e.StoreId);

                entity.HasIndex(e => new { e.StoreName, e.StreetAddress, e.ZipAddress }, "unique_stores")
                    .IsUnique();

                entity.Property(e => e.StoreId).HasColumnName("store_id");

                entity.Property(e => e.CityAddress)
                    .HasMaxLength(50)
                    .HasColumnName("city_address");

                entity.Property(e => e.DateCreated)
                    .HasColumnName("date_created")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.Property(e => e.LastUpdated)
                    .HasColumnName("last_updated")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.Property(e => e.StateAddress)
                    .HasMaxLength(2)
                    .HasColumnName("state_address");

                entity.Property(e => e.StoreName)
                    .HasMaxLength(30)
                    .HasColumnName("store_name");

                entity.Property(e => e.StoreNameDisplay)
                    .HasMaxLength(30)
                    .HasColumnName("store_name_display");

                entity.Property(e => e.StreetAddress)
                    .HasMaxLength(50)
                    .HasColumnName("street_address");

                entity.Property(e => e.ZipAddress)
                    .HasMaxLength(6)
                    .HasColumnName("zip_address");

                entity.Property(e => e.Latitude).HasColumnName("latitude");

                entity.Property(e => e.Longitude).HasColumnName("longitude");

                entity.Property(e => e.Location)
                    .HasColumnName("location")
                    .HasColumnType("geometry (point, 4326)");
                //geometry is faster than geography but geography is more accurate on global scale distance calcs

                entity.Property(e => e.StoreStatusId).HasColumnName("store_status_id");

                entity.HasOne(s => s.StoreStatus)
                    .WithMany(s => s.Stores)
                    .HasForeignKey(s => s.StoreStatusId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("stores_store_status_id_fkey");
            });

            modelBuilder.Entity<UserProfile>(entity =>
            {
                entity.ToTable("user_profiles");

                entity.HasKey(e => e.ProfileId);

                entity.Property(e => e.ProfileId).HasColumnName("profile_id");

                entity.HasIndex(e => new { e.IdentityUserId }, "unique_identity_user_id")
                    .IsUnique();

                entity.Property(e => e.IdentityUserId).HasColumnName("identity_user_id");

                entity.Property(e => e.FirstName).HasColumnName("first_name").HasMaxLength(25);

                entity.Property(e => e.LastName).HasColumnName("last_name").HasMaxLength(25);

                entity.Property(e => e.ZipCode).HasColumnName("zip_code").HasMaxLength(6);
            });

            modelBuilder.Entity<Transaction>(entity =>
            {
                entity.ToTable("transactions");

                entity.HasKey(e => e.TransactionId);

                entity.Property(e => e.TransactionId).HasColumnName("transaction_id");

                entity.Property(e => e.Cost)
                    .HasPrecision(12, 2)
                    .HasColumnName("cost");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.StoreId).HasColumnName("store_id");

                entity.Property(e => e.TransactionDate)
                    .HasColumnName("transaction_date")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()"); ;

                entity.Property(e => e.ProfileId).HasColumnName("profile_id");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("transactions_product_id_fkey");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.StoreId)
                    .HasConstraintName("transactions_store_id_fkey");

                entity.HasOne(d => d.UserProfile)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.ProfileId)
                    .HasConstraintName("transactions_user_profile_id_fkey");
            });
        }
    }
}
