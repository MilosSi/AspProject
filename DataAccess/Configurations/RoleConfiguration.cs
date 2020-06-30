using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    class RoleConfiguration : IEntityTypeConfiguration<Role>
    {
        public void Configure(EntityTypeBuilder<Role> builder)
        {
            builder.Property(r => r.RoleName)
                .IsRequired()
                .HasMaxLength(50);
            builder.HasIndex(r => r.RoleName).IsUnique();

            builder.HasMany(r => r.Users).WithOne(u => u.Role).HasForeignKey(u => u.RoleId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(r => r.RoleUseCases).WithOne(ruc => ruc.Role).HasForeignKey(ruc => ruc.RoleId);
        }
    }
}
