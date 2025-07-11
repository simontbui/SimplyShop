using SimplyShopAPI.Domain.Models;

namespace SimplyShopAPI.Application.Services
{
    public interface IProductService
    {
        IEnumerable<ProductSummary> GetProductSummaries(string? city, int rows = 10);
    }
}
