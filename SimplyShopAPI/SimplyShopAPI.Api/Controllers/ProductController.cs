using Microsoft.AspNetCore.Mvc;
using SimplyShopAPI.Application.Services;

namespace SimplyShopAPI.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }

        [HttpGet]
        [Route("summaries")]
        public async Task<IActionResult> GetProductSummaries(string? city, int rows = 10)
        {
            var data = await _productService.GetProductSummaries(city, rows);
            return Ok(data);
        }
    }
}
