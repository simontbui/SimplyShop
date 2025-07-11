using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Interfaces
{
    public interface IBrandRepository
    {
        public Task<IEnumerable<BrandSummary>> GetBrandSummaries(string? city, string? productName, int rows = 10);
    }
}
