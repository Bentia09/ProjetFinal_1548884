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
          var vue = await _context.VwEtudiantParInstruments.ToListAsync();


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

        // GET: Etudiants/Create
        public IActionResult Create()
        {
            ViewData["InstrumentId"] = new SelectList(_context.Instruments, "InstrumentId", "InstrumentId");
            ViewData["OrchestreId"] = new SelectList(_context.Orchestres, "OrchestreId", "OrchestreId");
            return View();
        }

        // POST: Etudiants/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("EtudiantId,Nom,Prenom,NoEtudiant,Niveau,InstrumentId,OrchestreId")] Etudiant etudiant)
        {
            if (ModelState.IsValid)
            {
                _context.Add(etudiant);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["InstrumentId"] = new SelectList(_context.Instruments, "InstrumentId", "InstrumentId", etudiant.InstrumentId);
            ViewData["OrchestreId"] = new SelectList(_context.Orchestres, "OrchestreId", "OrchestreId", etudiant.OrchestreId);
            return View(etudiant);
        }

        // GET: Etudiants/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Etudiants == null)
            {
                return NotFound();
            }

            var etudiant = await _context.Etudiants.FindAsync(id);
            if (etudiant == null)
            {
                return NotFound();
            }
            ViewData["InstrumentId"] = new SelectList(_context.Instruments, "InstrumentId", "InstrumentId", etudiant.InstrumentId);
            ViewData["OrchestreId"] = new SelectList(_context.Orchestres, "OrchestreId", "OrchestreId", etudiant.OrchestreId);
            return View(etudiant);
        }

        // POST: Etudiants/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("EtudiantId,Nom,Prenom,NoEtudiant,Niveau,InstrumentId,OrchestreId")] Etudiant etudiant)
        {
            if (id != etudiant.EtudiantId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(etudiant);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EtudiantExists(etudiant.EtudiantId))
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
            ViewData["InstrumentId"] = new SelectList(_context.Instruments, "InstrumentId", "InstrumentId", etudiant.InstrumentId);
            ViewData["OrchestreId"] = new SelectList(_context.Orchestres, "OrchestreId", "OrchestreId", etudiant.OrchestreId);
            return View(etudiant);
        }

        // GET: Etudiants/Delete/5
        public async Task<IActionResult> Delete(int? id)
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

        // POST: Etudiants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Etudiants == null)
            {
                return Problem("Entity set 'BD_OrchestreContext.Etudiants'  is null.");
            }
            var etudiant = await _context.Etudiants.FindAsync(id);
            if (etudiant != null)
            {
                _context.Etudiants.Remove(etudiant);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EtudiantExists(int id)
        {
          return (_context.Etudiants?.Any(e => e.EtudiantId == id)).GetValueOrDefault();
        }
    }
}
