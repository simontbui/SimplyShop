using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace SimplyShopAPI.Infrastructure.Context
{
    public class AppIdentityDbContextFactory : IDesignTimeDbContextFactory<AppIdentityDbContext>
    {
        public AppIdentityDbContext CreateDbContext(string[] args)
        {
            // Find the API folder regardless of where dotnet-ef is being run from
            var dir = new DirectoryInfo(Directory.GetCurrentDirectory());

            while (dir != null && !Directory.Exists(Path.Combine(dir.FullName, "SimplyShopAPI.Api")))
                dir = dir.Parent;

            if (dir == null)
                throw new DirectoryNotFoundException("Could not locate SimplyShopAPI.Api folder from current directory.");

            var apiPath = Path.Combine(dir.FullName, "SimplyShopAPI.Api");

            var configuration = new ConfigurationBuilder()
                .SetBasePath(apiPath)
                .AddJsonFile("appsettings.json", optional: false)
                .AddJsonFile("appsettings.Development.json", optional: true)
                .AddEnvironmentVariables()
                .Build();

            var conn = configuration.GetConnectionString("PostgresConnection")
                       ?? throw new InvalidOperationException("Connection string 'PostgresConnection' not found.");

            var options = new DbContextOptionsBuilder<AppIdentityDbContext>()
                .UseNpgsql(conn)
                .Options;

            return new AppIdentityDbContext(options);
        }
    }
}
