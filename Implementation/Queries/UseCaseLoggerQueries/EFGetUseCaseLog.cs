using Application.DataTransfer;
using Application.Queries.UseCaseLog;
using Application.Searches;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.UseCaseLoggerQueries
{
    public class EFGetUseCaseLog : IGetUseCaseLogger
    {
        private readonly OzposloviContext _context;

        public EFGetUseCaseLog(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 15;

        public string Name => "EF Get usecase log";

        public PagedResponse<UseCaseLoggerDto> Execute(UseCaseLoggerSearch search)
        {
            var query = _context.UseCaseLoggers.AsQueryable();

            if(search.UserId != null)
            {
                query = query.Where(ucl => ucl.UserId == search.UserId);
            }
            if(search.UseCaseDateBefore != null)
            {
                query = query.Where(ucl => ucl.UseCaseDatetime <= search.UseCaseDateBefore);
            }
            if(search.UseCaseDateAfter != null)
            {
                query = query.Where(ucl => ucl.UseCaseDatetime >= search.UseCaseDateAfter);
            }

            var currentPage = search.Page;
            var perPage = search.PerPage;

            var skip = perPage * (currentPage - 1);

            return new PagedResponse<UseCaseLoggerDto>
            {
                CurrentPage = currentPage,
                ItemsPerPage = perPage,
                TotalCount = query.Count(),
                Items=query.Skip(skip).Take(perPage).Select(x => new UseCaseLoggerDto
                {
                    Id=x.Id,
                    UseCaseDatetime=x.UseCaseDatetime,
                    UserId=x.UserId,
                    UseCaseName=x.UseCaseName,
                    Data=x.Data
                })
            };
        }
    }
}
