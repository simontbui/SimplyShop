using SimplyShopAPI.Domain.Models;

namespace SimplyShopAPI.Application.Services
{
    public interface IProductService
    {
        IEnumerable<Product> GetMostPopularProducts(string? city, int rows = 10);
    }
}
