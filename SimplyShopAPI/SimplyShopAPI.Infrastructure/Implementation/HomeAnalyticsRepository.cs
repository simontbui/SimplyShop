using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using SimplyShopAPI.Infrastructure.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Implementation
{
    public class HomeAnalyticsRepository : IHomeAnalyticsRepository
    {
        private readonly SimplyShopContext _context;

        public HomeAnalyticsRepository(SimplyShopContext context)
        {
            _context = context;
        }

        public IEnumerable<AvgSpentPerVisit> GetAvgSpentPerVisit(int lookBackDays = 30)
        {
            var avgSpentData = (
                from t in _context.Transactions
                join s in _context.Stores on t.StoreId equals s.StoreId
                group t by t.TransactionDate into g
                select new AvgSpentPerVisit
                {
                    TransactionDate = g.Key,
                    AvgSpent = g.Average(x => x.Cost)
                }).ToList();

            return avgSpentData;
        }

        //public IEnumerable<Store> GetStores()
        //{
        //    var stores = _context.Stores.ToList();
        //    var domainStores = List...new Store { }
        //    return (IEnumerable<Store>)stores;
        //}
    }
}
