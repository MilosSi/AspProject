using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class JobLocation : BaseEntity
    {
        public int JobId { get; set; }
        public int LocationId { get; set; }
        public string DetailedLocation { get; set; }

        public virtual Job Job { get; set; }
        public virtual Location Location { get; set; }
    }
}
