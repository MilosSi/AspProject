using Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<User> builder)
        {
            builder.Property(u => u.Username)
                .IsRequired()
                .HasMaxLength(50);
            builder.HasIndex(u => u.Username).IsUnique();
            builder.Property(u => u.Password).IsRequired().HasMaxLength(100);
            builder.Property(u => u.Name)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(u => u.Surname)
                .IsRequired()
                .HasMaxLength(50);

            builder.Property(u => u.Email).IsRequired();
            builder.HasIndex(u => u.Email).IsUnique();

            builder.Property(u => u.AvatarPath).HasDefaultValue("emptyavatar.jpg");
            builder.Property(u => u.AvatarAlt).HasDefaultValue("basic-avatar");

            builder.HasMany(u => u.UserJobs).WithOne(ju => ju.User).HasForeignKey(ju => ju.UserId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(u => u.UseCaseLoggers).WithOne(ucl => ucl.User).HasForeignKey(ucl => ucl.UserId).OnDelete(DeleteBehavior.SetNull);

        }
    }
}
