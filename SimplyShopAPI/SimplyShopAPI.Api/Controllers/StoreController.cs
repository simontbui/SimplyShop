using Microsoft.AspNetCore.Mvc;
using SimplyShopAPI.Application.Services;

namespace SimplyShopAPI.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StoreController : ControllerBase
    {
        private readonly IStoreService _storeService;

        public StoreController(IStoreService storeService)
        {
            _storeService = storeService;
        }

        [HttpGet]
        [Route("summaries")]
        public async Task<IActionResult> GetMostPopularProducts(string? city, string? productName, int rows = 10)
        {
            var data = await _storeService.GetStoreSummaries(city, productName, rows);
            return Ok(data);
        }
    }
}
