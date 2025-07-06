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
            
        public IEnumerable<Product> GetMostPopularProducts(string? city, int rows = 10)
        {
            var data = _uow.ProductRepository.GetMostPopularProducts(city, rows);
            return data;
        }
    }
}
