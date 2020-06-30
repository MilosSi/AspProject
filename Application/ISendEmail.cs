using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface ISendEmail
    {
        void Send(SendEmailDto dto);
    }
}
