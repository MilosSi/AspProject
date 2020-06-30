using Application.Commands.Location;
using Application.DataTransfer;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.LocationCommands
{
    public class EFUpdateLocation : UpdateLocation
    {
        private readonly OzposloviContext _context;
    

        public EFUpdateLocation(OzposloviContext context)
        {
            _context = context;
           
        }

        public int Id => 5;

        public string Name => "Update locations with unique ID";

        public void Execute(LocationUpdateDto request)
        {
  
            var location = _context.Locations.Find(request.Id);

            if (location == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Location));
            }

            location.CityName = request.CityName;
            _context.SaveChanges();
        }
    }
}
