using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Role : BaseEntity
    {
        public string RoleName { get; set; }

        public virtual ICollection<User> Users { get; set; }
        public virtual ICollection<RoleUseCases> RoleUseCases { get; set; }
    }
}
