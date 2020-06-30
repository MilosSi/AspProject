using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class added_usecaseloging_usernull_options : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UseCaseLoggers_Users_UserId",
                table: "UseCaseLoggers");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "UseCaseLoggers",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_UseCaseLoggers_Users_UserId",
                table: "UseCaseLoggers",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UseCaseLoggers_Users_UserId",
                table: "UseCaseLoggers");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "UseCaseLoggers",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_UseCaseLoggers_Users_UserId",
                table: "UseCaseLoggers",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
