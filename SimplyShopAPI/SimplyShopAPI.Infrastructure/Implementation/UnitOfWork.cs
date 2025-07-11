using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Infrastructure.Context;
using SimplyShopAPI.Infrastructure.Repositories;

namespace SimplyShopAPI.Infrastructure.Implementation
{
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        private readonly SimplyShopContext _context;

        public UnitOfWork(SimplyShopContext context)
        {
            _context = context;
            TransactionRepository = new TransactionRepository(_context);
            ProductRepository = new ProductRepository(_context);
            StoreRepository = new StoreRepository(_context);
            BrandRepository = new BrandRepository(_context);
        }

        public ITransactionRepository TransactionRepository { get; private set; }
        public IProductRepository ProductRepository { get; private set; }
        public IStoreRepository StoreRepository { get; private set; }
        public IBrandRepository BrandRepository { get; private set; }

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
