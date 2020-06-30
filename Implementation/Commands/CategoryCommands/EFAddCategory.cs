using Application.Commands.Category;
using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CategoryCommands
{
    public class EFAddCategory : IAddCategory
    {
        private readonly OzposloviContext _context;
        private readonly CategoryValidation _validator;

        public EFAddCategory(OzposloviContext context, CategoryValidation validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 7;

        public string Name => "Add new category EF";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);
            var newCategory = new Category
            {
                CategoryName = request.CategoryName
            };

            _context.Add(newCategory);
            _context.SaveChanges();
        }
    }
}
