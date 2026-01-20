using SimplyShopAPI.Domain.Models;
using SimplyShopAPI.Domain.Transactions;

namespace SimplyShopAPI.Application.Services
{
    public interface IPricingService
    {
        public Task<IEnumerable<AvgSpentPerVisit>> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false);
        public Task<IReadOnlyList<DailyItemPricingStats>> GetDailyItemPricingStatsAsync(string itemName, int lookBackDays = 30);
    }
}
