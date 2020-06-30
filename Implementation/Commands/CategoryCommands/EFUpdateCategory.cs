using Application.Commands.Category;
using Application.DataTransfer;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CategoryCommands
{
    public class EFUpdateCategory : IUpdateCategory
    {
        private readonly OzposloviContext _context;
        private readonly CategoryValidation _validator;

        public EFUpdateCategory(OzposloviContext context, CategoryValidation validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 9;

        public string Name => "Update category";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);
            var category = _context.Categories.Find(request.Id);

            if (category == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            category.CategoryName = request.CategoryName;
            _context.SaveChanges();
        }
    }
}
