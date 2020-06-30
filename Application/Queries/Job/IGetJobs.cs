using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Job
{
    public interface IGetJobs : IQuery<JobSearch,PagedResponse<JobDto>>
    {
    }
}
