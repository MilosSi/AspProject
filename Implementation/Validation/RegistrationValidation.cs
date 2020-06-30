using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validation
{
    public class RegistrationValidation : AbstractValidator<RegisterDto>
    {
        public RegistrationValidation(OzposloviContext context)
        {
            RuleFor(r => r.Username).NotEmpty().Matches("^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$");
            RuleFor(r => r.Password).NotEmpty().MinimumLength(8).Matches(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
            RuleFor(r => r.Name).NotEmpty();
            RuleFor(r => r.Surname).NotEmpty();
            RuleFor(r => r.Email).NotEmpty().EmailAddress().Must(e => !context.Users.Any(user => user.Email == e));
            RuleFor(r => r.Phone).NotEmpty();
            RuleFor(r => r.Birthdate).NotEmpty().Must(da => da < DateTime.Now).WithMessage(" Invalid date");
            RuleFor(r => r.RoleId).NotEmpty();

        }
    }
}
