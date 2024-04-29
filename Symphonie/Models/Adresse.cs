using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("Adresse", Schema = "Adresses")]
    [Index("NoPorte", Name = "UQ_Adresse_NoPorte", IsUnique = true)]
    public partial class Adresse
    {
        [Key]
        [Column("AdresseID")]
        public int AdresseId { get; set; }
        [StringLength(10)]
        [Unicode(false)]
        public string NoPorte { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Rue { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Ville { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Province { get; set; } = null!;
        [Column("EtudiantID")]
        public int EtudiantId { get; set; }
        [Column("ProfesseurID")]
        public int ProfesseurId { get; set; }

        [ForeignKey("EtudiantId")]
        [InverseProperty("Adresses")]
        public virtual Etudiant Etudiant { get; set; } = null!;
        [ForeignKey("ProfesseurId")]
        [InverseProperty("Adresses")]
        public virtual Professeur Professeur { get; set; } = null!;
    }
}
