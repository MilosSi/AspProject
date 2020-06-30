using Application;
using Application.Commands.Category;
using Application.Commands.Job;
using Application.Commands.Jobvacancies;
using Application.Commands.JobvacanciesAdmin;
using Application.Commands.Location;
using Application.Commands.Registration;
using Application.Commands.UserInfo;
using Application.Queries;
using Application.Queries.Categories;
using Application.Queries.Job;
using Application.Queries.Jobvacancies;
using Application.Queries.JobvacanciesAdmin;
using Application.Queries.UseCaseLog;
using Application.Queries.UserInfo;
using Implementation.Commands;
using Implementation.Commands.CategoryCommands;
using Implementation.Commands.JobCommands;
using Implementation.Commands.JobvacanciesAdminCommands;
using Implementation.Commands.JobvacanciesCommands;
using Implementation.Commands.LocationCommands;
using Implementation.Commands.RegistrationCommands;
using Implementation.Commands.UserInfoCommands;
using Implementation.Queries.Categories;
using Implementation.Queries.Job;
using Implementation.Queries.JobvacanciesAdminQueries;
using Implementation.Queries.JobvacanciesQueries;
using Implementation.Queries.LocationQueries;
using Implementation.Queries.UseCaseLoggerQueries;
using Implementation.Queries.UserInfoQueries;
using Implementation.Validation;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OzPoslovi.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            //Location
            services.AddTransient<AddLocation, EFAddLocation>();
            services.AddTransient<RemoveLocation, EFRemoveLocation>();
            services.AddTransient<UpdateLocation, EFUpdateLocation>();
            services.AddTransient<IGetLocation, EFGetLocation>();
            //Category
            services.AddTransient<IGetCategories, EFGetCategories>();
            services.AddTransient<IAddCategory, EFAddCategory>();
            services.AddTransient<IUpdateCategory, EFUpdateCategory>();
            services.AddTransient<IRemoveCategory, EFRemoveCategory>();
            //Job
            services.AddTransient<IAddJob, EFAddJob>();
            services.AddTransient<IGetJobs, EFGetJobs>();
            services.AddTransient<IGetJobById, EFGetJobById>();
            services.AddTransient<IUpdateJob, EFUpdateJob>();
            services.AddTransient<IRemoveJob, EFRemoveJob>();
            //UseCaseLogger
            services.AddTransient<IGetUseCaseLogger, EFGetUseCaseLog>();
            //JobVacansies
            services.AddTransient<ICreatedJobvacancie, EFCreateJobvacancie>();
            services.AddTransient<IGetUserJobvacancies, EFGetJobvacancies>();
            services.AddTransient<IRemoveUserJobVacancie, EFRemoveUsersJobVacancie>();
            //JobVacansiesAdmin
            services.AddTransient<IGetAllJobvacanciesAdmin, EFGetAllJobvacanciesAdmin>();
            services.AddTransient<IGetJobvacancieId, EFGetJobvacancieById>();
            services.AddTransient<IChangeStatusOfJobVacancie, EFChangeStatus>();
            services.AddTransient<IRemoveJobVacancieAdmin, EFRemoveJobVacancieAdmin>();
            //Reg and log
            services.AddTransient<IRegister, EFRegistration>();
            //User info
            services.AddTransient<IGetUserById, EGGetUserInfoById>();
            services.AddTransient<IChangeUserPassword, EFChangeUserPassword>();
            services.AddTransient<IUpdateUser, EFUpdateUser>();
            services.AddTransient<IGetAllUsers, EFGetAllUsers>();
        }

        public static void GetActor(this IServiceCollection services)
        {
            services.AddTransient<IAppActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
                //izvuci token
                //pozicionirati se na payload
                //izvuci ActorData claim
                //Deserijalizovati actorData string u c# objekat

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });
        }

        public static void AddValidators(this IServiceCollection services)
        {
            services.AddTransient<LocationValidator>();
            services.AddTransient<RegistrationValidation>();
            services.AddTransient<CategoryValidation>();
            services.AddTransient<JobValidation>();
            services.AddTransient<LoginValidator>();
            services.AddTransient<JobvacanciesValidator>();
            services.AddTransient<JobvacanciesValidatorAdmin>();
            services.AddTransient<UserUpdateValidation>();
            services.AddTransient<ChangePasswordValidator>();
        }

        public static void AddJwt(this IServiceCollection services)
        {
            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "ozposlovi_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }
    }
}
