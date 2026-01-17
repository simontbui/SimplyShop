using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class StoreStatus
    {
        public int StoreStatusId { get; set; }
        public string StoreStatusName { get; set; } = null!;

        public ICollection<Store> Stores { get; set; } = new List<Store>();
    }
}
