using System;
using System.Collections.Generic;

namespace Entity.Models
{
    public partial class LkpGender
    {
        public LkpGender()
        {
            UserDetails = new HashSet<UserDetails>();
        }

        public int GenderId { get; set; }
        public string GenderName { get; set; }
        public string GenderCode { get; set; }

        public ICollection<UserDetails> UserDetails { get; set; }
    }
}
