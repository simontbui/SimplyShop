using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Infrastructure.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SimplyShopAPI.Domain.Models;

namespace SimplyShopAPI.Infrastructure.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly SimplyShopContext _context;

        public ProductRepository(SimplyShopContext context)
        {
            _context = context;
        }

        public IEnumerable<Product> GetMostPopularProducts(string? city, int rows = 10)
        {
            var tx = _context.Transactions
                             .AsQueryable();

            if (!string.IsNullOrEmpty(city))
            {
                tx = tx.Where(t => t.Store.CityAddress.ToLower() == city);
            }

            var top = tx
                .GroupBy(t => new {
                    t.Product.ProductId,
                    t.Product.ProductName,
                })
                .Select(g => new {
                    g.Key.ProductName,
                    AvgPrice = Math.Round(g.Average(x => x.Cost), 2),
                    Count = g.Count()
                })
                .OrderByDescending(x => x.Count)
                .Take(rows)
                .ToList();

            return top.Select(x => new Product
            {
                ProductName = x.ProductName,
                AvgPrice = x.AvgPrice
            });
        }

        public IEnumerable<BrandProductCount> GetMostPopularBrands(string? productName, int rows = 10)
        {
            List<BrandProductCount> brands = (from t in _context.Transactions
                                 join p in _context.Products on t.ProductId equals p.ProductId
                                 join b in _context.Brands on p.BrandId equals b.BrandId
                                 where p.ProductName.ToLower() == productName
                                 group t by new { b.BrandId, b.BrandName } into g
                                 select new BrandProductCount
                                 {
                                     BrandName = g.Key.BrandName,
                                     Count = g.Count()
                                 })
                                 .OrderByDescending(x => x.Count)
                                 .Take(rows)
                                 .ToList();

            return brands;
        }

        public IEnumerable<BrandProductPrice> GetCheapestBrands(string? productName, int rows = 10)
        {
            List<BrandProductPrice> brands = (from t in _context.Transactions
                                             join p in _context.Products on t.ProductId equals p.ProductId
                                             join b in _context.Brands on p.BrandId equals b.BrandId
                                             where p.ProductName.ToLower() == productName
                                             group t by new { b.BrandId, b.BrandName } into g
                                             select new BrandProductPrice
                                             {
                                                 BrandName = g.Key.BrandName,
                                                 AvgPrice = Math.Round(g.Average(x => x.Cost), 2)
                                             })
                                             .OrderByDescending(x => x.AvgPrice)
                                             .Take(rows)
                                             .ToList();

            return brands;
        }
    }
}
