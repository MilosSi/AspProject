using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.JobvacanciesAdmin
{
    public interface IGetJobvacancieId : IQuery<int,JobvacanciesDto>
    {
    }
}
