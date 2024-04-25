using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("ChoixOrchestrePieceMusique", Schema = "Orchestres")]
    public partial class ChoixOrchestrePieceMusique
    {
        [Key]
        [Column("ChoixOrchestrePieceMusiqueID")]
        public int ChoixOrchestrePieceMusiqueId { get; set; }
        [Column(TypeName = "date")]
        public DateTime DateDuChoix { get; set; }
        [Column("OrchestreID")]
        public int OrchestreId { get; set; }
        [Column("PieceMusiqueID")]
        public int PieceMusiqueId { get; set; }

        [ForeignKey("OrchestreId")]
        [InverseProperty("ChoixOrchestrePieceMusiques")]
        public virtual Orchestre Orchestre { get; set; } = null!;
        [ForeignKey("PieceMusiqueId")]
        [InverseProperty("ChoixOrchestrePieceMusiques")]
        public virtual PieceMusique PieceMusique { get; set; } = null!;
    }
}
