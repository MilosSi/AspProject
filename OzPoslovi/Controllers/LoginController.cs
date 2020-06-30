using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.DataTransfer;
using FluentValidation;
using Implementation.Validation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OzPoslovi.Core;

namespace OzPoslovi.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly JwtManager manager;
        private readonly LoginValidator _validator;

        public LoginController(JwtManager manager, LoginValidator validator)
        {
            this.manager = manager;
            _validator = validator;
        }

        // POST: api/Login
        [HttpPost]
        public IActionResult Post([FromBody] LoginDto dto)
        {
            //Provera ulaza
            _validator.ValidateAndThrow(dto);

            var token = manager.MakeToken(dto.Email, dto.Password);

            if (token == null)
            {
                return Unauthorized();
            }
            return Ok(new { token });
        }

    }
}
