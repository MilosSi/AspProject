using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Job;
using Application.DataTransfer;
using Application.Queries.Job;
using Application.Searches;
using EFDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OzPoslovi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : ControllerBase
    {
        private readonly OzposloviContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IAppActor _actor;

        public JobController(OzposloviContext context, UseCaseExecutor executor, IAppActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }
        // GET: api/Job
        [HttpGet]
        public IActionResult Get([FromServices] IGetJobs query,[FromQuery] JobSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Job/5
        [HttpGet("{id}", Name = "Get3")]
        public IActionResult Get(int id,[FromServices] IGetJobById query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Job
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromServices] IAddJob command,[FromBody] JobDto dto)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Job/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] JobDto dto,[FromServices] IUpdateJob command)
        {
            var newJob = new JobUpdate
            {
                Id = id,
                Dto = dto
            };
            _executor.ExecuteCommand(command, newJob);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices] IRemoveJob command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
