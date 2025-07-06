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
        [Route("most-popular-products")]
        public IActionResult GetMostPopularProducts(string? city, int rows = 10)
        {
            var data = _productService.GetMostPopularProducts(city, rows);
            return Ok(data);
        }
    }
}
