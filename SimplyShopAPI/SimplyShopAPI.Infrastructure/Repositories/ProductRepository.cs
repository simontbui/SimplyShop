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
                tx = tx.Where(t => t.Store.CityAddress == city);
            }

            var top = tx
                .GroupBy(t => new {
                    t.Product.ProductId,
                    t.Product.ProductName,
                })
                .Select(g => new {
                    g.Key.ProductId,
                    g.Key.ProductName,
                    AvgPrice = Math.Round(g.Average(x => x.Cost), 2),
                    Count = g.Count()
                })
                .OrderByDescending(x => x.Count)
                .Take(rows)
                .ToList();

            return top.Select(x => new Product
            {
                ProductId = x.ProductId,
                ProductName = x.ProductName,
                AvgPrice = x.AvgPrice
            });
        }
    }
}
