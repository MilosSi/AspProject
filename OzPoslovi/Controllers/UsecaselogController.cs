using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Queries.UseCaseLog;
using Application.Searches;
using EFDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OzPoslovi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsecaselogController : ControllerBase
    {
        private readonly OzposloviContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IAppActor _actor;

        public UsecaselogController(OzposloviContext context, UseCaseExecutor executor, IAppActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }

        // GET: api/Usecaselog
        [Authorize]
        [HttpGet]
        public IActionResult Get([FromServices] IGetUseCaseLogger query,[FromQuery] UseCaseLoggerSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

    }
}
