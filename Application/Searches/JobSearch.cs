using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class JobSearch : PagedSearch
    {
        public string Name { get; set; }
        public int? Worktime { get; set; }
        public int? Payment { get; set; }
        public DateTime? Enddate { get; set; }
        public bool IsFeatured { get; set; }
        public bool IsPremium { get; set; }

    }
}
