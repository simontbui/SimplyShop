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
        [Route("daily-pricing")]
        public async Task<IActionResult> GetDailyItemPricing(string itemName, int lookBackDays = 30)
        {
            var data = await _pricingService.GetDailyItemPricingStatsAsync(itemName, lookBackDays);
            return Ok(data);
        }
    }
}
