using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class UnitType
    {
        public int UnitTypeId { get; set; }
        public string UnitTypeName { get; set; } = null!;
        public string? UnitTypeAbbrev{ get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }

        public ICollection<Product> Products { get; set; } = new List<Product>();
        public ICollection<PackageDefinition> PackageDefinitions { get; set; } = new List<PackageDefinition>();
    }
}
