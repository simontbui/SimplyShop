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

        public IEnumerable<ProductSummary> GetProductSummaries(string? city, int rows = 10)
        {
            List<ProductSummary> productSummaries = (from t in _context.Transactions
                                                    join p in _context.Products on t.ProductId equals p.ProductId
                                                    join s in _context.Stores on t.StoreId equals s.StoreId
                                                    where city == null || s.CityAddress.ToLower() == city
                                                    group t by p.ProductName into g
                                                    select new ProductSummary
                                                    {
                                                        ProductName = g.Key,
                                                        TransactionCount = g.Count(),
                                                        AvgTransactionAmt = Math.Round(g.Average(x => x.Cost), 2)
                                                    })
                                                    .OrderByDescending(x => x.TransactionCount)
                                                    .Take(rows)
                                                    .ToList();

            return productSummaries;
        }
    }
}
