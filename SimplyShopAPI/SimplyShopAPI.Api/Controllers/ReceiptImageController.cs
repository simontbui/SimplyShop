using Microsoft.AspNetCore.Mvc;

namespace SimplyShopAPI.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ReceiptImageController : ControllerBase
    {
        [HttpGet]
        public IActionResult PostReceiptImage()
        {
            return Ok("Hello World");
        }
    }
}
