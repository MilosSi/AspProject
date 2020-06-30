using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class RegisterDto
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public int Phone { get; set; }
        public DateTime Birthdate { get; set; }
        public string AvatarAlt { get; set; }
        public int RoleId { get; set; }

        public IFormFile Avatar { get; set; }
        public IFormFile Cv { get; set; }
    }
}
