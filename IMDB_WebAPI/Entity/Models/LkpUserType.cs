using System;
using System.Collections.Generic;

namespace Entity.Models
{
    public partial class LkpUserType
    {
        public LkpUserType()
        {
            UserDetails = new HashSet<UserDetails>();
        }

        public int UtId { get; set; }
        public string UtTypeName { get; set; }

        public ICollection<UserDetails> UserDetails { get; set; }
    }
}
