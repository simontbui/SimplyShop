using SimplyShopAPI.Domain.Models;

namespace SimplyShopAPI.Application.Services
{
    public interface IPricingService
    {
        IEnumerable<AvgSpentPerVisit> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false);
    }
}
