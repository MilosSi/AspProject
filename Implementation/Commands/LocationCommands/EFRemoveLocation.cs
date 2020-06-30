using Application.Commands.Location;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.LocationCommands
{
    public class EFRemoveLocation : RemoveLocation
    {
        private readonly OzposloviContext _context;

        public EFRemoveLocation(OzposloviContext context)
        {
            _context = context;
        }

        public int Id => 2;

        public string Name => "Soft delete location with id";

        public void Execute(int request)
        {
            var location = _context.Locations.Find(request);

            if(location == null)
            {
                throw new EntityNotFoundException(request, typeof(Location));
            }

            location.IsDeleted = true;
            location.IsActive = false;
            location.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
