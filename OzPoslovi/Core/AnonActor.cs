using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OzPoslovi.Core
{
    public class AnonActor : IAppActor
    {
        public int Id => 0;

        public string Name => "Anonymous actor";

        public IEnumerable<int> AllowedUseCases => new List<int> { 3,4,6,11,12 };
    }
}
