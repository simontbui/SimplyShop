using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Transactions
{
    public class StorePriceHistory
    {
        public string StoreName { get; init; } = null!;
        public string StreetAddress { get; set; } = null!;
        public string CityAddress { get; set; } = null!;
        public string StateAddress { get; set; } = null!;
        public string ZipAddress { get; set; } = null!;
        public decimal AvgUnitCost { get; init; }
    }
}
