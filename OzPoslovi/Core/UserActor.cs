using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OzPoslovi.Core
{
    public class UserActor : IAppActor
    {
        public int Id => 1;

        public string Name => "User";

        public IEnumerable<int> AllowedUseCases => new List<int> { 2, 3 };
    }

    public class AdminActor : IAppActor
    {
        public int Id => 2;

        public string Name => "Admin";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 50);
    }

}
