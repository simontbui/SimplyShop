using SimplyShopAPI.Infrastructure.Context;
using System;
using Microsoft.EntityFrameworkCore;
using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;

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
    }
}
