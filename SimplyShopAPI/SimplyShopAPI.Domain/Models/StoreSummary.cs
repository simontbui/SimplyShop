using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Models
{
    public class StoreSummary
    {
        public string StoreName { get; set; } = null!;
        public string StreetAddress { get; set; } = null!;
        public string CityAddress { get; set; } = null!;
        public string StateAddress { get; set; } = null!;
        public string ZipAddress { get; set; } = null!;
        public int TransactionCount {  get; set; }
        public decimal AvgTransactionAmt { get; set; }
    }
}
