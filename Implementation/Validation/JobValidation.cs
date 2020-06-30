using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Implementation.Validation
{
    public class JobValidation : AbstractValidator<JobDto>
    {
        public JobValidation(OzposloviContext context)
        {
            RuleFor(j => j.JobName).NotEmpty();
            RuleFor(j => j.JobDescription).NotEmpty();
            RuleFor(j => j.WorktimeId).NotNull().Must(ValidWorktimeId).WithMessage("Wrong worktime id");
            RuleFor(j => j.WorktimeDescription).NotEmpty().When(j => j.WorktimeId == 0);
            RuleFor(j => j.PaymentId).NotNull().Must(ValidPaymentId).WithMessage("Wrong payment id");
            RuleFor(j => j.PaymentDescription).NotEmpty().When(j => j.PaymentId != 2);
            RuleFor(j => j.EndDate).GreaterThan(DateTime.Today).WithMessage("End date date must not be in the past.");
            RuleFor(j => j.IsFeatured).NotNull();
            RuleFor(j => j.IsPremium).NotNull();

            RuleFor(j => j.Categories).NotEmpty()
                .Must(cat => cat.Select(x => x.Id).Distinct().Count() == cat.Count())
                .WithMessage("Category id must be disctinct")
                .DependentRules(() => {
                    RuleForEach(x => x.Categories).Must(cat => context.Categories.Any(cc => cc.Id == cat.Id)).WithMessage("Category does not exist");
                });
            RuleFor(j => j.Locations).NotEmpty()
                .Must(loc => loc.Select(x => x.Id).Distinct().Count() == loc.Count())
                .WithMessage("Location id must be distinct")
                .DependentRules(() =>
                {
                    RuleForEach(j => j.Locations).Must(loc => context.Locations.Any(lc => lc.Id == loc.Id)).WithMessage("Location does not exist");
                });

        }

        private static bool ValidWorktimeId(int id)
        {
            return ((id == 0) || (id == 1));
        }

        private static bool ValidPaymentId(int id)
        {
            return ((id == 0) || (id == 1) || (id == 2));
        }
    }
}
