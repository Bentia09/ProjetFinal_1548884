using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("Orchestre", Schema = "Orchestres")]
    public partial class Orchestre
    {
        public Orchestre()
        {
            ChoixOrchestrePieceMusiques = new HashSet<ChoixOrchestrePieceMusique>();
            Etudiants = new HashSet<Etudiant>();
        }

        [Key]
        [Column("OrchestreID")]
        public int OrchestreId { get; set; }
        public int NbEtudiant { get; set; }
        public int NbSection { get; set; }
        [StringLength(20)]
        [Unicode(false)]
        public string NoLocal { get; set; } = null!;
        [Column("ProfesseurID")]
        public int ProfesseurId { get; set; }

        [ForeignKey("ProfesseurId")]
        [InverseProperty("Orchestres")]
        public virtual Professeur Professeur { get; set; } = null!;
        [InverseProperty("Orchestre")]
        public virtual ICollection<ChoixOrchestrePieceMusique> ChoixOrchestrePieceMusiques { get; set; }
        [InverseProperty("Orchestre")]
        public virtual ICollection<Etudiant> Etudiants { get; set; }
    }
}
