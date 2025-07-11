using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Services
{
    public class BrandService : IBrandService
    {
        private readonly IUnitOfWork _uow;

        public BrandService(IUnitOfWork uow)
        {
            _uow = uow;
        }

        public async Task<IEnumerable<BrandSummary>> GetBrandSummaries(string? city, string? productName, int rows = 10)
        {
            var data = await _uow.BrandRepository.GetBrandSummaries(city, productName, rows);
            return data;
        }
    }
}
