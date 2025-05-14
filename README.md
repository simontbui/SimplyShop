### Running the project locally
1. Install Docker
2. Clone the repo
3. CD into the project
4. Run `docker compose up -d`

You now have the project running! There are three interfaces that are now accessible:

- Web App: `http://localhost:3000/`
- API (Swagger): `http://localhost:7073/swagger`
- PgAdmin4 (PostgreSQL): `http://localhost:8080/`

To setup PgAdmin via `http://localhost:8080/`:
- Login using admin@admin.com / root
- Register a server using these settings:
    - General Tab
        - Name: SimplyShop
    - Connection Tab
        - Host name/address: <instructions below>
        - Port: 5432
        - Maintenance database: postgres
        - Username: root
        - Password: root

** The host address for the Postgres database can be found by running this in your CLI (after the containers are running): 
```
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' simplyshop-pgdatabase-1
```