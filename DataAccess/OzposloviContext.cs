using Domain;
using EFDataAccess.Configurations;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess
{
    public class OzposloviContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //Inicijalni podaci
            var Cateogires = new List<Category>
            {
                new Category
                {
                    Id=1,
                    CategoryName="IT Oblast",
                    IsActive=true
                },
                new Category
                {
                    Id=2,
                    CategoryName="Menadzment",
                    IsActive=true
                },
                new Category
                {
                    Id=3,
                    CategoryName="Administriranje",
                    IsActive=true
                },
                new Category
                {
                    Id=4,
                    CategoryName="Dizajn",
                    IsActive=true
                },
                new Category
                {
                    Id=5,
                    CategoryName="Ekonomija",
                    IsActive=true
                },
                new Category
                {
                    Id=6,
                    CategoryName="Ostalo",
                    IsActive=true
                },

            };

            var roles = new List<Role>
            {
                new Role
                {
                    Id=1,
                    RoleName="Admin",
                     IsActive=true
                },
                new Role
                {
                    Id=2,
                    RoleName="User",
                    IsActive=true
                },
            };

            var usecases = new List<RoleUseCases>
            {
                new RoleUseCases
                {
                    Id=1,
                    RoleId=2,
                    UseCaseId=3
                },
                  new RoleUseCases
                {
                    Id=2,
                    RoleId=2,
                    UseCaseId=4
                },
                new RoleUseCases
                {
                    Id=3,
                    RoleId=2,
                    UseCaseId=6
                },
                new RoleUseCases
                {
                    Id=4,
                    RoleId=2,
                    UseCaseId=11
                },
                new RoleUseCases
                {
                    Id=5,
                    RoleId=2,
                    UseCaseId=12
                },
                new RoleUseCases
                {
                    Id=6,
                    RoleId=2,
                    UseCaseId=16
                },
                new RoleUseCases
                {
                    Id=7,
                    RoleId=2,
                    UseCaseId=17
                },
                new RoleUseCases
                {
                    Id=8,
                    RoleId=2,
                    UseCaseId=18
                },
                new RoleUseCases
                {
                    Id=9,
                    RoleId=2,
                    UseCaseId=23
                },
                new RoleUseCases
                {
                    Id=10,
                    RoleId=2,
                    UseCaseId=24
                },
                new RoleUseCases
                {
                    Id=11,
                    RoleId=2,
                    UseCaseId=25
                },
            };

            modelBuilder.Entity<Category>().HasData(Cateogires);
            modelBuilder.Entity<Role>().HasData(roles);
            modelBuilder.Entity<RoleUseCases>().HasData(usecases);

            //Konfiguracije
            modelBuilder.ApplyConfiguration(new LocationConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new JobConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new JobUserConfiguration());
            modelBuilder.ApplyConfiguration(new RoleConfiguration());

            //Filteri
            modelBuilder.Entity<Job>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Job>().HasQueryFilter(p => p.IsActive);
            modelBuilder.Entity<Location>().HasQueryFilter(l => !l.IsDeleted);
            modelBuilder.Entity<Location>().HasQueryFilter(l => l.IsActive);
            modelBuilder.Entity<Category>().HasQueryFilter(l => !l.IsDeleted);
            modelBuilder.Entity<Category>().HasQueryFilter(l => l.IsActive);
            modelBuilder.Entity<JobUser>().HasQueryFilter(l => !l.IsDeleted);
            modelBuilder.Entity<JobUser>().HasQueryFilter(l => l.IsActive);

            //Kljucevi
            modelBuilder.Entity<JobCategory>().HasKey(k => new { k.JobId, k.CategoryId });
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-EDGHTTU;Initial Catalog=Ozposlovi;Integrated Security=True");
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is BaseEntity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.CreatedAt = DateTime.Now;
                            e.IsActive = true;
                            e.IsDeleted = false;
                            e.DeletedAt = null;
                            e.ModifiedAt = null;
                            break;
                        case EntityState.Modified:
                            e.ModifiedAt = DateTime.Now;
                            break;
                    }
                }
            }
            return base.SaveChanges();
        }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<JobCategory> JobCategories { get; set; }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<JobLocation> JobLocations { get; set; }
  
        public DbSet<User> Users { get; set; }
        public DbSet<UseCaseLogger> UseCaseLoggers { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RoleUseCases> RoleUseCases { get; set; }
        public DbSet<JobUser> JobUsers { get; set; }
    }
}
