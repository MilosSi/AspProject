using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface ILogger
    {
        public void Log(UseCase userCase, IAppActor actor,object data);
    }
}
