using SimplyShopAPI.Domain.Models;

namespace SimplyShopAPI.Application.Services
{
    public interface IBrandService
    {
        public Task<IEnumerable<BrandSummary>> GetBrandSummaries(string? city, string? productName, int rows = 10);
    }
}
