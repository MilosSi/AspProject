using Application.DataTransfer;
using Application.Queries.JobvacanciesAdmin;
using Application.Searches;
using Domain;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.JobvacanciesAdminQueries
{
    public class EFGetAllJobvacanciesAdmin : IGetAllJobvacanciesAdmin
    {
        private readonly OzposloviContext _context;

        public EFGetAllJobvacanciesAdmin(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 19;

        public string Name => "EF get all  job vacancies by users";

        public PagedResponse<JobvacanciesDto> Execute(JobvacanciesSearch search)
        {
            var query = _context.JobUsers
                .Include(ju => ju.Job)
                .Include(ju => ju.User)
                .AsQueryable();

            if (!string.IsNullOrEmpty(search.JobName) || !string.IsNullOrWhiteSpace(search.JobName))
            {
                query = query.Where(ju => ju.Job.JobName.ToLower().Contains(search.JobName.ToLower()));
            }

            if(search.JobId !=null)
            {
                query = query.Where(ju => ju.JobId == search.JobId);
            }
            if(search.UserId !=null)
            {
                query=query.Where(ju => ju.UserId == search.UserId);
            }
            if(search.Status != null)
            {
                query = query.Where(ju => ju.Status == (Status)search.Status);
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
                    JobId = x.JobId,
                    JobName = x.JobName,
                    JobDescription = x.JobDescription,
                    JobEndDate = x.Job.EndDate,
                    Status = (int)x.Status,
                    UserId = x.UserId,
                    Username = x.User.Username,
                    Name=x.User.Name,
                    Surname=x.User.Surname
                })
            };
        }
    }
}
