using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Infrastructure.Context;
using SimplyShopAPI.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace SimplyShopAPI.Infrastructure.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly SimplyShopContext _context;

        public ProductRepository(SimplyShopContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<ProductSummary>> GetProductSummaries(string? city, int rows = 10)
        {
            var productSummaries = await (from t in _context.Transactions
                                        join p in _context.Products on t.ProductId equals p.ProductId
                                        join s in _context.Stores on t.StoreId equals s.StoreId
                                        where city == null || s.CityAddress.ToLower() == city.ToLower()
                                        group t by p.ProductName into g
                                        select new ProductSummary
                                        {
                                            ProductName = g.Key,
                                            TransactionCount = g.Count(),
                                            AvgTransactionAmt = Math.Round(g.Average(x => x.Cost), 2)
                                        })
                                        .OrderByDescending(x => x.TransactionCount)
                                        .Take(rows)
                                        .ToListAsync();

            return productSummaries!;
        }
    }
}
