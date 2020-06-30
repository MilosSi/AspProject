using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.DataTransfer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OzPoslovi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class sendEmailController : ControllerBase
    {
      

      

        // POST: api/sendEmail
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] SendEmailDto dto,[FromServices] ISendEmail email)
        {
            email.Send(dto);
            return Ok();
        }

     

     
    }
}
