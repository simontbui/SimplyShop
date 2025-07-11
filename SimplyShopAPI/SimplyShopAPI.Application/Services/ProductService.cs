using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Services
{
    public class ProductService : IProductService
    {
        private readonly IUnitOfWork _uow;

        public ProductService(IUnitOfWork uow)
        {
            _uow = uow;
        }

        public async Task<IEnumerable<ProductSummary>> GetProductSummaries(string? city, int rows = 10)
        {
            var data = await _uow.ProductRepository.GetProductSummaries(city, rows);
            return data;
        }
    }
}
