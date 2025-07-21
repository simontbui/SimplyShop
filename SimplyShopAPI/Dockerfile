FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app

# Copy solution and all projects
COPY . .

# Restore dependencies
RUN dotnet restore SimplyShopAPI.sln

# Optional: build to test dependencies
# RUN dotnet build SimplyShopAPI.sln

CMD ["dotnet", "watch", "run", "--project", "SimplyShopAPI.Api/SimplyShopAPI.Api.csproj", "--urls=http://0.0.0.0:7073"]
