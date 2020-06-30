using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.UserInfo
{
    public interface IGetUserById : IQuery<int,UserInfoDto>
    {
    }
}
