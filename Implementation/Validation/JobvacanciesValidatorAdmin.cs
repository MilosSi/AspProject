using Application.DataTransfer;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Implementation.Validation
{
    public class JobvacanciesValidatorAdmin : AbstractValidator<JobvacanciesDto>
    {
        public JobvacanciesValidatorAdmin()
        {
            RuleFor(jv => jv.Status).Must(s => (s == 0 || s == 1)).WithMessage("Status does not exist");
        }
    }
}
