using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class UserProfile
    {
        public int ProfileId { get; set; }

        //not enforced as a FK; need to ensure operations ensure integrity
        public string IdentityUserId { get; set; } = null!; 
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string? ZipCode { get; set; } = null;

        public ICollection<Transaction> Transactions { get; set; } = new List<Transaction>();

    }
}
