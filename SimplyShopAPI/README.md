## Creating Initial Migrations

Main App:
```
dotnet ef migrations add AppInit \
    --context SimplyShopContext \
    --project SimplyShopAPI.Infrastructure \
    --startup-project SimplyShopAPI.Api \
    --output-dir Migrations/App
```

Identity:
```
dotnet ef migrations add IdentityInit \
    --context AppIdentityDbContext \
    --project SimplyShopAPI.Infrastructure \
    --startup-project SimplyShopAPI.Api \
    --output-dir Migrations/Identity
```

## Validating Migration SQL Translation

Main App:
```
dotnet ef migrations script \
    --context SimplyShopContext \
    --project SimplyShopAPI.Infrastructure \
    --startup-project SimplyShopAPI.Api \
    --output app_schemas.sql
```

Identity:
```
dotnet ef migrations script \
    --context AppIdentityDbContext \
    --project SimplyShopAPI.Infrastructure \
    --startup-project SimplyShopAPI.Api \
    --output identity_schemas.sql
```

## Applying Migrations

Updating the DB via migration will require running the EF tool commands through docker. 

#### Example
* ` dotnet ef migrations add AddRefreshTokens --project SimplyShopAPI.Infrastructure --startup-project SimplyShopAPI.api --context AppIdentityDbContext
`

* `docker compose run --rm --no-deps simply-shop-api bash -lc "dotnet tool restore && dotnet ef database update --project SimplyShopAPI.Infrastructure --startup-project SimplyShopAPI.Api --context AppIdentityDbContext"`
