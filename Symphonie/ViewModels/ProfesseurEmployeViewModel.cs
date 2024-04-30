using Symphonie.Models;


namespace Symphonie.ViewModels
{
    public class ProfesseurEmployeViewModel
    {
        public Professeur Professeur { get; set; } = null!;
        public List<NoEmplye> NoEmployes { get; set; } = null!;
    }
}
