FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
ENV ASPNETCORE_HTTP_PORTS=7073
ENV ASPNETCORE_ENVIRONMENT=Development
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

COPY ["./SimplyShopAPI.Api/SimplyShopAPI.Api.csproj", "src/SimplyShopAPI.Api/"]
COPY ["./SimplyShopAPI.Application/SimplyShopAPI.Application.csproj", "src/SimplyShopAPI.Application/"]
COPY ["./SimplyShopAPI.Domain/SimplyShopAPI.Domain.csproj", "src/SimplyShopAPI.Domain/"]
COPY ["./SimplyShopAPI.Infrastructure/SimplyShopAPI.Infrastructure.csproj", "src/SimplyShopAPI.Infrastructure/"]

RUN dotnet restore "src/SimplyShopAPI.Api/SimplyShopAPI.Api.csproj"
COPY . .

WORKDIR /src/SimplyShopAPI.Api/
RUN dotnet build -c Release -o /app/build

FROM build AS publish
RUN dotnet publish -c Release -o /app/publish
#RUN dotnet publish --no-restore -c Release -o /app/publish

FROM base AS runtime
WORKDIR /app

COPY --from=publish /app/publish .
RUN ls -l
EXPOSE 7073
ENTRYPOINT [ "dotnet", "SimplyShopAPI.Api.dll" ]