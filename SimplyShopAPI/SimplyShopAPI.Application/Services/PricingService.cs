using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    }
}
