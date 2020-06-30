using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class UserInfoDto
    {
        public int? Id { get; set; }
        public string Username { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public int Phone { get; set; }
        public DateTime Birthdate { get; set; }
        public string CvPath { get; set; }
        public string AvatarPath { get; set; }
        public string AvatarAlt { get; set; }
    }
}
