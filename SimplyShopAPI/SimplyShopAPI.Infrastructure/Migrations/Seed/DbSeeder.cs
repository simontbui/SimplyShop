using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using SimplyShopAPI.Infrastructure.Context;
using SimplyShopAPI.Infrastructure.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Migrations.Seed
{
    public static class DbSeeder
    {
        public static async Task SeedAsync(IServiceProvider serviceProvider)
        {
            var db = serviceProvider.GetRequiredService<SimplyShopContext>();
            if (db == null)
            {
                return;
            }

            await using var tx = await db.Database.BeginTransactionAsync();

            await SeedUnitTypes(db);
            await db.SaveChangesAsync();

            await SeedBrands(db);
            await db.SaveChangesAsync();

            await SeedItems(db);
            await db.SaveChangesAsync();

            await SeedProducts(db);
            await db.SaveChangesAsync();

            await SeedPackageDefinitions(db);
            await db.SaveChangesAsync();

            await SeedStoreStatuses(db);
            await db.SaveChangesAsync();

            await SeedStores(db);
            await db.SaveChangesAsync();

            await SeedTransactions(db);
            await db.SaveChangesAsync();

            await tx.CommitAsync();
            return;
        }

        private static async Task SeedUnitTypes(SimplyShopContext ctx)
        {
            if (await ctx.UnitTypes.AnyAsync())
            {
                return;
            }

            var unitTypes = new List<UnitType>
            {
                new UnitType { UnitTypeName = "pounds", UnitTypeAbbrev = "lbs" },
                new UnitType { UnitTypeName = "gallon" },
                new UnitType { UnitTypeName = "ounces", UnitTypeAbbrev = "oz" },
                new UnitType { UnitTypeName = "grams", UnitTypeAbbrev = "g" },
                new UnitType { UnitTypeName = "bulb", UnitTypeAbbrev = "g" }
            };

           ctx.UnitTypes.AddRange(unitTypes);
        }

        private static async Task SeedBrands(SimplyShopContext ctx)
        {
            if (await ctx.Brands.AnyAsync())
            {
                return;
            }

            var brands = new List<Brand>
            { 
                new Brand { BrandName = "dole", BrandNameDisplay = "Dole" },
                new Brand { BrandName = "stater bros.", BrandNameDisplay = "Stater Bros."},
                new Brand { BrandName = "hmart", BrandNameDisplay = "HMART" },
                new Brand { BrandName = "aldi", BrandNameDisplay = "Aldi" }, 
                new Brand { BrandName = "del monte", BrandNameDisplay = "Del Monte" },
                new Brand { BrandName = "jennie-o", BrandNameDisplay = "Jennie-O" }
            };

            ctx.Brands.AddRange(brands);
        }

        private static async Task SeedItems(SimplyShopContext ctx)
        {
            if (await ctx.Items.AnyAsync())
            {
                return;
            }

            var items = new List<Item>
            {
                new Item { ItemName = "bananas", ItemNameDisplay = "Bananas" },
                new Item { ItemName = "chicken thighs (boneless)", ItemNameDisplay = "Chicken Thighs (Boneless)" },
                new Item { ItemName = "chicken thighs (bone-in)", ItemNameDisplay = "Chicken Thighs (Bone-In)" },
                new Item { ItemName = "ground turkey", ItemNameDisplay = "Ground Turkey" },
                new Item { ItemName = "ground beef", ItemNameDisplay = "Ground Beef" },
                new Item { ItemName = "garlic", ItemNameDisplay = "Garlic" },
                new Item { ItemName = "jalapenos", ItemNameDisplay = "Jalapenos" },
                new Item { ItemName = "yellow onions", ItemNameDisplay = "Yellow Onions" },
                new Item { ItemName = "white onions", ItemNameDisplay = "White Onions" },
                new Item { ItemName = "green onions", ItemNameDisplay = "Green Onions" },
                new Item { ItemName = "carrots", ItemNameDisplay = "Carrots" },
                new Item { ItemName = "roma tomatoes", ItemNameDisplay = "Roma Tomatoes" },
                new Item { ItemName = "black beans", ItemNameDisplay = "Black Beans" },
            };

            ctx.Items.AddRange(items);
        }

        private static async Task SeedProducts(SimplyShopContext ctx)
        {
            if (await ctx.Products.AnyAsync())
            {
                return;
            }

            var itemIds = await ctx.Items
                .AsNoTracking()
                .ToDictionaryAsync(i => i.ItemName, i => i.ItemId);

            var unitTypeIds = await ctx.UnitTypes
                .AsNoTracking()
                .ToDictionaryAsync(u => u.UnitTypeName, u => u.UnitTypeId);

            var brandIds = await ctx.Brands
                .AsNoTracking()
                .ToDictionaryAsync(b => b.BrandName, b => b.BrandId);

            var lbs = unitTypeIds["pounds"];
            var bulb = unitTypeIds["bulb"];

            var dole = brandIds["dole"];
            var staterBros = brandIds["stater bros."];
            var jennieO = brandIds["jennie-o"];

            var products = new List<Product>
            {
                new Product { ItemId = itemIds["bananas"], UnitTypeId = lbs, BrandId = dole },
                new Product { ItemId = itemIds["roma tomatoes"], UnitTypeId = lbs },
                new Product { ItemId = itemIds["chicken thighs (boneless)"], UnitTypeId = lbs, BrandId = staterBros },
                new Product { ItemId = itemIds["chicken thighs (bone-in)"], UnitTypeId = lbs, BrandId = staterBros },
                new Product { ItemId = itemIds["ground turkey"], UnitTypeId = lbs, BrandId = jennieO },
                new Product { ItemId = itemIds["garlic"], UnitTypeId = bulb },
                new Product { ItemId = itemIds["carrots"], UnitTypeId = lbs },
                new Product { ItemId = itemIds["black beans"], BrandId = staterBros },
                new Product { ItemId = itemIds["yellow onions"], UnitTypeId = lbs }
            };

            ctx.Products.AddRange(products);
        }

        private static async Task SeedPackageDefinitions(SimplyShopContext ctx)
        {
            if (await ctx.PackageDefinitions.AnyAsync())
            {
                return;
            }

            var blackBeansProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                where i.ItemName == "black beans"
                select p.ProductId
                )
                .SingleAsync();

            var gramsUnitTypeId = await ctx.UnitTypes
                .Where(u => u.UnitTypeName == "grams")
                .Select(u => u.UnitTypeId)
                .SingleAsync();

            var pkgDefinitions = new List<PackageDefinition>
            {
                new PackageDefinition 
                {
                    ProductId = blackBeansProdId, 
                    PackageSize = 425, 
                    UnitTypeId = gramsUnitTypeId,
                    PackageDescr = "can"
                }
            };

            ctx.PackageDefinitions.AddRange(pkgDefinitions);
        }

        private static async Task SeedStoreStatuses(SimplyShopContext ctx)
        {
            if (await ctx.StoreStatuses.AnyAsync())
            {
                return;
            }

            var statuses = new List<StoreStatus>
            { 
                new StoreStatus { StoreStatusName = "approved" },
                new StoreStatus { StoreStatusName = "pending" }
            };

            ctx.StoreStatuses.AddRange(statuses);
        }

        private static async Task SeedStores(SimplyShopContext ctx)
        {
            if (await ctx.Stores.AnyAsync())
            {
                return;
            }

            var approvedId = await ctx.StoreStatuses
                .Where(s => s.StoreStatusName == "approved")
                .Select(s => s.StoreStatusId)
                .SingleAsync();

            var stores = new List<Store>
            {
                new Store 
                { 
                    StoreName = "stater bros.",
                    StoreNameDisplay = "Stater Bros.",
                    CityAddress = "Garden Grove",
                    ZipAddress = "92841",
                    StateAddress = "CA",
                    StreetAddress = "8888 Chapman Ave",
                    StoreStatusId = approvedId
                },
                new Store
                {
                    StoreName = "hmart",
                    StoreNameDisplay = "HMART",
                    CityAddress = "Garden Grove",
                    ZipAddress = "92841",
                    StateAddress = "CA",
                    StreetAddress = "8911 Garden Grove Blvd",
                    StoreStatusId = approvedId
                },
                new Store
                {
                    StoreName = "aldi",
                    StoreNameDisplay = "ALDI",
                    CityAddress = "Garden Grove",
                    ZipAddress = "92841",
                    StateAddress = "CA",
                    StreetAddress = "9901 Chapman Ave",
                    StoreStatusId = approvedId
                },
                new Store
                {
                    StoreName = "walmart neighborhood market",
                    StoreNameDisplay = "Walmart Neighborhood Market",
                    CityAddress = "Stanton",
                    ZipAddress = "90680",
                    StateAddress = "CA",
                    StreetAddress = "12840 Beach Blvd",
                    StoreStatusId = approvedId
                }
            };

            ctx.Stores.AddRange(stores);
        }

        private static async Task SeedTransactions(SimplyShopContext ctx)
        {
            if (await ctx.Transactions.AnyAsync())
            {
                return;
            }

            var bananaProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                join b in ctx.Brands on p.BrandId equals b.BrandId
                join u in ctx.UnitTypes on p.UnitTypeId equals u.UnitTypeId
                where i.ItemName == "bananas"
                    && b.BrandName == "dole"
                    && u.UnitTypeName == "pounds"
                select p.ProductId
                )
                .SingleAsync();

            var romaTomatoProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                join u in ctx.UnitTypes on p.UnitTypeId equals u.UnitTypeId
                where i.ItemName == "roma tomatoes"
                    && u.UnitTypeName == "pounds"
                select p.ProductId
                )
                .SingleAsync();

            var carrotProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                join u in ctx.UnitTypes on p.UnitTypeId equals u.UnitTypeId
                where i.ItemName == "carrots"
                    && u.UnitTypeName == "pounds"
                select p.ProductId
                )
                .SingleAsync();

            var garlicProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                join u in ctx.UnitTypes on p.UnitTypeId equals u.UnitTypeId
                where i.ItemName == "garlic"
                    && u.UnitTypeName == "bulb"
                select p.ProductId
                )
                .SingleAsync();

            var bonelessChickenProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                join u in ctx.UnitTypes on p.UnitTypeId equals u.UnitTypeId
                where i.ItemName == "chicken thighs (boneless)"
                    && u.UnitTypeName == "pounds"
                select p.ProductId
                )
                .SingleAsync();

            var blackBeansProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                where i.ItemName == "black beans"
                select p.ProductId
                )
                .SingleAsync();

            var yellowOnionProdId = await (
                from p in ctx.Products
                join i in ctx.Items on p.ItemId equals i.ItemId
                where i.ItemName == "yellow onions"
                select p.ProductId
                )
                .SingleAsync();

            var staterBrosStoreId = await ctx.Stores
                .Where(s => s.StoreName == "stater bros." && s.StreetAddress == "8888 Chapman Ave")
                .Select(s => s.StoreId)
                .SingleAsync();

            var hmartStoreId = await ctx.Stores
                .Where(s => s.StoreName == "hmart" && s.StreetAddress == "8911 Garden Grove Blvd")
                .Select(s => s.StoreId)
                .SingleAsync();

            var transactions = new List<Transaction>
            { 
                new Transaction
                {
                    Quantity = 2.15M,
                    Cost = 1.48M,
                    StoreId = staterBrosStoreId,
                    ProductId = bananaProdId
                },
                new Transaction
                {
                    Quantity = 2.02M,
                    Cost = 1.39M,
                    StoreId = staterBrosStoreId,
                    ProductId = bananaProdId
                },
                new Transaction
                {
                    Quantity = 1,
                    Cost = 0.50M,
                    StoreId = staterBrosStoreId,
                    ProductId = garlicProdId
                },
                new Transaction
                {
                    Quantity = 1.94M,
                    Cost = 2.50M,
                    StoreId = staterBrosStoreId,
                    ProductId = romaTomatoProdId
                },
                new Transaction
                {
                    Quantity = 2.87M,
                    Cost = 16.83M,
                    StoreId = staterBrosStoreId,
                    ProductId = bonelessChickenProdId
                },
                new Transaction
                {
                    Quantity = 2,
                    Cost = 1.98M,
                    StoreId = staterBrosStoreId,
                    ProductId = blackBeansProdId
                },
                new Transaction
                {
                    Quantity = 1.02M,
                    Cost = 0.26M,
                    StoreId = hmartStoreId,
                    ProductId = yellowOnionProdId
                },
            };

            ctx.Transactions.AddRange(transactions);
        }
    }
}
