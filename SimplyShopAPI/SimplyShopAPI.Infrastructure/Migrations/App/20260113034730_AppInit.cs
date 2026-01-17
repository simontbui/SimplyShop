using System;
using Microsoft.EntityFrameworkCore.Migrations;
using NetTopologySuite.Geometries;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace SimplyShopAPI.Infrastructure.Migrations.App
{
    /// <inheritdoc />
    public partial class AppInit : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("Npgsql:PostgresExtension:postgis", ",,");

            migrationBuilder.CreateTable(
                name: "brands",
                columns: table => new
                {
                    brand_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    brand_name = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    brand_name_display = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    date_created = table.Column<DateTime>(type: "timestamp with time zone", nullable: false, defaultValueSql: "now()"),
                    last_updated = table.Column<DateTime>(type: "timestamp with time zone", nullable: true, defaultValueSql: "now()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_brands", x => x.brand_id);
                });

            migrationBuilder.CreateTable(
                name: "items",
                columns: table => new
                {
                    item_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    item_name = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    item_name_display = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    date_created = table.Column<DateTime>(type: "timestamp with time zone", nullable: false, defaultValueSql: "now()"),
                    last_updated = table.Column<DateTime>(type: "timestamp with time zone", nullable: true, defaultValueSql: "now()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_items", x => x.item_id);
                });

            migrationBuilder.CreateTable(
                name: "store_statuses",
                columns: table => new
                {
                    store_status_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    store_status_name = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_store_statuses", x => x.store_status_id);
                });

            migrationBuilder.CreateTable(
                name: "unit_types",
                columns: table => new
                {
                    unit_type_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    unit_type_name = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    unit_type_abbrev = table.Column<string>(type: "character varying(25)", maxLength: 25, nullable: true),
                    date_created = table.Column<DateTime>(type: "timestamp with time zone", nullable: false, defaultValueSql: "now()"),
                    last_updated = table.Column<DateTime>(type: "timestamp with time zone", nullable: true, defaultValueSql: "now()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_unit_types", x => x.unit_type_id);
                });

            migrationBuilder.CreateTable(
                name: "user_profiles",
                columns: table => new
                {
                    profile_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    identity_user_id = table.Column<string>(type: "text", nullable: false),
                    first_name = table.Column<string>(type: "character varying(25)", maxLength: 25, nullable: false),
                    last_name = table.Column<string>(type: "character varying(25)", maxLength: 25, nullable: false),
                    zip_code = table.Column<string>(type: "character varying(6)", maxLength: 6, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_user_profiles", x => x.profile_id);
                });

            migrationBuilder.CreateTable(
                name: "stores",
                columns: table => new
                {
                    store_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    store_name = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: false),
                    store_name_display = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: false),
                    street_address = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    city_address = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    state_address = table.Column<string>(type: "character varying(2)", maxLength: 2, nullable: false),
                    zip_address = table.Column<string>(type: "character varying(6)", maxLength: 6, nullable: false),
                    latitude = table.Column<double>(type: "double precision", nullable: true),
                    longitude = table.Column<double>(type: "double precision", nullable: true),
                    location = table.Column<Point>(type: "geometry (point, 4326)", nullable: true),
                    date_created = table.Column<DateTime>(type: "timestamp with time zone", nullable: false, defaultValueSql: "now()"),
                    last_updated = table.Column<DateTime>(type: "timestamp with time zone", nullable: true, defaultValueSql: "now()"),
                    store_status_id = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_stores", x => x.store_id);
                    table.ForeignKey(
                        name: "stores_store_status_id_fkey",
                        column: x => x.store_status_id,
                        principalTable: "store_statuses",
                        principalColumn: "store_status_id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "products",
                columns: table => new
                {
                    product_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    item_id = table.Column<int>(type: "integer", nullable: false),
                    unit_type_id = table.Column<int>(type: "integer", nullable: true),
                    brand_id = table.Column<int>(type: "integer", nullable: true),
                    date_created = table.Column<DateTime>(type: "timestamp with time zone", nullable: false, defaultValueSql: "now()"),
                    last_updated = table.Column<DateTime>(type: "timestamp with time zone", nullable: true, defaultValueSql: "now()")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_products", x => x.product_id);
                    table.ForeignKey(
                        name: "products_brand_id_fkey",
                        column: x => x.brand_id,
                        principalTable: "brands",
                        principalColumn: "brand_id",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "products_item_id_fkey",
                        column: x => x.item_id,
                        principalTable: "items",
                        principalColumn: "item_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "products_unit_type_id_fkey",
                        column: x => x.unit_type_id,
                        principalTable: "unit_types",
                        principalColumn: "unit_type_id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "package_definitions",
                columns: table => new
                {
                    product_id = table.Column<int>(type: "integer", nullable: false),
                    unit_type_id = table.Column<int>(type: "integer", nullable: false),
                    package_description = table.Column<string>(type: "text", nullable: true),
                    package_size = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_package_definitions", x => x.product_id);
                    table.ForeignKey(
                        name: "package_definitions_product_id_fkey",
                        column: x => x.product_id,
                        principalTable: "products",
                        principalColumn: "product_id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "package_definitions_unit_type_id_fkey",
                        column: x => x.unit_type_id,
                        principalTable: "unit_types",
                        principalColumn: "unit_type_id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "transactions",
                columns: table => new
                {
                    transaction_id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    quantity = table.Column<decimal>(type: "numeric", nullable: false),
                    cost = table.Column<decimal>(type: "numeric(12,2)", precision: 12, scale: 2, nullable: false),
                    transaction_date = table.Column<DateTime>(type: "timestamp with time zone", nullable: false, defaultValueSql: "now()"),
                    profile_id = table.Column<int>(type: "integer", nullable: true),
                    store_id = table.Column<int>(type: "integer", nullable: false),
                    product_id = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_transactions", x => x.transaction_id);
                    table.ForeignKey(
                        name: "transactions_product_id_fkey",
                        column: x => x.product_id,
                        principalTable: "products",
                        principalColumn: "product_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "transactions_store_id_fkey",
                        column: x => x.store_id,
                        principalTable: "stores",
                        principalColumn: "store_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "transactions_user_profile_id_fkey",
                        column: x => x.profile_id,
                        principalTable: "user_profiles",
                        principalColumn: "profile_id");
                });

            migrationBuilder.CreateIndex(
                name: "unique_brand_names",
                table: "brands",
                column: "brand_name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "unique_item_names",
                table: "items",
                column: "item_name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_package_definitions_unit_type_id",
                table: "package_definitions",
                column: "unit_type_id");

            migrationBuilder.CreateIndex(
                name: "IX_products_brand_id",
                table: "products",
                column: "brand_id");

            migrationBuilder.CreateIndex(
                name: "IX_products_unit_type_id",
                table: "products",
                column: "unit_type_id");

            migrationBuilder.CreateIndex(
                name: "unique_products",
                table: "products",
                columns: new[] { "item_id", "brand_id", "unit_type_id" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "unique_store_statuses",
                table: "store_statuses",
                column: "store_status_name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_stores_store_status_id",
                table: "stores",
                column: "store_status_id");

            migrationBuilder.CreateIndex(
                name: "unique_stores",
                table: "stores",
                columns: new[] { "store_name", "street_address", "zip_address" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_transactions_product_id",
                table: "transactions",
                column: "product_id");

            migrationBuilder.CreateIndex(
                name: "IX_transactions_profile_id",
                table: "transactions",
                column: "profile_id");

            migrationBuilder.CreateIndex(
                name: "IX_transactions_store_id",
                table: "transactions",
                column: "store_id");

            migrationBuilder.CreateIndex(
                name: "unique_unit_types",
                table: "unit_types",
                column: "unit_type_name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "unique_identity_user_id",
                table: "user_profiles",
                column: "identity_user_id",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "package_definitions");

            migrationBuilder.DropTable(
                name: "transactions");

            migrationBuilder.DropTable(
                name: "products");

            migrationBuilder.DropTable(
                name: "stores");

            migrationBuilder.DropTable(
                name: "user_profiles");

            migrationBuilder.DropTable(
                name: "brands");

            migrationBuilder.DropTable(
                name: "items");

            migrationBuilder.DropTable(
                name: "unit_types");

            migrationBuilder.DropTable(
                name: "store_statuses");
        }
    }
}
