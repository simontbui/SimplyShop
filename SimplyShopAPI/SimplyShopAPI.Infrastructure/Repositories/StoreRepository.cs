using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using SimplyShopAPI.Infrastructure.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Repositories
{
    public class StoreRepository : IStoreRepository
    {
        private readonly SimplyShopContext _context;

        public StoreRepository(SimplyShopContext context)
        {
            _context = context;
        }

        public IEnumerable<StoreSummary> GetStoreSummaries(string? city, string? productName, int rows = 10)
        {
            List<StoreSummary> stores = (from t in _context.Transactions
                                         join p in _context.Products on t.ProductId equals p.ProductId
                                         join s in _context.Stores on t.StoreId equals s.StoreId
                                         where city == null || s.CityAddress.ToLower() == city.ToLower()
                                         where productName == null || p.ProductName.ToLower() == productName.ToLower()
                                         group t by new
                                         {
                                             s.StoreId,
                                             s.StoreName,
                                             s.StreetAddress,
                                             s.CityAddress,
                                             s.StateAddress,
                                             s.ZipAddress
                                         } into g
                                         select new StoreSummary
                                         {
                                             StoreName = g.Key.StoreName,
                                             StreetAddress = g.Key.StreetAddress,
                                             CityAddress = g.Key.CityAddress,
                                             StateAddress = g.Key.StateAddress,
                                             ZipAddress = g.Key.ZipAddress,
                                             TransactionCount = g.Count(),
                                             AvgTransactionAmt = Math.Round(g.Average(x => x.Cost), 2)
                                         })
                                        .OrderByDescending(x => x.AvgTransactionAmt)
                                        .Take(rows)
                                        .ToList();

            return stores;
        }
    }
}