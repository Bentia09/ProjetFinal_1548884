using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Symphonie.Models
{
    [Keyless]
    [Table("NoEmplye", Schema = "Professeurs")]
    public partial class NoEmplye
    {
        [StringLength(50)]
        [Unicode(false)]
        public string NoEmployeClaire { get; set; } = null!;
    }
}
