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

        public IEnumerable<Store> GetMostPopularStore()
        {
            throw new NotImplementedException();
        }

        //public IEnumerable<Store> GetStores()
        //{
        //    var stores = _context.Stores.Select(x => new Store { ... })ToList();
        //    var domainStores = List...new Store { }
        //    return (IEnumerable<Store>)stores;
        //}
    }
}
