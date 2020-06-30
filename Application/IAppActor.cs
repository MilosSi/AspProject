using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface IAppActor
    {
        int Id { get;}
        string Name { get; }
        IEnumerable<int> AllowedUseCases { get; }
    }
}
