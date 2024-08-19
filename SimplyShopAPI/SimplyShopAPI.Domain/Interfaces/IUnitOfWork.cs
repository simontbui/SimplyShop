using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimplyShopAPI.Domain.Interfaces
{
    public interface IUnitOfWork
    {
        public IHomeAnalyticsRepository HomeAnalytics { get; }
        public void Save();
        public void Dispose();
    }
}
