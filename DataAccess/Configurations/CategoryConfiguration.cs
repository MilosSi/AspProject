using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.Property(c => c.CategoryName)
                .IsRequired()
                .HasMaxLength(40);
            builder.HasIndex(c => c.CategoryName).IsUnique();

            builder.HasMany(c => c.CategoryJobs).WithOne(jc => jc.Category).HasForeignKey(jc => jc.CategoryId);
        }
    }
}
