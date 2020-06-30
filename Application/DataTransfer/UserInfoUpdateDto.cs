using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class UserInfoUpdateDto
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public int Phone { get; set; }
        public DateTime Birthdate { get; set; }
        public string AvatarAlt { get; set; }
        public IFormFile Avatar { get; set; }
        public IFormFile Cv { get; set; }
    }
}
