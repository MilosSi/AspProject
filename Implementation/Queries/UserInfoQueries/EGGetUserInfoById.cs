using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries.UserInfo;
using Domain;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries.UserInfoQueries
{
    public class EGGetUserInfoById : IGetUserById
    {
        private readonly OzposloviContext _context;

        public EGGetUserInfoById(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 23;

        public string Name => "EF get user info by ID";

        public UserInfoDto Execute(int search)
        {
            var user = _context.Users.Find(search);
            if (user == null)
            {
                throw new EntityNotFoundException(search, typeof(Domain.User));
            }

            return new UserInfoDto
            {
                Id=user.Id,
                Username = user.Username,
                Name = user.Name,
                Surname = user.Surname,
                Email = user.Email,
                Phone = (int)user.Phone,
                Birthdate = user.Birthdate,
                CvPath = user.CvPath,
                AvatarPath = user.AvatarPath,
                AvatarAlt = user.AvatarAlt
            };


            

        }
    }
}
