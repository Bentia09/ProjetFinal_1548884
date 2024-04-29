using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("InstrumentCorde", Schema = "Orchestres")]
    public partial class InstrumentCorde
    {
        [Key]
        [Column("InstrumentCordeID")]
        public int InstrumentCordeId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string TypeCorde { get; set; } = null!;
        public int NbCorde { get; set; }
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }

        [ForeignKey("InstrumentId")]
        [InverseProperty("InstrumentCordes")]
        public virtual Instrument Instrument { get; set; } = null!;
    }
}
