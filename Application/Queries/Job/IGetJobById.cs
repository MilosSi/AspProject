using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Job
{
    public interface IGetJobById : IQuery<int,JobDto>
    {
    }
}
