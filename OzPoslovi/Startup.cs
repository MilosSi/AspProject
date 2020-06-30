using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application;
using Application.Commands.Category;
using Application.Commands.Job;
using Application.Commands.Jobvacancies;
using Application.Commands.JobvacanciesAdmin;
using Application.Commands.Location;
using Application.Commands.Registration;
using Application.Queries;
using Application.Queries.Categories;
using Application.Queries.Job;
using Application.Queries.Jobvacancies;
using Application.Queries.JobvacanciesAdmin;
using Application.Queries.UseCaseLog;
using EFDataAccess;
using Implementation.Commands;
using Implementation.Commands.CategoryCommands;
using Implementation.Commands.JobCommands;
using Implementation.Commands.JobvacanciesAdminCommands;
using Implementation.Commands.JobvacanciesCommands;
using Implementation.Commands.LocationCommands;
using Implementation.Commands.RegistrationCommands;
using Implementation.Email;
using Implementation.Logging;
using Implementation.Queries.Categories;
using Implementation.Queries.Job;
using Implementation.Queries.JobvacanciesAdminQueries;
using Implementation.Queries.JobvacanciesQueries;
using Implementation.Queries.LocationQueries;
using Implementation.Queries.UseCaseLoggerQueries;
using Implementation.Validation;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using OzPoslovi.Core;

namespace OzPoslovi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddTransient<OzposloviContext>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<JwtManager>();

            //UseCase
            services.AddUseCases();
            services.AddTransient<Application.ILogger, DatabaseLogger>();
            //Email
            services.AddTransient<ISendEmail, SmtpEmailSender>();

            //Validators
            services.AddValidators();


            //Jwt
            services.AddHttpContextAccessor();
            services.GetActor();
            services.AddJwt();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Ozposlovi API", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                    }
                });
            });

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseCors(x =>
            {
                x.AllowAnyOrigin();
                x.AllowAnyMethod();
                x.AllowAnyHeader();
            });

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });

            app.UseRouting();
            app.UseStaticFiles();

            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
