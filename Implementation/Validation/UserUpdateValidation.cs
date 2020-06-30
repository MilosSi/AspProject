using Application.DataTransfer;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validation
{
    public class UserUpdateValidation : AbstractValidator<UserInfoUpdateDto>
    {
        public UserUpdateValidation()
        {
            RuleFor(ufu => ufu.Username).NotEmpty().Matches("^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$");
            RuleFor(ufu => ufu.Name).NotEmpty();
            RuleFor(ufu => ufu.Surname).NotEmpty();
            RuleFor(ufu => ufu.Phone).NotEmpty();
            RuleFor(ufu => ufu.Birthdate).NotEmpty().Must(da => da < DateTime.Now).WithMessage(" Invalid date");
        }
    }
}
