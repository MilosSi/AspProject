using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Location;
using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using Domain;
using EFDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OzPoslovi.Controllers
{
  
    [Route("api/[controller]")]
    [ApiController]
    public class LocationController : ControllerBase
    {
        private readonly OzposloviContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IAppActor _actor;

        public LocationController(OzposloviContext context, UseCaseExecutor executor, IAppActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }

        // GET: api/Location
        [HttpGet]
        public IActionResult Get([FromQuery] LocationSearch search,[FromServices] IGetLocation query)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        // GET: api/Location/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Location
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] LocationDto dto,[FromServices] AddLocation command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Location/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] LocationDto dto,[FromServices] UpdateLocation command)
        {
            var UpdateLocationDto = new LocationUpdateDto
            {
                Id = id,
                CityName = dto.CityName
            };
            _executor.ExecuteCommand(command, UpdateLocationDto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices] RemoveLocation command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
