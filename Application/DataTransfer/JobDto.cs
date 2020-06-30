using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class JobDto
    {
        public int Id { get; set; }
        public string JobName { get; set; }
        public string JobResponsibilities { get; set; }
        public string JobRequirments { get; set; }
        public string JobDescription { get; set; }
        public int WorktimeId { get; set; }
        public string WorktimeDescription { get; set; }
        public int PaymentId { get; set; }
        public string PaymentDescription { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsFeatured { get; set; }
        public bool IsPremium { get; set; }

        public IEnumerable<CategoryDto> Categories { get; set; } = new List<CategoryDto>();
        public IEnumerable<LocationDto> Locations { get; set; } = new List<LocationDto>();
    }

    
}
