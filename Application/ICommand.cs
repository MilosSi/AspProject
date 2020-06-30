using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface ICommand<TRequest> : UseCase
    {
        void Execute(TRequest request);
    }
    public interface IQuery<TSearch,TResult> : UseCase
    {
        TResult Execute(TSearch search);
    }

    public interface UseCase
    {
        int Id { get; }
        string Name { get; }
    }
}
