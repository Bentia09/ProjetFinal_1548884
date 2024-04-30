using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("Professeur", Schema = "Professeurs")]
    public partial class Professeur
    {
        public Professeur()
        {
            Adresses = new HashSet<Adresse>();
            Orchestres = new HashSet<Orchestre>();
        }

        [Key]
        [Column("ProfesseurID")]
        public int ProfesseurId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string Nom { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Prenom { get; set; } = null!;
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }
        public byte[]? NoEmployeChiffre { get; set; }

        [ForeignKey("InstrumentId")]
        [InverseProperty("Professeurs")]
        public virtual Instrument Instrument { get; set; } = null!;
        [InverseProperty("Professeur")]
        public virtual ICollection<Adresse> Adresses { get; set; }
        [InverseProperty("Professeur")]
        public virtual ICollection<Orchestre> Orchestres { get; set; }
    }
}
