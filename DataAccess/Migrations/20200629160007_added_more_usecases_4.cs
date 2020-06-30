using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class added_more_usecases_4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "RoleUseCases",
                columns: new[] { "Id", "Data", "RoleId", "UseCaseId", "UsrCaseName" },
                values: new object[] { 10, null, 2, 24, null });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "RoleUseCases",
                keyColumn: "Id",
                keyValue: 10);
        }
    }
}
