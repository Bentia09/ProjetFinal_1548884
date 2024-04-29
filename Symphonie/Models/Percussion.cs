using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("Percussion", Schema = "Orchestres")]
    public partial class Percussion
    {
        [Key]
        [Column("PercussionID")]
        public int PercussionId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string TypePercussion { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string MateriauxPercussion { get; set; } = null!;
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }

        [ForeignKey("InstrumentId")]
        [InverseProperty("Percussions")]
        public virtual Instrument Instrument { get; set; } = null!;
    }
}
