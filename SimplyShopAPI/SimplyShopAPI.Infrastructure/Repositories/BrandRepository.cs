using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Infrastructure.Context;
using SimplyShopAPI.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace SimplyShopAPI.Infrastructure.Repositories
{
    public class BrandRepository : IBrandRepository
    {
        private readonly SimplyShopContext _context;

        public BrandRepository(SimplyShopContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<BrandSummary>> GetBrandSummaries(string? city, string? productName, int rows = 10)
        {
            var brandSummaries = await (from t in _context.Transactions
                                        join p in _context.Products on t.ProductId equals p.ProductId
                                        join s in _context.Stores on t.StoreId equals s.StoreId
                                        join b in _context.Brands on p.BrandId equals b.BrandId
                                        where city == null || s.CityAddress.ToLower() == city.ToLower()
                                        where productName == null || p.ProductName.ToLower() == productName.ToLower()
                                        group t by b.BrandName into g
                                        select new BrandSummary
                                        {
                                            BrandName = g.Key,
                                            TransactionCount = g.Count(),
                                            AvgTransactionAmt = Math.Round(g.Average(x => x.Cost), 2)
                                        })
                                 .OrderByDescending(x => x.AvgTransactionAmt)
                                 .Take(rows)
                                 .ToListAsync();

            return brandSummaries!;
        }
    }
}
