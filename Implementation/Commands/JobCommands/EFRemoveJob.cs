using Application.Commands.Job;
using Application.Exceptions;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.JobCommands
{
    public class EFRemoveJob : IRemoveJob
    {
        private readonly OzposloviContext _context;

        public EFRemoveJob(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 14;

        public string Name => "EF Soft delete Job";

        public void Execute(int request)
        {
            var job = _context.Jobs.Find(request);

            if (job == null)
            {
                throw new EntityNotFoundException(request, typeof(Domain.Job));
            }

            job.IsDeleted = true;
            job.IsActive = false;
            job.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
