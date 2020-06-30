using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class JobvacanciesSearch : PagedSearch
    {
        public string JobName { get; set; }

        public int? UserId { get; set; }
        public int? JobId { get; set; }
        public int? Status { get; set; }
    }
}
