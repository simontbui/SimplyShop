using Microsoft.AspNetCore.Mvc;
using SimplyShopAPI.Domain.Interfaces;

namespace SimplyShopAPI.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HomeAnalyticsController : ControllerBase
    {
        private readonly IUnitOfWork _uow;

        public HomeAnalyticsController(IUnitOfWork uow) 
        {
            _uow = uow;
        }

        [HttpGet]
        [Route("average-spent")]
        public IActionResult GetAvgSpentPerVisit()
        {
            var data = _uow.HomeAnalytics.GetAvgSpentPerVisit();
            return Ok(data);
        }

        //[HttpGet]
        //[Route("get-stores")]
        //public IActionResult GetAllStores()
        //{
        //    var data = _uow.HomeAnalytics.GetStores();
        //    return Ok(data);
        //}
    }
}
