## Migrations

Updating the DB via migration will require running the EF tool commands through docker. 

#### Example
* ` dotnet ef migrations add AddRefreshTokens --project SimplyShopAPI.Infrastructure --startup-project SimplyShopAPI.api --context AppIdentityDbContext
`

* `docker compose run --rm --no-deps simply-shop-api bash -lc "dotnet tool restore && dotnet ef database update --project SimplyShopAPI.Infrastructure --startup-project SimplyShopAPI.Api --context AppIdentityDbContext"`
