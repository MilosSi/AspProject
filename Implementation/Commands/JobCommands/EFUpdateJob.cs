using Application.Commands.Job;
using Application.DataTransfer;
using Application.Exceptions;
using Domain;
using EFDataAccess;
using FluentValidation;
using Implementation.Validation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands.JobCommands
{
    public class EFUpdateJob : IUpdateJob
    {
        private readonly OzposloviContext _context;
        private readonly JobValidation _validation;

        public EFUpdateJob(OzposloviContext context, JobValidation validation)
        {
            _context = context;
            _validation = validation;
        }

        public int Id => 13;

        public string Name => "Update job EF";

        public void Execute(JobUpdate request)
        {
            _validation.ValidateAndThrow(request.Dto);
            var job=_context.Jobs
                .Include(j => j.JobCategories).ThenInclude(c => c.Category)
                .Include(j => j.JobLocations).ThenInclude(l => l.Location)
                .FirstOrDefault(j => j.Id == request.Id);
            if (job == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Job));
            }


            job.JobName = request.Dto.JobName;
            job.JobResponsibilities = request.Dto.JobResponsibilities;
            job.JobRequirments = request.Dto.JobRequirments;
            job.JobDescription = request.Dto.JobDescription;
            job.WorktimeId = (Worktime)request.Dto.WorktimeId;
            job.WorktimeDescription = request.Dto.WorktimeDescription;
            job.PaymentId = (Payment)request.Dto.PaymentId;
            job.PaymentDescription = request.Dto.PaymentDescription;
            job.EndDate = request.Dto.EndDate;
            job.IsFeatured = request.Dto.IsFeatured;
            job.IsPremium = request.Dto.IsPremium;


            job.JobCategories.Clear();
            foreach (var category in request.Dto.Categories)
            {
                job.JobCategories.Add(new JobCategory { CategoryId = category.Id });
            }

            job.JobLocations.Clear();
            foreach (var location in request.Dto.Locations)
            {
                job.JobLocations.Add(new JobLocation
                {
                    LocationId = location.Id,
                    DetailedLocation = location.DetailedLocation
                });
            }

            _context.SaveChanges();


        }
    }
}
