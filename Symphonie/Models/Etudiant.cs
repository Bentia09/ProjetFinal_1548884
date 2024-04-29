using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Table("Etudiant", Schema = "Etudiants")]
    [Index("NoEtudiant", Name = "UQ_Etudiant_NoEtudiant", IsUnique = true)]
    public partial class Etudiant
    {
        public Etudiant()
        {
            Adresses = new HashSet<Adresse>();
        }

        [Key]
        [Column("EtudiantID")]
        public int EtudiantId { get; set; }
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

        [ForeignKey("InstrumentId")]
        [InverseProperty("Etudiants")]
        public virtual Instrument Instrument { get; set; } = null!;
        [ForeignKey("OrchestreId")]
        [InverseProperty("Etudiants")]
        public virtual Orchestre Orchestre { get; set; } = null!;
        [InverseProperty("Etudiant")]
        public virtual ICollection<Adresse> Adresses { get; set; }
    }
}
