using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using SimplyShopAPI.Domain.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Services
{
    public class PricingService : IPricingService
    {
        private readonly IUnitOfWork _uow;

        public PricingService(IUnitOfWork uow)
        {
            _uow = uow;
        }
            
        public async Task<IEnumerable<AvgSpentPerVisit>> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false)
        {
            var data = await _uow.TransactionRepository.GetAvgSpentPerVisit();
            return data;
        }

        public Task<IReadOnlyList<DailyItemPricingStats>> GetDailyItemPricingStatsAsync(string itemName, int lookBackDays = 30)
        {
            if (string.IsNullOrWhiteSpace(itemName))
                return Task.FromResult<IReadOnlyList<DailyItemPricingStats>>([]);

            lookBackDays = Math.Clamp(lookBackDays, 1, 365);

            return _uow.TransactionRepository.GetDailyItemPricingStatsAsync(itemName.Trim(), lookBackDays);
        }
    }
}
