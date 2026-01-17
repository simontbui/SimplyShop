using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class ItemStatus
    {
        public int ItemStatusId { get; set; }
        public string ItemStatusName { get; set; } = null!;

        public ICollection<Item> Items { get; set; } = new List<Item>();
    }
}
