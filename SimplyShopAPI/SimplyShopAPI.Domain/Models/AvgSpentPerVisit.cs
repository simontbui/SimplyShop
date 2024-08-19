using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Models
{
    public class AvgSpentPerVisit
    {
        public DateOnly TransactionDate { get; set; }
        public decimal AvgSpent { get; set; }
    }
}
