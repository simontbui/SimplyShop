using SimplyShopAPI.Domain.Models;
using SimplyShopAPI.Domain.Transactions;

namespace SimplyShopAPI.Application.Services
{
    public interface IPricingService
    {
        public Task<IEnumerable<AvgSpentPerVisit>> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false);
        public Task<IReadOnlyList<ItemPriceHistory>> GetHistoricalItemPriceAsync(string itemName, int lookBackDays = 30);
        public Task<IEnumerable<StorePriceHistory>> GetStoreCostsAsync(string itemName, int lookBackDays);
    }
}
