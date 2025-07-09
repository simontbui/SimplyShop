using SimplyShopAPI.Domain.Models;

namespace SimplyShopAPI.Application.Services
{
    public interface IProductService
    {
        IEnumerable<Product> GetMostPopularProducts(string? city, int rows = 10);
        IEnumerable<BrandProductCount> GetMostPopularBrands(string? productName, int rows = 10);
        IEnumerable<BrandProductPrice> GetCheapestBrands(string? productName, int rows = 10);
        IEnumerable<StoreProductCount> GetMostPopularStores(string? productName, int rows = 10);
        IEnumerable<StoreProductPrice> GetCheapestStores(string? productName, int rows = 10);
    }
}
