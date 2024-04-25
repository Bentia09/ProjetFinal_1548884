using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("Instrument", Schema = "Orchestres")]
    public partial class Instrument
    {
        public Instrument()
        {
            Etudiants = new HashSet<Etudiant>();
            InstrumentCordes = new HashSet<InstrumentCorde>();
            InstrumentVents = new HashSet<InstrumentVent>();
            Percussions = new HashSet<Percussion>();
            Professeurs = new HashSet<Professeur>();
        }

        [Key]
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string NomInstrument { get; set; } = null!;

        [InverseProperty("Instrument")]
        public virtual ICollection<Etudiant> Etudiants { get; set; }
        [InverseProperty("Instrument")]
        public virtual ICollection<InstrumentCorde> InstrumentCordes { get; set; }
        [InverseProperty("Instrument")]
        public virtual ICollection<InstrumentVent> InstrumentVents { get; set; }
        [InverseProperty("Instrument")]
        public virtual ICollection<Percussion> Percussions { get; set; }
        [InverseProperty("Instrument")]
        public virtual ICollection<Professeur> Professeurs { get; set; }
    }
}
