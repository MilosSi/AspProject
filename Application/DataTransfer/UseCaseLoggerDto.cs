using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
    public class UseCaseLoggerDto
    {
        public int Id { get; set; }
        public DateTime UseCaseDatetime { get; set; }
        public int? UserId { get; set; }
        public string UseCaseName { get; set; }
        public string Data { get; set; }
    }
}
