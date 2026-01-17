using SimplyShopAPI.Domain.Interfaces;
using System;
using System.Collections.Generic;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Product
    {
        public int ProductId { get; set; }
        public int ItemId { get; set; }
        public int? UnitTypeId { get; set; }
        public int? BrandId { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }

        public virtual Item Item { get; set; } = null!;
        public virtual UnitType UnitType { get; set; } = null!;
        public virtual Brand? Brand { get; set; }
        public ICollection<Transaction> Transactions { get; set; } = new List<Transaction>();
        public virtual PackageDefinition? PackageDefinition { get; set; }
    }
}
