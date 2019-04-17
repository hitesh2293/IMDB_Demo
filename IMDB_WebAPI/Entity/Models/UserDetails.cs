using System;
using System.Collections.Generic;

namespace Entity.Models
{
    public partial class UserDetails
    {
        public UserDetails()
        {
            MovieAssignement = new HashSet<MovieAssignement>();
        }

        public int UdId { get; set; }
        public int? UdUserType { get; set; }
        public string UdName { get; set; }
        public int? UdSex { get; set; }
        public DateTime? UdDob { get; set; }
        public string UdBio { get; set; }
        public bool? UdIsDeleted { get; set; }

        public LkpGender UdSexNavigation { get; set; }
        public LkpUserType UdUserTypeNavigation { get; set; }
        public ICollection<MovieAssignement> MovieAssignement { get; set; }
    }
}
