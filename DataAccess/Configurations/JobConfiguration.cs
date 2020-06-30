using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    class JobConfiguration : IEntityTypeConfiguration<Job>
    {
        public void Configure(EntityTypeBuilder<Job> builder)
        {
            builder.Property(j => j.JobName)
                .IsRequired()
                .HasMaxLength(255);

            builder.Property(j => j.JobRequirments).HasColumnType("text");
            builder.Property(j => j.JobResponsibilities).HasColumnType("text");

            builder.Property(j => j.JobDescription)
                .IsRequired()
                .HasColumnType("text");

            builder.HasMany(j => j.JobCategories).WithOne(jc => jc.Job).HasForeignKey(jc => jc.JobId);
            builder.HasMany(j => j.JobLocations).WithOne(jl => jl.Job).HasForeignKey(jl => jl.JobId);
            builder.HasMany(j => j.JobUsers).WithOne(ju => ju.Job).HasForeignKey(ju => ju.JobId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
