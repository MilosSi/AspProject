using Application.Commands.Category;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CategoryCommands
{
    public class EFRemoveCategory : IRemoveCategory
    {
        private readonly OzposloviContext _context;

        public EFRemoveCategory(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 8;

        public string Name => "Soft delete category";

        public void Execute(int request)
        {
            var category = _context.Categories.Find(request);

            if (category == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }

            category.IsDeleted = true;
            category.IsActive = false;
            category.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
