using Application.DataTransfer;
using Application.Queries.UserInfo;
using Application.Searches;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.UserInfoQueries
{
    public class EFGetAllUsers : IGetAllUsers
    {
        private readonly OzposloviContext _context;

        public EFGetAllUsers(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 26;

        public string Name => "EF Get all Users";

        public PagedResponse<UserInfoDto> Execute(UserInfoSearch search)
        {
            var query = _context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                query = query.Where(u => u.Username.ToLower().Contains(search.Username.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(u => u.Name.ToLower().Contains(search.Name.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Surname) || !string.IsNullOrWhiteSpace(search.Surname))
            {
                query = query.Where(u => u.Surname.ToLower().Contains(search.Surname.ToLower()));
            }
            if(search.Birthdate != null)
            {
                query = query.Where(u => u.Birthdate < search.Birthdate);
            }
            if(search.RoleId != null)
            {
                query = query.Where(u => u.RoleId == search.RoleId);
            }

            var currentPage = search.Page;
            var perPage = search.PerPage;

            var skip = perPage * (currentPage - 1);

            return new PagedResponse<UserInfoDto>
            {
                CurrentPage = currentPage,
                ItemsPerPage = perPage,
                TotalCount = query.Count(),
                Items = query.Skip(skip).Take(perPage).Select(x => new UserInfoDto
                {
                    Id=x.Id,
                    Username = x.Username,
                    Name = x.Name,
                    Surname = x.Surname,
                    Email = x.Email,
                    Phone = (int)x.Phone,
                    Birthdate = x.Birthdate,
                    CvPath = x.CvPath,
                    AvatarPath = x.AvatarPath,
                    AvatarAlt = x.AvatarAlt
                })
            };
        }
    }
}
