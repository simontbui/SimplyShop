using Microsoft.EntityFrameworkCore;
using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using SimplyShopAPI.Domain.Transactions;
using SimplyShopAPI.Infrastructure.Context;
using System;
using System.Threading;

namespace SimplyShopAPI.Infrastructure.Repositories
{
    public class TransactionRepository : ITransactionRepository
    {
        private readonly SimplyShopContext _context;

        public TransactionRepository(SimplyShopContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<AvgSpentPerVisit>> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false)
        {
            var avgSpentData = await (
                from t in _context.Transactions
                join s in _context.Stores on t.StoreId equals s.StoreId
                let groupKey = groupByMonth
                                ? new DateTime(t.TransactionDate.Year, t.TransactionDate.Month, 1)
                                : t.TransactionDate
                group t by groupKey into g
                select new AvgSpentPerVisit
                {
                    TransactionDate = DateOnly.FromDateTime(g.Key),
                    AvgSpent = g.Average(x => x.Cost)
                })
                .OrderBy(x => x.TransactionDate).ToListAsync();

            return avgSpentData;
        }

        public async Task<IReadOnlyList<ItemPriceHistory>> GetHistoricalItemPriceAsync(string itemName, int lookBackDays = 30)
        {
            var startDate = DateTime.UtcNow.Date.AddDays(-1 * Math.Clamp(lookBackDays, 1, 365));
            var normalizedItem = itemName.Trim().ToLowerInvariant();

            var query =
                from t in _context.Transactions.AsNoTracking()
                join p in _context.Products on t.ProductId equals p.ProductId
                join i in _context.Items on p.ItemId equals i.ItemId
                where i.ItemName == normalizedItem && t.TransactionDate >= startDate
                group t by DateOnly.FromDateTime(t.TransactionDate) into g
                orderby g.Key
                select new ItemPriceHistory
                {
                    TransactionDay = g.Key,
                    AvgUnitCost = Math.Round(g.Average(t => t.Cost / t.Quantity), 2),
                    TransactionCount = g.Count()
                };

            return await query.ToListAsync();
        }

        public async Task<IEnumerable<StorePriceHistory>> GetStoreCosts(string itemName, int lookBackDays = 30)
        {
            var startDate = DateTime.UtcNow.Date.AddDays(-1 * Math.Clamp(lookBackDays, 1, 365));
            var normalizedItem = itemName.Trim().ToLowerInvariant();

            var query = 
                from t in _context.Transactions.AsNoTracking()
                join p in _context.Products on t.ProductId equals p.ProductId
                join i in _context.Items on p.ItemId equals i.ItemId
                join s in _context.Stores on t.StoreId equals s.StoreId
                where i.ItemName == normalizedItem && t.TransactionDate >= startDate
                group t by new { s.StoreNameDisplay, s.StreetAddress, s.CityAddress, s.StateAddress, s.ZipAddress } into g
                orderby g.Average(x => x.Cost)
                select new StorePriceHistory
                {
                    StoreName = g.Key.StoreNameDisplay,
                    StreetAddress = g.Key.StreetAddress,
                    CityAddress = g.Key.CityAddress,
                    StateAddress = g.Key.StateAddress,
                    ZipAddress = g.Key.ZipAddress,
                    AvgUnitCost = Math.Round(g.Average(x => x.Cost), 2)
                };

            return await query.Take(10).ToListAsync();
        }
    }
}
