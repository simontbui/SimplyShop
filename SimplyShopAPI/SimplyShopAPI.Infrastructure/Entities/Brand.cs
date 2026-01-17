using System;
using System.Collections.Generic;
using SimplyShopAPI.Domain.Interfaces;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Brand
    {
        public int BrandId { get; set; }
        public string BrandName { get; set; } = null!;
        public string BrandNameDisplay { get; set; } = null!;
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }

        public virtual ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
