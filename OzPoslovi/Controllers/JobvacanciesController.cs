using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Jobvacancies;
using Application.DataTransfer;
using Application.Queries.Jobvacancies;
using Application.Searches;
using EFDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OzPoslovi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class JobvacanciesController : ControllerBase
    {
        private readonly OzposloviContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IAppActor _actor;

        public JobvacanciesController(OzposloviContext context, UseCaseExecutor executor, IAppActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }

        // GET: api/Jobvacancies
        [HttpGet]
        public IActionResult Get([FromServices] IGetUserJobvacancies query,[FromQuery] JobvacanciesSearch search)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        // GET: api/Jobvacancies/5
        [HttpGet("{id}", Name = "Get5")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Jobvacancies
        [HttpPost]
        public IActionResult Post([FromBody] JobvacanciesDto dto,[FromServices] ICreatedJobvacancie command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Jobvacancies/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices] IRemoveUserJobVacancie command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
