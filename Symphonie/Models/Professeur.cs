using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("Professeur", Schema = "Professeurs")]
    [Index("NoEmploye", Name = "UQ_Professeur_NoEmploye", IsUnique = true)]
    [Index("NoEmploye", Name = "UQ__Professe__1A6A07C2FBD6F9F4", IsUnique = true)]
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
        [StringLength(50)]
        [Unicode(false)]
        public string NoEmploye { get; set; } = null!;
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }

        [ForeignKey("InstrumentId")]
        [InverseProperty("Professeurs")]
        public virtual Instrument Instrument { get; set; } = null!;
        [InverseProperty("Professeur")]
        public virtual ICollection<Adresse> Adresses { get; set; }
        [InverseProperty("Professeur")]
        public virtual ICollection<Orchestre> Orchestres { get; set; }
    }
}
