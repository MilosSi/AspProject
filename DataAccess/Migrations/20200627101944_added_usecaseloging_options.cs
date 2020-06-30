using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class added_usecaseloging_options : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Data",
                table: "RoleUseCases",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UsrCaseName",
                table: "RoleUseCases",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Data",
                table: "RoleUseCases");

            migrationBuilder.DropColumn(
                name: "UsrCaseName",
                table: "RoleUseCases");
        }
    }
}
