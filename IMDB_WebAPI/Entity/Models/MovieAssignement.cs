using System;
using System.Collections.Generic;

namespace Entity.Models
{
    public partial class MovieAssignement
    {
        public int MaId { get; set; }
        public int? MaMovieId { get; set; }
        public int? MaUserId { get; set; }

        public Movies MaMovie { get; set; }
        public UserDetails MaUser { get; set; }
    }
}
