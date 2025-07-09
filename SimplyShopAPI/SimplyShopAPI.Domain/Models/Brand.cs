using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace SimplyShopAPI.Domain.Models
{
    public class Brand
    {
        public int BrandId { get; set; }
        public string? BrandName { get; set; }
    }
}
