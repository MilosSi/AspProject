using Application.Commands.Location;
using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;
using EFDataAccess;
using Domain;
using Microsoft.AspNetCore.Http;
using Implementation.Validation;
using FluentValidation;

namespace Implementation.Commands
{
    public class EFAddLocation : AddLocation
    {
        private readonly OzposloviContext _context;
        private readonly LocationValidator validations;

        public EFAddLocation(OzposloviContext context, LocationValidator validations)
        {
            _context = context;
            this.validations = validations;
        }

        public int Id => 1;

        public string Name => "Add new location to the system";

        public void Execute(LocationDto request)
        {
            validations.ValidateAndThrow(request);

            var location = new Location
            {
                CityName = request.CityName
            };

            _context.Add(location);

            _context.SaveChanges();
        
        }
    }
}
