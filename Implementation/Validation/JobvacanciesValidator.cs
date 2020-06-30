using Application;
using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validation
{
    public class JobvacanciesValidator : AbstractValidator<JobvacanciesDto>
    {
        public JobvacanciesValidator(OzposloviContext context,IAppActor actor)
        {
            RuleFor(jv => jv.JobName).NotEmpty();
            RuleFor(jv => jv.JobDescription).NotEmpty();
            RuleFor(jv => jv.JobId).NotEmpty()
                .Must(jid => context.Jobs.Any(j => j.Id == jid && j.IsDeleted != true)).WithMessage("Job with that id does not exist")
                .Must(jid => !context.JobUsers.Any(ju => ju.UserId == actor.Id && ju.JobId == jid && ju.IsDeleted !=true)).WithMessage("User has already applied for this job position");
         
        }
    }
}
