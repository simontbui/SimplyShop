using SimplyShopAPI.Domain.Interfaces;
using System;
using System.Collections.Generic;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Product
    {
        public Product()
        {
            Transactions = new HashSet<Transaction>();
        }

        public int ProductId { get; set; }
        public int? BrandId { get; set; }
        public decimal? Unit { get; set; }
        public string? UnitType { get; set; }
        public string ProductName { get; set; } = null!;
        public DateOnly DateCreated { get; set; }
        public DateOnly? LastUpdated { get; set; }

        public virtual Brand? Brand { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
