using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.JobvacanciesAdmin;
using Application.DataTransfer;
using Application.Queries.Job;
using Application.Queries.JobvacanciesAdmin;
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
    public class JobvacanciesAdminController : ControllerBase
    {
        private readonly OzposloviContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IAppActor _actor;

        public JobvacanciesAdminController(OzposloviContext context, UseCaseExecutor executor, IAppActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }

        // GET: api/JobvacanciesAdmin
        [HttpGet]
        public IActionResult Get([FromServices] IGetAllJobvacanciesAdmin query,[FromQuery] JobvacanciesSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/JobvacanciesAdmin/5
        [HttpGet("{id}", Name = "Get6")]
        public IActionResult Get(int id,[FromServices] IGetJobvacancieId query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/JobvacanciesAdmin
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/JobvacanciesAdmin/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] JobvacanciesDto dto,[FromServices] IChangeStatusOfJobVacancie command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices] IRemoveJobVacancieAdmin command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
