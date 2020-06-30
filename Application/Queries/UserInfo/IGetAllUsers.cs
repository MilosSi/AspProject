using Application.DataTransfer;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries.UserInfo
{
    public interface IGetAllUsers : IQuery<UserInfoSearch,PagedResponse<UserInfoDto>>
    {

    }
}
