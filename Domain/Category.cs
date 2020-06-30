using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Category : BaseEntity
    {
        public string CategoryName { get; set; }

        public virtual ICollection<JobCategory> CategoryJobs { get; set; }
    }
}
