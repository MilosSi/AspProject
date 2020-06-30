using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class Added_jobuser_relation_and_userconfig : Migration
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

            migrationBuilder.DropForeignKey(
                name: "FK_JobLocations_Locations_LocationId",
                table: "JobLocations");

            migrationBuilder.CreateTable(
                name: "JobUsers",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IsActive = table.Column<bool>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeletedAt = table.Column<DateTime>(nullable: true),
                    CreatedAt = table.Column<DateTime>(nullable: false),
                    ModifiedAt = table.Column<DateTime>(nullable: true),
                    JobId = table.Column<int>(nullable: false),
                    UserId = table.Column<int>(nullable: false),
                    Status = table.Column<int>(nullable: false),
                    JobName = table.Column<string>(maxLength: 255, nullable: false),
                    JobDescription = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_JobUsers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_JobUsers_Jobs_JobId",
                        column: x => x.JobId,
                        principalTable: "Jobs",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_JobUsers_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_JobUsers_JobId",
                table: "JobUsers",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_JobUsers_UserId",
                table: "JobUsers",
                column: "UserId");

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

            migrationBuilder.AddForeignKey(
                name: "FK_JobLocations_Locations_LocationId",
                table: "JobLocations",
                column: "LocationId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
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

            migrationBuilder.DropForeignKey(
                name: "FK_JobLocations_Locations_LocationId",
                table: "JobLocations");

            migrationBuilder.DropTable(
                name: "JobUsers");

            migrationBuilder.AddForeignKey(
                name: "FK_JobCategory_Categories_CategoryId",
                table: "JobCategory",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_JobCategory_Jobs_JobId",
                table: "JobCategory",
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

            migrationBuilder.AddForeignKey(
                name: "FK_JobLocations_Locations_LocationId",
                table: "JobLocations",
                column: "LocationId",
                principalTable: "Locations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
