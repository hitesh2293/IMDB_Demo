using Entity.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Manager.IManager
{
    public interface IUserManager
    {
        List<UserDetails> GetAllActors();
        List<UserDetails> GetAllProducers();
        bool CreateUser(UserDetails userDetails);
        bool UpdateUser(UserDetails userDetails);
        UserDetails GetUserDetailsById(int userId);
        //bool RemoveActor(UserDetails userDetails);
        //bool RemoveProducer(UserDetails userDetails);
    }
}
