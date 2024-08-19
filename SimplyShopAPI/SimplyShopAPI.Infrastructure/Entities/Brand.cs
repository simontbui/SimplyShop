using System;
using System.Collections.Generic;
using SimplyShopAPI.Domain.Interfaces;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Brand
    {
        public Brand()
        {
            Products = new HashSet<Product>();
        }

        public int BrandId { get; set; }
        public string BrandName { get; set; } = null!;
        public DateOnly DateCreated { get; set; }
        public DateOnly? LastUpdated { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
