using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class ForbiddenUseCaseException : Exception
    {
        public ForbiddenUseCaseException(int id, IAppActor _actor) : base($"Unauthorized usage of command with id : {id} by : {_actor.Name} - {_actor.Id}")
        {

        }
    }
}
