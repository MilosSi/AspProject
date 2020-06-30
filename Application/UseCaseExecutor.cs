using Application.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application
{
    public class UseCaseExecutor
    {
        private readonly IAppActor _actor;
        private readonly ILogger _logger;

        public UseCaseExecutor(IAppActor actor, ILogger logger)
        {
            _actor = actor;
            _logger = logger;
        }

        public TResult ExecuteQuery<TSearch, TResult>( IQuery<TSearch,TResult> query, TSearch search)
        {
            if (!_actor.AllowedUseCases.Contains(query.Id))
            {
                throw new ForbiddenUseCaseException(query.Id, _actor);
            }
            _logger.Log(query, _actor,search);
            return query.Execute(search);
        }

        public void ExecuteCommand<TRequest>(ICommand<TRequest> command,TRequest request)
        {
            if(!_actor.AllowedUseCases.Contains(command.Id))
            {
                throw new ForbiddenUseCaseException(command.Id, _actor);
            }
            _logger.Log(command, _actor,request);
            command.Execute(request);
        }
    }
}
