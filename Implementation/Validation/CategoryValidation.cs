using Application.DataTransfer;
using EFDataAccess;
using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validation
{
    public class CategoryValidation : AbstractValidator<CategoryDto>
    {
        public CategoryValidation(OzposloviContext context)
        {
            RuleFor(c => c.CategoryName).NotEmpty().Must(c => !context.Categories.Any(cat => cat.CategoryName == c)).WithMessage("Category name must be unique");
        }
    }
}
