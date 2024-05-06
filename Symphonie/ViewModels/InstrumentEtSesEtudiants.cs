using Symphonie.Models;
using Symphonie.ViewModels;


namespace Symphonie.ViewModels
{
    public class InstrumentEtSesEtudiants
    {
        public Instrument Instrument { get; set; } = null!;
        public List<Etudiant> Etudiants { get; set; } = null!;
    }
}
