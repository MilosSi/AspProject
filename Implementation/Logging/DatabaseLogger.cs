using Application;
using Domain;
using EFDataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace Implementation.Logging
{
    public class DatabaseLogger : ILogger
    {
        private readonly OzposloviContext _context;

        public DatabaseLogger(OzposloviContext context)
        {
            _context = context;
        }

        public void Log(UseCase userCase, IAppActor actor, object data)
        {


            int? userid;
            if(actor.Id != 0)
            {
                userid = actor.Id;
            }
            else
            {
                userid = null;
            }
            _context.UseCaseLoggers.Add(new Domain.UseCaseLogger
            {
                UseCaseDatetime=DateTime.Now,
                UserId=userid,
                UseCaseName=userCase.Name,
                Data=JsonConvert.SerializeObject(data)
            });

            _context.SaveChanges();
        }
    }
}
