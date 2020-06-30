using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class removed_jobcat_and_jobloc_delete_options : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_JobCategory_Categories_CategoryId",
                table: "JobCategory");

            migrationBuilder.DropForeignKey(
                name: "FK_JobCategory_Jobs_JobId",
                table: "JobCategory");

            migrationBuilder.DropForeignKey(
                name: "FK_JobLocations_Jobs_JobId",
                table: "JobLocations");

            migrationBuilder.DropPrimaryKey(
                name: "PK_JobCategory",
                table: "JobCategory");

            migrationBuilder.RenameTable(
                name: "JobCategory",
                newName: "JobCategories");

            migrationBuilder.RenameIndex(
                name: "IX_JobCategory_CategoryId",
                table: "JobCategories",
                newName: "IX_JobCategories_CategoryId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_JobCategories",
                table: "JobCategories",
                columns: new[] { "JobId", "CategoryId" });

            migrationBuilder.AddForeignKey(
                name: "FK_JobCategories_Categories_CategoryId",
                table: "JobCategories",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_JobCategories_Jobs_JobId",
                table: "JobCategories",
                column: "JobId",
                principalTable: "Jobs",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_JobLocations_Jobs_JobId",
                table: "JobLocations",
                column: "JobId",
                principalTable: "Jobs",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_JobCategories_Categories_CategoryId",
                table: "JobCategories");

            migrationBuilder.DropForeignKey(
                name: "FK_JobCategories_Jobs_JobId",
                table: "JobCategories");

            migrationBuilder.DropForeignKey(
                name: "FK_JobLocations_Jobs_JobId",
                table: "JobLocations");

            migrationBuilder.DropPrimaryKey(
                name: "PK_JobCategories",
                table: "JobCategories");

            migrationBuilder.RenameTable(
                name: "JobCategories",
                newName: "JobCategory");

            migrationBuilder.RenameIndex(
                name: "IX_JobCategories_CategoryId",
                table: "JobCategory",
                newName: "IX_JobCategory_CategoryId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_JobCategory",
                table: "JobCategory",
                columns: new[] { "JobId", "CategoryId" });

            migrationBuilder.AddForeignKey(
                name: "FK_JobCategory_Categories_CategoryId",
                table: "JobCategory",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_JobCategory_Jobs_JobId",
                table: "JobCategory",
                column: "JobId",
                principalTable: "Jobs",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_JobLocations_Jobs_JobId",
                table: "JobLocations",
                column: "JobId",
                principalTable: "Jobs",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
