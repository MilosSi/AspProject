using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UserInfoSearch : PagedSearch
    {
        public string Username { get; set; }
        public string Name { get; set; }
        public string  Surname { get; set; }
        public DateTime? Birthdate { get; set; }
        public int? RoleId { get; set; }
    }
}
