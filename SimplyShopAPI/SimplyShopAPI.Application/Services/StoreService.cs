using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Application.Services
{
    public class StoreService : IStoreService
    {
        private readonly IUnitOfWork _uow;

        public StoreService(IUnitOfWork uow)
        {
            _uow = uow;
        }

        public async Task<IEnumerable<StoreSummary>> GetStoreSummaries(string? city, string? productName, int rows = 10)
        {
            var data = await _uow.StoreRepository.GetStoreSummaries(city, productName, rows);

            return data;
        }
    }
}
