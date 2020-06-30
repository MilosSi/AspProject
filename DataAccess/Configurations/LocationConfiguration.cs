using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFDataAccess.Configurations
{
    class LocationConfiguration : IEntityTypeConfiguration<Location>
    {
        public void Configure(EntityTypeBuilder<Location> builder)
        {
            builder.Property(l => l.CityName)
                .IsRequired()
                .HasMaxLength(40);
            builder.HasIndex(l => l.CityName).IsUnique();

            builder.HasMany(l => l.LocationJobs).WithOne(jl => jl.Location).HasForeignKey(jl => jl.LocationId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
