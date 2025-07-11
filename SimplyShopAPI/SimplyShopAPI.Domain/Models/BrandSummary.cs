using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace SimplyShopAPI.Domain.Models
{
    public class BrandSummary
    {
        public string BrandName { get; set; }
        public int TransactionCount { get; set; }
        public decimal AvgTransactionAmt { get; set; }
    }
}
