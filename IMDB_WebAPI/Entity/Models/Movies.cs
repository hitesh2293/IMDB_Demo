using System;
using System.Collections.Generic;

namespace Entity.Models
{
    public partial class Movies
    {
        public Movies()
        {
            MovieAssignement = new HashSet<MovieAssignement>();
        }

        public int MId { get; set; }
        public string MName { get; set; }
        public string MYearOfRelease { get; set; }
        public string MPlot { get; set; }
        public string MPoster { get; set; }
        public bool? MIsDeleted { get; set; }

        public ICollection<MovieAssignement> MovieAssignement { get; set; }
    }
}
