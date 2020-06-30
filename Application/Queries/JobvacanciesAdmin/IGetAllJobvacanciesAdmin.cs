using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.JobvacanciesAdmin
{
    public interface IGetAllJobvacanciesAdmin : IQuery<JobvacanciesSearch, PagedResponse<JobvacanciesDto>>
    {
    }
}
