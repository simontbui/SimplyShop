using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace SimplyShopAPI.Domain.Models
{
    public class StoreProductPrice
    {
        public int StoreId { get; set; }
        public string StoreName { get; set; } = null!;
        public string StreetAddress { get; set; } = null!;
        public string CityAddress { get; set; } = null!;
        public string StateAddress { get; set; } = null!;
        public string ZipAddress { get; set; } = null!;
        public decimal AvgPrice { get; set; }
    }
}
