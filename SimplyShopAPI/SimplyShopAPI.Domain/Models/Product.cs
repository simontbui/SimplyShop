using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace SimplyShopAPI.Domain.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public decimal? Unit { get; set; }
        public string? UnitType { get; set; }
        public string ProductName { get; set; } = null!;
        public decimal AvgPrice { get; set; }
    }
}
