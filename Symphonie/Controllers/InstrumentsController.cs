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
    public class InstrumentsController : Controller
    {
        private readonly BD_OrchestreContext _context;

        public InstrumentsController(BD_OrchestreContext context)
        {
            _context = context;
        }

        // GET: Instruments

        public async Task<IActionResult> Index()
        {
           var instruments = await _context.Instruments.ToListAsync();

            
            var imageViewModels = instruments.Select(x => new ImageViewModel
            {
                Instrument = x,
                PhotoUrl = x.Photo == null ? null : $"data:image/png;base64,{Convert.ToBase64String(x.Photo)}"
            }).ToList();

            return View(imageViewModels);
        }


        // GET: Instruments/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Instruments == null)
            {
                return NotFound();
            }

            var instrument = await _context.Instruments
                .FirstOrDefaultAsync(m => m.InstrumentId == id);
            if (instrument == null)
            {
                return NotFound();
            }


            string query = "EXEC Etudiants.USP_EtudiantParSonInstrument @NomInstrument";
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter{ParameterName="@NomInstrument",Value=instrument.NomInstrument}


            };

            var etudiant= await _context.Etudiants.FromSqlRaw(query, parameters.ToArray()).ToListAsync();

            var viewModel = new InstrumentEtSesEtudiants
            {
                Instrument = instrument,
                Etudiants = etudiant
            };

            return View(viewModel);
        }

        // GET: Instruments/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Instruments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ImageUploadViewModel imageVM)
        {
            if (ModelState.IsValid)
            {

                if(imageVM.FormFile !=null && imageVM.FormFile.Length>=0  )

                {
                    MemoryStream stream = new MemoryStream(); 
                    await imageVM.FormFile.CopyToAsync(stream);
                    byte[] photo = stream.ToArray();

                    imageVM.Instrument.Photo= photo;


                }




                _context.Add(imageVM.Instrument);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(imageVM.Instrument);
        }

        // GET: Instruments/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Instruments == null)
            {
                return NotFound();
            }

            var instrument = await _context.Instruments.FindAsync(id);
            if (instrument == null)
            {
                return NotFound();
            }
            return View(instrument);
        }

        // POST: Instruments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("InstrumentId,NomInstrument")] Instrument instrument)
        {
            if (id != instrument.InstrumentId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(instrument);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InstrumentExists(instrument.InstrumentId))
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
            return View(instrument);
        }

        // GET: Instruments/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Instruments == null)
            {
                return NotFound();
            }

            var instrument = await _context.Instruments
                .FirstOrDefaultAsync(m => m.InstrumentId == id);
            if (instrument == null)
            {
                return NotFound();
            }

            return View(instrument);
        }

        // POST: Instruments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Instruments == null)
            {
                return Problem("Entity set 'BD_OrchestreContext.Instruments'  is null.");
            }
            var instrument = await _context.Instruments.FindAsync(id);
            if (instrument != null)
            {
                _context.Instruments.Remove(instrument);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool InstrumentExists(int id)
        {
          return (_context.Instruments?.Any(e => e.InstrumentId == id)).GetValueOrDefault();
        }
    }
}
