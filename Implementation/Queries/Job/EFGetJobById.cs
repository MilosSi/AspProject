using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.Job;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.Job
{
    public class EFGetJobById : IGetJobById
    {
        private readonly OzposloviContext _context;

        public EFGetJobById(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 12;

        public string Name => "Get single job by ID";

        public JobDto Execute(int search)
        {
            var job = _context.Jobs
                .Include(j => j.JobCategories).ThenInclude(c => c.Category)
                .Include(j => j.JobLocations).ThenInclude(l => l.Location)
                .FirstOrDefault(j => j.Id == search);
            if (job == null)
            {
                throw new EntityNotFoundException(search, typeof(Domain.Job));
            }

            return new JobDto
            {
                Id = job.Id,
                JobName = job.JobName,
                JobResponsibilities = job.JobResponsibilities,
                JobRequirments = job.JobRequirments,
                JobDescription = job.JobDescription,
                WorktimeId = (int)job.WorktimeId,
                WorktimeDescription = job.WorktimeDescription,
                PaymentId = (int)job.PaymentId,
                PaymentDescription = job.PaymentDescription,
                EndDate = job.EndDate,
                IsFeatured = job.IsFeatured,
                IsPremium = job.IsPremium,
                Categories = job.JobCategories.Select(jc => new CategoryDto
                {
                    Id = jc.CategoryId,
                    CategoryName = jc.Category.CategoryName
                }),
                Locations = job.JobLocations.Select(jl => new LocationDto
                {
                    Id = jl.LocationId,
                    CityName = jl.Location.CityName,
                    DetailedLocation = jl.DetailedLocation
                })
            };
        }
    }
}
