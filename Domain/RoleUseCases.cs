using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class RoleUseCases
    {
        public int Id { get; set; }
        public int RoleId { get; set; }
        public int UseCaseId { get; set; }
        public String UsrCaseName { get; set; }
        public String Data { get; set; }

        public virtual Role Role { get; set; }
    }
}
