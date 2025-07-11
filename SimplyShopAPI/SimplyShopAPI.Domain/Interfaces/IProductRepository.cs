using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Interfaces
{
    public interface IProductRepository
    {
        Task<IEnumerable<ProductSummary>> GetProductSummaries(string? city, int rows = 10);
    }
}
