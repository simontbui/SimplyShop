using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Interfaces
{
    public interface ITransactionRepository
    {
        IEnumerable<AvgSpentPerVisit> GetAvgSpentPerVisit(int lookBackDays = 30, bool groupByMonth = false);
    }
}
