using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Interfaces
{
    public interface IStoreRepository
    {
        public Task<IEnumerable<StoreSummary>> GetStoreSummaries(string? city, string? productName, int rows = 10);
    }
}
