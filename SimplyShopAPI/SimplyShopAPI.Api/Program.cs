using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using SimplyShopAPI.Api.ExceptionHandling;
using SimplyShopAPI.Api.Services;
using SimplyShopAPI.Application.Auth.Interfaces;
using SimplyShopAPI.Application.Auth.Services;
using SimplyShopAPI.Application.Helpers;
using SimplyShopAPI.Application.Services;
using SimplyShopAPI.Domain.Interfaces;
using SimplyShopAPI.Infrastructure.Context;
using SimplyShopAPI.Infrastructure.Entities.Identity;
using SimplyShopAPI.Infrastructure.Implementation;
using SimplyShopAPI.Infrastructure.Implementation.Auth;
using SimplyShopAPI.Infrastructure.Migrations.Seed;
using SimplyShopAPI.Infrastructure.Repositories;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
var MyCorsPolicy = "_MyCorsPolicy";
var conn = builder.Configuration.GetConnectionString("PostgresConnection");

// Add services to the container.

builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.Converters.Add(new DateOnlyJsonConverter());
    });

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Identity
builder.Services
    .AddIdentityCore<User>(options =>
    {
        options.User.RequireUniqueEmail = true;

        // Basic password policy
        options.Password.RequiredLength = 8;
        options.Password.RequireDigit = true;
        options.Password.RequireNonAlphanumeric = false;
        options.Password.RequireUppercase = false;
        options.Password.RequireLowercase = false;
    })
    .AddEntityFrameworkStores<AppIdentityDbContext>()
    .AddSignInManager()
    .AddDefaultTokenProviders();

// JWT Auth
var jwtSection = builder.Configuration.GetSection("Jwt");
var jwtKey = jwtSection["Key"] ?? throw new Exception("Jwt:Key missing");
var jwtIssuer = jwtSection["Issuer"] ?? throw new Exception("Jwt:Issuer missing");
var jwtAudience = jwtSection["Audience"] ?? throw new Exception("Jwt:Audience missing");

builder.Services
    .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = jwtIssuer,
            ValidAudience = jwtAudience,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey)),
            ClockSkew = TimeSpan.FromMinutes(1)
        };
    });

builder.Services.AddAuthorization();

builder.Services.AddDbContext<AppIdentityDbContext>(options =>
    options.UseNpgsql(conn, npgsql =>
    {
        npgsql.MigrationsHistoryTable("__EFMigrationsHistory_Identity");
    })
    .LogTo(Console.WriteLine, LogLevel.Information)
    .EnableSensitiveDataLogging()
    //last 2 options for early development; prod security risk
);

builder.Services.AddDbContext<SimplyShopContext>(options =>
    options.UseNpgsql(conn, npgsql =>
    {
        npgsql.UseNetTopologySuite();
        npgsql.MigrationsHistoryTable("__EFMigrationsHistory_SimplyShop");
    })
    .LogTo(Console.WriteLine, LogLevel.Information)
    .EnableSensitiveDataLogging()
    //last 2 options for early development; prod security risk
);

builder.Services.AddScoped<IPricingService, PricingService>();
builder.Services.AddScoped<IProductService, ProductService>();
builder.Services.AddScoped<IStoreService, StoreService>();
builder.Services.AddScoped<IBrandService, BrandService>();
builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IIdentityService, IdentityService>();
builder.Services.AddScoped<ITokenService, JwtTokenService>();
builder.Services.AddScoped<IRefreshTokenGenerator, RefreshTokenGenerator>();
builder.Services.AddScoped<IRefreshTokenRepository, RefreshTokenRepository>();
builder.Services.AddScoped<IIdentityUnitOfWork, IdentityUnitOfWork>();

builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();

//Temporary for local dev; need to reconfigure later
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyCorsPolicy,
        policy =>
        {
            policy.WithOrigins("http://localhost:3000")
                .AllowAnyHeader()
                .AllowAnyMethod()
                .AllowCredentials();
        });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseExceptionHandler();

app.UseHttpsRedirection();

app.UseCors(MyCorsPolicy);

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

if (args.Contains("--seed"))
{
    using var scope = app.Services.CreateScope();

    var simplyShopDb = scope.ServiceProvider.GetRequiredService<SimplyShopContext>();
    var identityDb = scope.ServiceProvider.GetRequiredService<AppIdentityDbContext>();

    //performs migrations if not already done
    await simplyShopDb.Database.MigrateAsync();
    await identityDb.Database.MigrateAsync();

    await DbSeeder.SeedAsync(scope.ServiceProvider);
    return;
}

app.Run();
