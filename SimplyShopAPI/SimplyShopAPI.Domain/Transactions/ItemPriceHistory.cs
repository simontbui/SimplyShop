using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Transactions
{
    public class ItemPriceHistory
    {
        public DateOnly TransactionDay { get; init; }
        public decimal AvgUnitCost { get; init; }
        public int TransactionCount { get; init; }
    }
}
