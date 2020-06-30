using Application;
using Application.DataTransfer;
using EFDataAccess;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Implementation.Email
{
    public class SmtpEmailSender : ISendEmail
    {
        private readonly OzposloviContext _context;
        private readonly IAppActor _actor;

        public SmtpEmailSender(OzposloviContext context, IAppActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public void Send(SendEmailDto dto)
        {
            var user = _context.Users.Find(dto.UserId);


            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("milosemailsender@gmail.com", "milosmilos12345")
            };

            var message = new MailMessage("milosemailsender@gmail.com", user.Email);
            message.Subject = dto.Subject;
            message.Body = dto.Content;
            message.IsBodyHtml = true;
            if(_actor.Id == 1)
            {
                smtp.Send(message);
            }
            
        }
    }
}
