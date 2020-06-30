using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OzPoslovi.Core
{
    public class JwtActor : IAppActor
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public IEnumerable<int> AllowedUseCases { get; set; }
    }
}
