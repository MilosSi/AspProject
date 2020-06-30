using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.Category;
using Application.DataTransfer;
using Application.Queries.Categories;
using Application.Searches;
using EFDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OzPoslovi.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly OzposloviContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IAppActor _actor;

        public CategoryController(OzposloviContext context, UseCaseExecutor executor, IAppActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }
        // GET: api/Category
        [HttpGet]
        public IActionResult Get([FromServices] IGetCategories query,[FromQuery] CategorySearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Category/5
        [HttpGet("{id}", Name = "Get2")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Category
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CategoryDto dto, [FromServices] IAddCategory command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Category/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CategoryDto dto,[FromServices] IUpdateCategory command)
        {
            var newCategory = new CategoryDto
            {
                Id = id,
                CategoryName = dto.CategoryName
            };
            _executor.ExecuteCommand(command, newCategory);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/Category/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices] IRemoveCategory command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
