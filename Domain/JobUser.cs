using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class JobUser : BaseEntity
    {
        public int JobId { get; set; }
        public int UserId { get; set; }
        public Status Status { get; set; }
        public string JobName { get; set; }
        public string JobDescription { get; set; }
        public virtual Job Job { get; set; }
        public virtual User User { get; set; }

    }

    public enum Status
    {
        Pending,
        Contacted
    }
}
