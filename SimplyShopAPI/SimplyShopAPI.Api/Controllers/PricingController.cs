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
        public IActionResult GetAvgSpentPerVisit()
        {
            var data = _pricingService.GetAvgSpentPerVisit();
            return Ok(data);
        }
    }
}
