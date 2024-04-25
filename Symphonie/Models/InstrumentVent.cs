using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("InstrumentVent", Schema = "Orchestres")]
    public partial class InstrumentVent
    {
        [Key]
        [Column("InstrumentVentID")]
        public int InstrumentVentId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string TypeVent { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Materiaux { get; set; } = null!;
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }

        [ForeignKey("InstrumentId")]
        [InverseProperty("InstrumentVents")]
        public virtual Instrument Instrument { get; set; } = null!;
    }
}
