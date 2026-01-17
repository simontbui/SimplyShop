using NetTopologySuite.Geometries;

namespace SimplyShopAPI.Infrastructure.Entities
{
    public class Store
    {
        public int StoreId { get; set; }
        public string StoreName { get; set; } = null!;
        public string StoreNameDisplay { get; set; } = null!;
        public string StreetAddress { get; set; } = null!;
        public string CityAddress { get; set; } = null!;
        public string StateAddress { get; set; } = null!;
        public string ZipAddress { get; set; } = null!;

        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public Point? Location { get; set; } // SRID 4326

        public DateTime DateCreated { get; set; }
        public DateTime? LastUpdated { get; set; }

        public int StoreStatusId { get; set; }

        public virtual StoreStatus? StoreStatus { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; } = new List<Transaction>(); 
    }
}
