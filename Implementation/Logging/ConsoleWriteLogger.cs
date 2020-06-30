using Application;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Logging
{
    public class ConsoleWriteLogger : ILogger
    {
        public void Log(UseCase userCase, IAppActor actor,object data=null)
        {
            Console.WriteLine($"Command with id of : {userCase.Id} and name : {userCase.Name} is being executed by {actor.Name} with id : {actor.Id}");

        }
    }
}
