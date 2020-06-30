using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.JobvacanciesAdmin;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.JobvacanciesAdminQueries
{
    public class EFGetJobvacancieById : IGetJobvacancieId
    {

        private readonly OzposloviContext _context;

        public EFGetJobvacancieById(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 20;

        public string Name => "EF get job vacancie by ID";

        public JobvacanciesDto Execute(int search)
        {
            var jobuser = _context.JobUsers.Include(ju => ju.Job).Include(ju => ju.User).FirstOrDefault(ju => ju.Id == search);

            if (jobuser == null)
            {
                throw new EntityNotFoundException(search, typeof(Domain.JobUser));
            }

            return new JobvacanciesDto
            {
                Id=jobuser.Id,
                JobId = jobuser.Id,
                JobName = jobuser.JobName,
                JobDescription = jobuser.JobDescription,
                JobEndDate = jobuser.Job.EndDate,
                Status = (int)jobuser.Status,
                UserId = jobuser.UserId,
                Username = jobuser.User.Username,
                Name=jobuser.User.Name,
                Surname=jobuser.User.Surname
            };
        }
    }
}
