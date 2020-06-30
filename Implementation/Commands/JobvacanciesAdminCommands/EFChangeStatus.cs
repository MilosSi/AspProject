using Application.Commands.JobvacanciesAdmin;
using Application.DataTransfer;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.JobvacanciesAdminCommands
{
    public class EFChangeStatus : IChangeStatusOfJobVacancie
    {
        private readonly OzposloviContext _context;
        private readonly JobvacanciesValidatorAdmin _validator;

        public EFChangeStatus(OzposloviContext context, JobvacanciesValidatorAdmin validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 21;

        public string Name => "EF Status change";

        public void Execute(JobvacanciesDto request)
        {
            _validator.ValidateAndThrow(request);

            var jobuser = _context.JobUsers.Find(request.Id);

            if (jobuser == null)
            {
                throw new EntityNotFoundException((int)request.Id, typeof(Domain.JobUser));
            }

            jobuser.Status = (Status)request.Status;

            _context.SaveChanges();
        }
    }
}
