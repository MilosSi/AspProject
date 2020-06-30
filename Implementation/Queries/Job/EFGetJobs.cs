using Application.DataTransfer;
using Application.Queries.Job;
using Application.Searches;
using Domain;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.Job
{
    public class EFGetJobs : IGetJobs
    {
        private readonly OzposloviContext _context;

        public EFGetJobs(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 11;

        public string Name => "Get all jobs";

        public PagedResponse<JobDto> Execute(JobSearch search)
        {
            var query = _context.Jobs.AsQueryable();

            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(j => j.JobName.ToLower().Contains(search.Name.ToLower()));
            }

            if(search.Worktime != null)
            {
                if(search.Worktime == 0 || search.Worktime == 1)
                {
                    query = query.Where(j => j.WorktimeId == (Worktime)search.Worktime);
                }
            }

            if(search.Payment != null)
            {
                if(search.Payment == 0 || search.Payment == 1 || search.Payment == 3)
                {
                    query = query.Where(j => j.PaymentId == (Payment)search.Payment);
                }
            }

            if(search.Enddate != null)
            {
                query = query.Where(j => j.EndDate < search.Enddate);
            }

            if(search.IsFeatured == true)
            {
                query = query.Where(j => j.IsFeatured == search.IsFeatured);
            }

            if(search.IsPremium == true)
            {
                query = query.Where(j => j.IsPremium == search.IsPremium);
            }

            var currentPage = search.Page;
            var perPage = search.PerPage;

            var skip = perPage * (currentPage - 1);

            return new PagedResponse<JobDto>
            {
                CurrentPage = currentPage,
                ItemsPerPage = perPage,
                TotalCount = query.Count(),
                Items = query.Skip(skip).Take(perPage)
                .Select(j => new JobDto {

                    Id = j.Id,
                    JobName = j.JobName,
                    JobResponsibilities = j.JobResponsibilities,
                    JobRequirments = j.JobRequirments,
                    JobDescription = j.JobDescription,
                    WorktimeId = (int)j.WorktimeId,
                    WorktimeDescription = j.WorktimeDescription,
                    PaymentId = (int)j.PaymentId,
                    PaymentDescription = j.PaymentDescription,
                    EndDate = j.EndDate,
                    IsFeatured = j.IsFeatured,
                    IsPremium = j.IsPremium,
                    Categories = j.JobCategories.Select(jc => new CategoryDto
                    {
                        Id=jc.CategoryId,
                        CategoryName = jc.Category.CategoryName
                    }),
                    Locations = j.JobLocations.Select(jl => new LocationDto
                    {
                        Id=jl.LocationId,
                        CityName = jl.Location.CityName,
                        DetailedLocation =jl.DetailedLocation
                    })
                })
            };
        }
    }
}
