using Application;
using Application.Commands.Jobvacancies;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands.JobvacanciesCommands
{
    public class EFRemoveUsersJobVacancie : IRemoveUserJobVacancie
    {
        private readonly OzposloviContext _context;
        private readonly IAppActor _actor;

        public EFRemoveUsersJobVacancie(OzposloviContext context, IAppActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 18;

        public string Name => "EF Soft delete users job vacancie";

        public void Execute(int request)
        {
         

            var jobvac = _context.JobUsers.Find(request);
            if (jobvac == null || jobvac.UserId != _actor.Id)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }

            jobvac.IsDeleted = true;
            jobvac.IsActive = false;
            jobvac.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
