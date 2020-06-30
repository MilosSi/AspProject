using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Location : BaseEntity
    {
        public string CityName { get; set; }

        public virtual ICollection<JobLocation> LocationJobs { get; set; }
    }
}
