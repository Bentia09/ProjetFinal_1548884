using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("PieceMusique", Schema = "Orchestres")]
    public partial class PieceMusique
    {
        public PieceMusique()
        {
            ChoixOrchestrePieceMusiques = new HashSet<ChoixOrchestrePieceMusique>();
        }

        [Key]
        [Column("PieceMusiqueID")]
        public int PieceMusiqueId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string Titre { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Auteur { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Difficulte { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string StyleMusique { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Tonalite { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Tempo { get; set; } = null!;
        [Column("ProfesseurID")]
        public int ProfesseurId { get; set; }
        [Column("OrchestreID")]
        public int OrchestreId { get; set; }

        [InverseProperty("PieceMusique")]
        public virtual ICollection<ChoixOrchestrePieceMusique> ChoixOrchestrePieceMusiques { get; set; }
    }
}
