using Application.Commands.Registration;
using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Implementation.Commands.RegistrationCommands
{
    public class EFRegistration : IRegister
    {
        private readonly OzposloviContext _context;
        private readonly RegistrationValidation _validation;

        public EFRegistration(OzposloviContext context, RegistrationValidation validation)
        {
            _context = context;
            _validation = validation;
        }

        public int Id => 4;

        public string Name => "Add new user to the system";

        public void Execute(RegisterDto request)
        {
            _validation.ValidateAndThrow(request);
            var newFileName ="basicavatar.jpg";
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
          

            var newFileNameCv = "";
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


            var registration = new User
            {
                Username = request.Username,
                Password = request.Password,
                Name = request.Name,
                Surname = request.Surname,
                Email = request.Email,
                Phone = request.Phone,
                Birthdate = request.Birthdate,
                CvPath = newFileNameCv,
                AvatarPath=newFileName,
                AvatarAlt = request.AvatarAlt,
                RoleId = request.RoleId
            };

            _context.Add(registration);
            _context.SaveChanges();
        }
    }
}
