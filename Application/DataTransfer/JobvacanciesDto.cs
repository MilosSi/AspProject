using System;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;
using System.Text;

namespace Application.DataTransfer
{
    public class JobvacanciesDto
    {
        public int? Id { get; set; }
        public int JobId { get; set; }
        public string JobName { get; set; }
        public string JobDescription { get; set; }
        public DateTime? JobEndDate { get; set; }
        public int? Status { get; set; }
        public int? UserId { get; set; }
        public string Username { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
    }
}
