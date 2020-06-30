using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class JobCategory
    {
        public int JobId { get; set; }
        public int CategoryId { get; set; }

        public virtual Job Job { get; set; }
        public virtual Category Category { get; set; }
    }
}
