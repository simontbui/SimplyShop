using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace SimplyShopAPI.Domain.Models
{
    public class ProductSummary
    {
        public int? UnitTypeId { get; set; }
        public string ProductName { get; set; } = null!;
        public int TransactionCount { get; set; }
        public decimal AvgTransactionAmt { get; set; }
    }
}
