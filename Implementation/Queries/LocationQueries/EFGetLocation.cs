using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.LocationQueries
{
    public class EFGetLocation : IGetLocation
    {
        private readonly OzposloviContext _context;

        public EFGetLocation(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 3;

        public string Name => "Get locations ";

        public PagedResponse<LocationDto> Execute(LocationSearch search)
        {
            var query = _context.Locations.AsQueryable();
            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.CityName.ToLower().Contains(search.Name.ToLower()));
            }

            var currentPage = search.Page;
            var perPage = search.PerPage;

            var skip = perPage * (currentPage - 1);

            return new PagedResponse<LocationDto>
            {
                CurrentPage = currentPage,
                ItemsPerPage = perPage,
                TotalCount = query.Count(),
                Items = query.Skip(skip).Take(perPage).Select(x => new LocationDto
                {
                    Id = x.Id,
                    CityName = x.CityName
                })
            };
        }
    }
}
