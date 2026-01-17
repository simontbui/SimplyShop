using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class PackageDefinition
    {
        public int ProductId { get; set; }
        public int UnitTypeId { get; set; }
        public string? PackageDescr { get; set; }    
        public Decimal PackageSize { get; set; } = Decimal.Zero;

        public virtual Product Product { get; set; } = null!;
        public virtual UnitType UnitType { get; set; } = null!;
    }
}
