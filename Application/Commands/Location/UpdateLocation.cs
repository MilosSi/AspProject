using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Location
{
    public interface UpdateLocation : ICommand<LocationUpdateDto>
    {
    }
}
