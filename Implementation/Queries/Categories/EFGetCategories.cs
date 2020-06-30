using Application.DataTransfer;
using Application.Queries.Categories;
using Application.Searches;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.Categories
{
    public class EFGetCategories : IGetCategories
    {
        private readonly OzposloviContext _context;

        public EFGetCategories(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 6;

        public string Name => "Get Categories";

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var query = _context.Categories.AsQueryable();
            if(!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.CategoryName.ToLower().Contains(search.Name.ToLower()));
            }

            var currentPage = search.Page;
            var perPage = search.PerPage;

            var skip = perPage * (currentPage - 1);

            return new PagedResponse<CategoryDto>
            {
                CurrentPage = currentPage,
                ItemsPerPage = perPage,
                TotalCount = query.Count(),
                Items = query.Skip(skip).Take(perPage).Select(x => new CategoryDto
                {
                    Id = x.Id,
                    CategoryName = x.CategoryName,
                })
            };
        }
    }
}
