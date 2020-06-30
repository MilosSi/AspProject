using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Jobvacancies
{
    public interface IGetUserJobvacancies : IQuery<JobvacanciesSearch,PagedResponse<JobvacanciesDto>>
    {
    }
}
