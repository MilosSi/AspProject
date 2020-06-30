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
    public class LocationValidator : AbstractValidator<LocationDto>
    {
        public LocationValidator(OzposloviContext context)
        {
            RuleFor(x => x.CityName)
                .NotEmpty()
                .Must(x => !context.Locations.Any(loc => loc.CityName == x)).WithMessage("Location name must be unique");
        }
    }
}
