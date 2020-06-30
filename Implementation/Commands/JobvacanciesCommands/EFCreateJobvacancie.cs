using Application;
using Application.Commands.Jobvacancies;
using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.JobvacanciesCommands
{
    public class EFCreateJobvacancie : ICreatedJobvacancie
    {
        private readonly OzposloviContext _context;
        private readonly IAppActor _actor;
        private readonly JobvacanciesValidator _validator;

        public EFCreateJobvacancie(OzposloviContext context, IAppActor actor, JobvacanciesValidator validator)
        {
            _context = context;
            _actor = actor;
            _validator = validator;
        }

        public int Id => 16;

        public string Name => "User creates new job vacancie";

        public void Execute(JobvacanciesDto request)
        {
            _validator.ValidateAndThrow(request);
            var newJobVacancie = new JobUser
            {
                JobId = request.JobId,
                UserId = _actor.Id,
                Status = 0,
                JobName = request.JobName,
                JobDescription = request.JobDescription
            };

            _context.Add(newJobVacancie);
            _context.SaveChanges();
        }
    }
}
