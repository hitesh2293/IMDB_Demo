using System;
using System.Collections.Generic;
using System.Text;

namespace Entity.DTO
{
    public class UserDetailsDTO
    {
        public int UdId { get; set; }
        public int? UdUserType { get; set; }
        public string UdName { get; set; }
        public int? UdSex { get; set; }
        public DateTime? UdDob { get; set; }
        public string UdBio { get; set; }
        public bool? UdIsDeleted { get; set; }
        public string DateOfBirth { get; set; }
    }
}
