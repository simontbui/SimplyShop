using SimplyShopAPI.Domain.Interfaces;
using System;
using System.Collections.Generic;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class User
    {
        public User()
        {
            Transactions = new HashSet<Transaction>();
        }

        public int UserId { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string StreetAddress { get; set; } = null!;
        public string CityAddress { get; set; } = null!;
        public string StateAddress { get; set; } = null!;
        public string ZipAddress { get; set; } = null!;
        public DateOnly DateCreated { get; set; }
        public DateOnly? LastUpdated { get; set; }

        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
