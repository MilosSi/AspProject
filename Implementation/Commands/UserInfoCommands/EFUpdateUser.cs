using Application;
using Application.Commands.UserInfo;
using Application.DataTransfer;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Implementation.Commands.UserInfoCommands
{
    public class EFUpdateUser : IUpdateUser
    {
        private readonly OzposloviContext _context;
        private readonly IAppActor _actor;
        private readonly UserUpdateValidation _validator;

        public EFUpdateUser(OzposloviContext context, IAppActor actor, UserUpdateValidation validator)
        {
            _context = context;
            _actor = actor;
            _validator = validator;
        }

        public int Id => 25;

        public string Name => "EF Update user info";

        public void Execute(UserInfoUpdateDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _context.Users.Find(request.UserId);
            if (user == null)
            {
                throw new EntityNotFoundException(request.UserId, typeof(User));
            }

            var newFileName = user.AvatarPath;
            if (request.Avatar != null)
            {
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(request.Avatar.FileName);
                newFileName = guid + extension;
                var path = Path.Combine("wwwroot", "images", newFileName);
                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    request.Avatar.CopyTo(fileStream);
                }
            }
            var newFileNameCv =user.CvPath;
            if (request.Cv != null)
            {
                var guidCv = Guid.NewGuid();
                newFileNameCv = guidCv + request.Cv.FileName;
                var pathCv = Path.Combine("wwwroot", "cv", newFileNameCv);
                using (var fileStreamCv = new FileStream(pathCv, FileMode.Create))
                {
                    request.Cv.CopyTo(fileStreamCv);
                }
            }

            user.Username = request.Username;
            user.Name = request.Name;
            user.Surname = request.Surname;
            user.Phone = request.Phone;
            user.Birthdate = request.Birthdate;
            user.AvatarAlt = request.AvatarAlt;
            user.AvatarPath = newFileName;
            user.CvPath = newFileNameCv;

            _context.SaveChanges();
        }
    }
}
