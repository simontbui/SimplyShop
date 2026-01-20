using SimplyShopAPI.Domain.Models;
using SimplyShopAPI.Domain.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Interfaces
{
    public interface ITransactionRepository
    {
        public Task<IEnumerable<AvgSpentPerVisit>> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false);
        public Task<IReadOnlyList<DailyItemPricingStats>> GetDailyItemPricingStatsAsync(string itemName, int lookBackDays = 30);
    }
}
