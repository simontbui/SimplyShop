using Microsoft.AspNetCore.Mvc;
using SimplyShopAPI.Application.Services;

namespace SimplyShopAPI.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BrandController : ControllerBase
    {
        private readonly IBrandService _brandService;

        public BrandController(IBrandService brandService)
        {
            _brandService = brandService;
        }

        [HttpGet]
        [Route("summaries")]
        public async Task<IActionResult> GetBrandSummaries(string? city, string? productName, int rows = 10)
        {
            var data = await _brandService.GetBrandSummaries(city, productName, rows);
            return Ok(data);
        }
    }
}
