using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Symphonie.Data;
using Symphonie.Models;

namespace Symphonie.Controllers
{
    public class OrchestresController : Controller
    {
        private readonly BD_OrchestreContext _context;

        public OrchestresController(BD_OrchestreContext context)
        {
            _context = context;
        }

        // GET: Orchestres
        public async Task<IActionResult> Index()
        {
            var bD_OrchestreContext = _context.Orchestres.Include(o => o.Professeur);
            return View(await bD_OrchestreContext.ToListAsync());
        }

        // GET: Orchestres/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Orchestres == null)
            {
                return NotFound();
            }

            var orchestre = await _context.Orchestres
                .Include(o => o.Professeur)
                .FirstOrDefaultAsync(m => m.OrchestreId == id);
            if (orchestre == null)
            {
                return NotFound();
            }

            return View(orchestre);
        }

        // GET: Orchestres/Create
        public IActionResult Create()
        {
            ViewData["ProfesseurId"] = new SelectList(_context.Professeurs, "ProfesseurId", "ProfesseurId");
            return View();
        }

        // POST: Orchestres/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrchestreId,NbEtudiant,NbSection,NoLocal,ProfesseurId")] Orchestre orchestre)
        {
            if (ModelState.IsValid)
            {
                _context.Add(orchestre);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProfesseurId"] = new SelectList(_context.Professeurs, "ProfesseurId", "ProfesseurId", orchestre.ProfesseurId);
            return View(orchestre);
        }

        // GET: Orchestres/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Orchestres == null)
            {
                return NotFound();
            }

            var orchestre = await _context.Orchestres.FindAsync(id);
            if (orchestre == null)
            {
                return NotFound();
            }
            ViewData["ProfesseurId"] = new SelectList(_context.Professeurs, "ProfesseurId", "ProfesseurId", orchestre.ProfesseurId);
            return View(orchestre);
        }

        // POST: Orchestres/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrchestreId,NbEtudiant,NbSection,NoLocal,ProfesseurId")] Orchestre orchestre)
        {
            if (id != orchestre.OrchestreId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(orchestre);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrchestreExists(orchestre.OrchestreId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProfesseurId"] = new SelectList(_context.Professeurs, "ProfesseurId", "ProfesseurId", orchestre.ProfesseurId);
            return View(orchestre);
        }

        // GET: Orchestres/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Orchestres == null)
            {
                return NotFound();
            }

            var orchestre = await _context.Orchestres
                .Include(o => o.Professeur)
                .FirstOrDefaultAsync(m => m.OrchestreId == id);
            if (orchestre == null)
            {
                return NotFound();
            }

            return View(orchestre);
        }

        // POST: Orchestres/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Orchestres == null)
            {
                return Problem("Entity set 'BD_OrchestreContext.Orchestres'  is null.");
            }
            var orchestre = await _context.Orchestres.FindAsync(id);
            if (orchestre != null)
            {
                _context.Orchestres.Remove(orchestre);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OrchestreExists(int id)
        {
          return (_context.Orchestres?.Any(e => e.OrchestreId == id)).GetValueOrDefault();
        }
    }
}
