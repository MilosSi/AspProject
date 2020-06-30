using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands.UserInfo;
using Application.DataTransfer;
using Application.Queries.UserInfo;
using Application.Searches;
using EFDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OzPoslovi.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class UserInfoController : ControllerBase
    {
        private readonly OzposloviContext _context;
        private readonly UseCaseExecutor _executor;
        private readonly IAppActor _actor;

        public UserInfoController(OzposloviContext context, UseCaseExecutor executor, IAppActor actor)
        {
            _context = context;
            _executor = executor;
            _actor = actor;
        }

        // GET: api/UserInfo
        [HttpGet]
        public IActionResult Get([FromServices] IGetAllUsers query,[FromQuery] UserInfoSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/UserInfo/5
        [HttpGet("{id}", Name = "Get7")]
        public IActionResult Get(int id,[FromServices] IGetUserById query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/UserInfo
        [HttpPost]
        public IActionResult Post([FromBody] ChangePasswordDto dto,[FromServices] IChangeUserPassword command)
        {
            dto.UserId = _actor.Id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // PUT: api/UserInfo/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromForm] UserInfoUpdateDto dto,[FromServices] IUpdateUser command)
        {
            dto.UserId = id;
            _executor.ExecuteCommand(command, dto);
            return Ok();
        }


        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
