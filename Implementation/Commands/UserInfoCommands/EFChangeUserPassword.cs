using Application.Commands.UserInfo;
using Application.DataTransfer;
using Application.Exceptions;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.UserInfoCommands
{
    public class EFChangeUserPassword : IChangeUserPassword
    {
        private readonly OzposloviContext _context;
        private readonly ChangePasswordValidator _validator;

        public EFChangeUserPassword(OzposloviContext context, ChangePasswordValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 24;

        public string Name => "EF Change password of user";

        public void Execute(ChangePasswordDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _context.Users.Find(request.UserId);
            if (user == null || user.Password != request.OldPassword)
            {
                throw new EntityNotFoundException(request.UserId, typeof(Domain.User));
            }

            user.Password = request.NewPassword;
            _context.SaveChanges();
        }
    }
}
