using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("ArchiveEtudiant", Schema = "Etudiants")]
    public partial class ArchiveEtudiant
    {
        [Key]
        [Column("ArchirveEtudiantID")]
        public int ArchirveEtudiantId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string Nom { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Prenom { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string NoEtudiant { get; set; } = null!;
        public int Niveau { get; set; }
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }
        [Column("OrchestreID")]
        public int OrchestreId { get; set; }
        [Column("EtudiantID")]
        public int EtudiantId { get; set; }
        [Column(TypeName = "date")]
        public DateTime Date { get; set; }
    }
}
