using SimplyShopAPI.Infrastructure.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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


        public IEnumerable<AvgSpentPerVisit> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false)
        {
            var avgSpentData = (
                from t in _context.Transactions
                join s in _context.Stores on t.StoreId equals s.StoreId
                let groupKey = groupByMonth
                                ? new DateOnly(t.TransactionDate.Year, t.TransactionDate.Month, 1)
                                : t.TransactionDate
                group t by groupKey into g
                select new AvgSpentPerVisit
                {
                    TransactionDate = g.Key,
                    AvgSpent = g.Average(x => x.Cost)
                })
                .OrderBy(x => x.TransactionDate).ToList();

            return avgSpentData;
        }
    }
}
