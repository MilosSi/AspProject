using Application;
using Application.DataTransfer;
using Application.Queries.Jobvacancies;
using Application.Searches;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.JobvacanciesQueries
{
    public class EFGetJobvacancies : IGetUserJobvacancies
    {
        private readonly OzposloviContext _context;
        private readonly IAppActor _actor;

        public EFGetJobvacancies(OzposloviContext context, IAppActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 17;

        public string Name => "Get users applications";

        public PagedResponse<JobvacanciesDto> Execute(JobvacanciesSearch search)
        {
            var query = _context.JobUsers
                .Include(ju => ju.Job)
                .Where(ju => ju.UserId == _actor.Id).AsQueryable();
            if (!string.IsNullOrEmpty(search.JobName) || !string.IsNullOrWhiteSpace(search.JobName))
            {
                query = query.Where(ju => ju.Job.JobName.ToLower().Contains(search.JobName.ToLower()));
            }

            var currentPage = search.Page;
            var perPage = search.PerPage;

            var skip = perPage * (currentPage - 1);


            return new PagedResponse<JobvacanciesDto>
            {
                CurrentPage = currentPage,
                ItemsPerPage = perPage,
                TotalCount = query.Count(),
                Items = query.Skip(skip).Take(perPage).Select(x => new JobvacanciesDto
                {
                    Id=x.Id,
                    JobId=x.JobId,
                    JobName=x.JobName,
                    JobDescription=x.JobDescription,
                    JobEndDate=x.Job.EndDate,
                    Status=(int)x.Status
                })
            };
        }
    }
}
