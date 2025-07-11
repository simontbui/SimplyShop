using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Services
{
    public interface IStoreService
    {
        IEnumerable<StoreSummary> GetStoreSummaries(string? city, string? productName, int rows = 10);
    }
}
