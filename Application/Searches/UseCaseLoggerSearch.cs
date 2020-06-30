using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class UseCaseLoggerSearch : PagedSearch
    {
        public int? UserId { get; set; }
        public DateTime? UseCaseDateBefore { get; set; }
        public DateTime? UseCaseDateAfter { get; set; }
    }
}
