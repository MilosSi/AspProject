using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class added_more_userusecases_2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "RoleUseCases",
                columns: new[] { "Id", "Data", "RoleId", "UseCaseId", "UsrCaseName" },
                values: new object[] { 7, null, 2, 17, null });

            migrationBuilder.InsertData(
                table: "RoleUseCases",
                columns: new[] { "Id", "Data", "RoleId", "UseCaseId", "UsrCaseName" },
                values: new object[] { 8, null, 2, 18, null });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "RoleUseCases",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "RoleUseCases",
                keyColumn: "Id",
                keyValue: 8);
        }
    }
}
