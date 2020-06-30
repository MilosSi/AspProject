using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Job : BaseEntity
    {
        public string JobName { get; set; }
        public string JobResponsibilities { get; set; }
        public string JobRequirments { get; set; }
        public string JobDescription { get; set; }
        public Worktime WorktimeId { get; set; }
        public string WorktimeDescription { get; set; }
        public Payment PaymentId { get; set; }
        public string PaymentDescription { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsFeatured { get; set; }
        public bool IsPremium { get; set; }

        public virtual ICollection<JobCategory> JobCategories { get; set; } = new HashSet<JobCategory>();
        public virtual ICollection<JobLocation> JobLocations { get; set; } = new HashSet<JobLocation>();
        public virtual ICollection<JobUser> JobUsers { get; set; }

    }

    public enum Worktime
    {
        SpecificTime,
        AgreementWithEmployer
    }

    public enum Payment
    {
        HourlyRate,
        MonthlySalary,
        AgreementWithEmployer
    }
}
