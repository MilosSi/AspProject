using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.Categories
{
    public interface IGetCategories : IQuery<CategorySearch,PagedResponse<CategoryDto>>
    {
    }
}
