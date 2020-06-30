using Application.Commands.JobvacanciesAdmin;
using Application.Exceptions;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.JobvacanciesAdminCommands
{
    public class EFRemoveJobVacancieAdmin : IRemoveJobVacancieAdmin
    {
        private readonly OzposloviContext _context;

        public EFRemoveJobVacancieAdmin(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Name => "EF Soft delete job vacancie by Id";

        public void Execute(int request)
        {
            var jobuser = _context.JobUsers.Find(request);
            if (jobuser == null)
            {
                throw new EntityNotFoundException(request, typeof(Domain.JobUser));
            }
            jobuser.IsDeleted = true;
            jobuser.IsActive = false;
            jobuser.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
