using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class UseCaseLogger
    {
        public int Id { get; set; }
        public DateTime UseCaseDatetime { get; set; }
        public int? UserId { get; set; }
        public string UseCaseName { get; set; }
        public string Data { get; set; }
        public virtual User User { get; set; }
    }
}
