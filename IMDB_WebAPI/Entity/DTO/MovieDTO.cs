using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entity.DTO
{
    public class MovieDTO
    {
        public int MId { get; set; }
        public string MName { get; set; }
        public string MYearOfRelease { get; set; }
        public string MPlot { get; set; }
        public string MPoster { get; set; }
        public bool? MIsDeleted { get; set; }

        [NotMapped]
        public int ProducerId { get; set; }
        [NotMapped]
        public List<int> LstActorIds { get; set; }

        public string ProducerName { get; set; }
        public string ActorsName { get; set; }

        [NotMapped]
        public ICollection<MovieAssignementDTO> MovieAssignement { get; set; }
    }
}
