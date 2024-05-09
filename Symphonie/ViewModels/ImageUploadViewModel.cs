using Symphonie.Models;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Drawing;

namespace Symphonie.ViewModels
{
    public class ImageUploadViewModel
    {
        [Required(ErrorMessage = "Il faut joindre un fichier image.")]
        public IFormFile FormFile { get; set; } = null!;
        public Instrument Instrument { get; set; }
    }
}
