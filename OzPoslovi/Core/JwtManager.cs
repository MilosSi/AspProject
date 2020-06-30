using Application;
using EFDataAccess;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace OzPoslovi.Core
{
    public class JwtManager
    {
        private readonly OzposloviContext _context;

        public JwtManager(OzposloviContext context)
        {
            _context = context;
        }

        public string MakeToken(string email, string password)
        {
            var user = _context.Users.Include(u => u.Role).ThenInclude(r => r.RoleUseCases)
                .FirstOrDefault(u => u.Email == email && u.Password == password);

            if(user == null)
            {
                return null;
            }

            IAppActor actor;
            if (user.RoleId != 1)
            {
                actor = new JwtActor
                {
                    Id = user.Id,
                    Name = user.Username,
                    AllowedUseCases = user.Role.RoleUseCases.Select(u => u.UseCaseId)
                };
            }
            else
            {
                actor = new JwtActor
                {
                    Id = user.Id,
                    Name = user.Username,
                    AllowedUseCases = Enumerable.Range(1, 50)
            };
            }
            

            var issuer = "ozposlovi_api";
            var secretKey = "ThisIsMyVerySecretKey";
            var claims = new List<Claim> // Jti : "", 
            {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iss, "ozposlovi_api", ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, issuer),
                new Claim("UserId", actor.Id.ToString(), ClaimValueTypes.String, issuer),
                new Claim("ActorData", JsonConvert.SerializeObject(actor), ClaimValueTypes.String, issuer)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.AddSeconds(120),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
