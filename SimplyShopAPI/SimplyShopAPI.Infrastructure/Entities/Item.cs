using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Item
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; } = null!;
        public string ItemNameDisplay { get; set; } = null!;
        //public int ItemStatusId { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }

        //public virtual ItemStatus? ItemStatus { get; set; }
        public ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
