using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
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
    public class EtudiantsController : Controller
    {
        private readonly BD_OrchestreContext _context;

        public EtudiantsController(BD_OrchestreContext context)
        {
            _context = context;
        }

        // GET: Etudiants
        public async Task<IActionResult> Index()
        {
            List<VwEtudiantParInstrument> vue = await _context.VwEtudiantParInstruments.ToListAsync();


            return View(vue);



        }

       
        // GET: Etudiants/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Etudiants == null)
            {
                return NotFound();
            }

            var etudiant = await _context.Etudiants
                .Include(e => e.Instrument)
                .Include(e => e.Orchestre)
                .FirstOrDefaultAsync(m => m.EtudiantId == id);
            if (etudiant == null)
            {
                return NotFound();
            }

            return View(etudiant);
        }

      
        public async Task<IActionResult>LesEtudiantFiltre(int? niveau, string NoEtudiant, int? OrchestreID  )

        {
            var etudiantsQuery = _context.Etudiants.AsQueryable();

            if (niveau.HasValue)
            {
                etudiantsQuery = etudiantsQuery.Where(x => x.Niveau == niveau);
            }

            if (!string.IsNullOrEmpty(NoEtudiant))
            {
                etudiantsQuery = etudiantsQuery.Where(x => x.NoEtudiant == NoEtudiant);
            }

            if (OrchestreID.HasValue)
            {
                etudiantsQuery = etudiantsQuery.Where(x => x.OrchestreId == OrchestreID);
            }

            var etudiants = await etudiantsQuery.ToListAsync();

            return View(etudiants);

        }



    }
}
