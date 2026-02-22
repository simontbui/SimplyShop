using Microsoft.AspNetCore.Mvc;
using SimplyShopAPI.Application.Services;

namespace SimplyShopAPI.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PricingController : ControllerBase
    {
        private readonly IPricingService _pricingService;

        public PricingController(IPricingService pricingService)
        {
            _pricingService = pricingService;
        }

        [HttpGet]
        [Route("average-visit")]
        public async Task<IActionResult> GetAvgSpentPerVisit()
        {
            var data = await _pricingService.GetAvgSpentPerVisit();
            return Ok(data);
        }

        [HttpGet]
        [Route("historical")]
        public async Task<IActionResult> GetHistoricalItemPrice(string itemName, int lookBackDays = 30)
        {
            var data = await _pricingService.GetHistoricalItemPriceAsync(itemName, lookBackDays);
            return Ok(data);
        }

        [HttpGet]
        [Route("stores/cheapest")]
        public async Task<IActionResult> GetStoreCosts(string itemName, int lookBackDays = 30)
        {
            var data = await _pricingService.GetStoreCostsAsync(itemName, lookBackDays);
            return Ok(data);
        }
    }
}
