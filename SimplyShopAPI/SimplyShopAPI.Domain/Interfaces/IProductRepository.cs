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
        IEnumerable<Product> GetMostPopularProducts(string? city, int rows = 10);
    }
}
