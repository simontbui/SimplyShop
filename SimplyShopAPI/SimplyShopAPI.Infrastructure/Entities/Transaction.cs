using System;
using System.Collections.Generic;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public partial class Transaction
    {
        public int TransactionId { get; set; }
        public int UserId { get; set; }
        public int StoreId { get; set; }
        public int ProductId { get; set; }
        public decimal Quantity { get; set; }
        public decimal Cost { get; set; }
        public DateOnly TransactionDate { get; set; }

        public virtual Product Product { get; set; } = null!;
        public virtual Store Store { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
