using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    class JobUserConfiguration : IEntityTypeConfiguration<JobUser>
    {
        public void Configure(EntityTypeBuilder<JobUser> builder)
        {
            builder.Property(ju => ju.JobName).IsRequired()
                .HasMaxLength(255);
            builder.Property(ju => ju.JobDescription)
             .IsRequired()
             .HasColumnType("text");
        }
    }
}
