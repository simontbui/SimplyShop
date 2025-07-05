using Microsoft.EntityFrameworkCore;
using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Infrastructure.Context;
using SimplyShopAPI.Infrastructure.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Implementation
{
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        private readonly SimplyShopContext _context;

        public UnitOfWork(SimplyShopContext context)
        {
            _context = context;
            HomeAnalytics = new HomeAnalyticsRepository(_context);
            TransactionRepository = new TransactionRepository(_context);
            ProductRepository = new ProductRepository(_context);
        }

        public IHomeAnalyticsRepository HomeAnalytics { get; private set; }
        public ITransactionRepository TransactionRepository { get; private set; }
        public IProductRepository ProductRepository { get; private set; }

        public void Save()
        {
            _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
