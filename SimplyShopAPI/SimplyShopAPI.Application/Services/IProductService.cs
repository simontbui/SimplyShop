using SimplyShopAPI.Domain.Models;

namespace SimplyShopAPI.Application.Services
{
    public interface IProductService
    {
        Task<IEnumerable<ProductSummary>> GetProductSummaries(string? city, int rows = 10);
    }
}
