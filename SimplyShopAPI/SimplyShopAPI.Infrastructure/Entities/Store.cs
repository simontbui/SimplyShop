using SimplyShopAPI.Domain.Interfaces;
using System;
using System.Collections.Generic;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Store
    {
        public Store()
        {
            Transactions = new HashSet<Transaction>();
        }

        public int StoreId { get; set; }
        public string StoreName { get; set; } = null!;
        public string StreetAddress { get; set; } = null!;
        public string CityAddress { get; set; } = null!;
        public string StateAddress { get; set; } = null!;
        public string ZipAddress { get; set; } = null!;
        public DateOnly DateCreated { get; set; }
        public DateOnly? LastUpdated { get; set; }

        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
