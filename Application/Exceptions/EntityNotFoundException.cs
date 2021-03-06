﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class EntityNotFoundException : Exception
    {
        public EntityNotFoundException(int id, Type type) : base($"Entity with type of : {type.Name} and id : {id} not found!")
        { }
    }
}
