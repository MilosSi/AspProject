using Application.Commands.Job;
using Application.DataTransfer;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.JobCommands
{
    public class EFAddJob : IAddJob
    {
        private readonly OzposloviContext _context;
        private readonly JobValidation _validation;

        public EFAddJob(OzposloviContext context, JobValidation validation)
        {
            _context = context;
            _validation = validation;
        }

        public int Id => 10;

        public string Name => "Add new job";

        public void Execute(JobDto request)
        {
            _validation.ValidateAndThrow(request);

            var job = new Job
            {
                JobName = request.JobName,
                JobResponsibilities = request.JobResponsibilities,
                JobRequirments = request.JobRequirments,
                JobDescription = request.JobDescription,
                WorktimeId = (Worktime)request.WorktimeId,
                WorktimeDescription = request.WorktimeDescription,
                PaymentId = (Payment)request.PaymentId,
                PaymentDescription = request.PaymentDescription,
                EndDate = request.EndDate,
                IsFeatured = request.IsFeatured,
                IsPremium = request.IsPremium

            };

            foreach(var category in request.Categories)
            {
                job.JobCategories.Add(new JobCategory { CategoryId = category.Id });
            }

            foreach(var location in request.Locations)
            {
                job.JobLocations.Add(new JobLocation
                {
                    LocationId = location.Id,
                    DetailedLocation = location.DetailedLocation
                });
            }

            _context.Add(job);
            _context.SaveChanges();
        }
    }
}
