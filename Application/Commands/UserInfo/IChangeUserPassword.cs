using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.UserInfo
{
    public interface IChangeUserPassword : ICommand<ChangePasswordDto>
    {
    }
}
