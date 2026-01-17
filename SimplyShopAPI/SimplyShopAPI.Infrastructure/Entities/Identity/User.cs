using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Entities.Identity
{
    public class User : IdentityUser
    {
        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }
    }
}
