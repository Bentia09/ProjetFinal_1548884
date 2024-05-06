using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Symphonie.Data;
using Symphonie.Models;
using Symphonie.ViewModels;

namespace Symphonie.Controllers
{
    public class ProfesseursController : Controller
    {
        private readonly BD_OrchestreContext _context;

        public ProfesseursController(BD_OrchestreContext context)
        {
            _context = context;
        }

        // GET: Professeurs
        public async Task<IActionResult> Index()
        {
            var bD_OrchestreContext = _context.Professeurs.Include(p => p.Instrument);
            return View(await bD_OrchestreContext.ToListAsync());



        }

        // GET: Professeurs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Professeurs == null)
            {
                return NotFound();
            }

            var professeur = await _context.Professeurs
                .Include(p => p.Instrument)
                .FirstOrDefaultAsync(m => m.ProfesseurId == id);
            if (professeur == null)
            {
                return NotFound();
            }
            string query = "EXEC Professeurs.USP_RecuperationNoEmploye @ProfesseurID";

            List<SqlParameter> parameters = new List<SqlParameter>
            {
            new SqlParameter{ParameterName="@ProfesseurID", Value=professeur.ProfesseurId}

            };
             List<NoEmplye> noEmployes = await _context.NoEmplyes.FromSqlRaw(query, parameters.ToArray()).ToListAsync();

            
            ProfesseurEmployeViewModel viewModel= new ProfesseurEmployeViewModel()
            { Professeur=professeur,
            
            NoEmployes=noEmployes
            
            
            };

            return View(viewModel);
        }

        

       
        
    }
}
