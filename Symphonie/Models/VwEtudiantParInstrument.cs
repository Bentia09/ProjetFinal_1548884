using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Keyless]
    public partial class VwEtudiantParInstrument
    {
        [Column("EtudiantID")]
        public int EtudiantId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string NoEtudiant { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Prenom { get; set; } = null!;
        [StringLength(50)]
        [Unicode(false)]
        public string Nom { get; set; } = null!;
        [Column("InstrumentID")]
        public int InstrumentId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string NomInstrument { get; set; } = null!;
    }
}
