using System;
using System.Collections.Generic;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Transaction
    {
        public int TransactionId { get; set; }
        public decimal Quantity { get; set; }
        public decimal Cost { get; set; }
        public DateTime TransactionDate { get; set; }

        public int? ProfileId { get; set; }
        public int StoreId { get; set; }
        public int ProductId { get; set; }

        public virtual Product Product { get; set; } = null!;
        public virtual Store Store { get; set; } = null!;
        public virtual UserProfile UserProfile { get; set; } = null!;
    }
}
