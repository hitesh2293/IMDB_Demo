using Entity.Models;
using Manager.IManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Manager.Manager
{
    public class UserManager : IUserManager
    {
        public IContext _context;

        public UserManager(IContext context)
        {
            _context = context;
        }

        List<UserDetails> IUserManager.GetAllActors()
        {
            int actorUserTypeID = _context.LkpUserType.Where(cond => cond.UtTypeName == "Actors").FirstOrDefault().UtId;
            return _context.UserDetails.Where(cond => !cond.UdIsDeleted.Value && cond.UdUserType == actorUserTypeID).ToList();
        }
        List<UserDetails> IUserManager.GetAllProducers()
        {
            int producerUserTypeID = _context.LkpUserType.Where(cond => cond.UtTypeName == "Prodcucers").FirstOrDefault().UtId;
            return _context.UserDetails.Where(cond => !cond.UdIsDeleted.Value && cond.UdUserType == producerUserTypeID).ToList();
        }
        bool IUserManager.CreateUser(UserDetails userDetails)
        {
            _context.UserDetails.Add(userDetails);

            if (_context.SaveChanges() > 0)
                return true;
            return false;
        }
        bool IUserManager.UpdateUser(UserDetails userDetails)
        {
            var currentUD = _context.UserDetails.Where(cond => cond.UdId == userDetails.UdId && !cond.UdIsDeleted.Value).FirstOrDefault();

            if(currentUD != null)
            {
                currentUD.UdName = userDetails.UdName;
                currentUD.UdSex = userDetails.UdSex;
                currentUD.UdDob = userDetails.UdDob;
                currentUD.UdBio = userDetails.UdBio;
                currentUD.UdUserType = userDetails.UdUserType;
            }

            if (_context.SaveChanges() > 0)
                return true;
            return false;
        }

        UserDetails IUserManager.GetUserDetailsById(int userId)
        {
            return _context.UserDetails.Where(cond => cond.UdId == userId && !cond.UdIsDeleted.Value).FirstOrDefault();
        }
    }
}
