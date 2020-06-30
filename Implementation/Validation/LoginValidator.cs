using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using Application.DataTransfer;
using EFDataAccess;

namespace Implementation.Validation
{
    public class LoginValidator : AbstractValidator<LoginDto>
    {
        public LoginValidator(OzposloviContext context)
        {
            RuleFor(l => l.Email).NotEmpty().EmailAddress();
            RuleFor(l => l.Password).NotEmpty().MinimumLength(8).Matches(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
        }
    }
}
