using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Symphonie.Models;

namespace Symphonie.Data
{
    public partial class BD_OrchestreContext : DbContext
    {
        public BD_OrchestreContext()
        {
        }

        public BD_OrchestreContext(DbContextOptions<BD_OrchestreContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Adresse> Adresses { get; set; } = null!;
        public virtual DbSet<ArchiveEtudiant> ArchiveEtudiants { get; set; } = null!;
        public virtual DbSet<Changelog> Changelogs { get; set; } = null!;
        public virtual DbSet<ChoixOrchestrePieceMusique> ChoixOrchestrePieceMusiques { get; set; } = null!;
        public virtual DbSet<Etudiant> Etudiants { get; set; } = null!;
        public virtual DbSet<Instrument> Instruments { get; set; } = null!;
        public virtual DbSet<InstrumentCorde> InstrumentCordes { get; set; } = null!;
        public virtual DbSet<InstrumentVent> InstrumentVents { get; set; } = null!;
        public virtual DbSet<NoEmplye> NoEmplyes { get; set; } = null!;
        public virtual DbSet<Orchestre> Orchestres { get; set; } = null!;
        public virtual DbSet<Percussion> Percussions { get; set; } = null!;
        public virtual DbSet<PieceMusique> PieceMusiques { get; set; } = null!;
        public virtual DbSet<Professeur> Professeurs { get; set; } = null!;
        public virtual DbSet<VwEtudiantParInstrument> VwEtudiantParInstruments { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=BD_Orchestre");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Adresse>(entity =>
            {
                entity.HasOne(d => d.Etudiant)
                    .WithMany(p => p.Adresses)
                    .HasForeignKey(d => d.EtudiantId)
                    .HasConstraintName("FK_Adresse_EtudiantID");

                entity.HasOne(d => d.Professeur)
                    .WithMany(p => p.Adresses)
                    .HasForeignKey(d => d.ProfesseurId)
                    .HasConstraintName("FK_Adresse_ProfesseurID");
            });

            modelBuilder.Entity<ArchiveEtudiant>(entity =>
            {
                entity.HasKey(e => e.ArchirveEtudiantId)
                    .HasName("PK_ArchiveEtudiant_ArhciveEtudiantID");
            });

            modelBuilder.Entity<Changelog>(entity =>
            {
                entity.Property(e => e.InstalledOn).HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<ChoixOrchestrePieceMusique>(entity =>
            {
                entity.HasOne(d => d.Orchestre)
                    .WithMany(p => p.ChoixOrchestrePieceMusiques)
                    .HasForeignKey(d => d.OrchestreId)
                    .HasConstraintName("FK_ChoixOrchestrePieceMusique_OrchestreID");

                entity.HasOne(d => d.PieceMusique)
                    .WithMany(p => p.ChoixOrchestrePieceMusiques)
                    .HasForeignKey(d => d.PieceMusiqueId)
                    .HasConstraintName("FK_ChoixOrchestrePieceMusique_PieceMusiqueID");
            });

            modelBuilder.Entity<Etudiant>(entity =>
            {
                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.Etudiants)
                    .HasForeignKey(d => d.InstrumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Etudiant_InstrumentID");

                entity.HasOne(d => d.Orchestre)
                    .WithMany(p => p.Etudiants)
                    .HasForeignKey(d => d.OrchestreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Etudiant_OrchestreID");
            });

            modelBuilder.Entity<InstrumentCorde>(entity =>
            {
                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.InstrumentCordes)
                    .HasForeignKey(d => d.InstrumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InstrumentCorde_InstrumentID");
            });

            modelBuilder.Entity<InstrumentVent>(entity =>
            {
                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.InstrumentVents)
                    .HasForeignKey(d => d.InstrumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InstrumentVent_InstrumentID");
            });

            modelBuilder.Entity<Orchestre>(entity =>
            {
                entity.HasOne(d => d.Professeur)
                    .WithMany(p => p.Orchestres)
                    .HasForeignKey(d => d.ProfesseurId)
                    .HasConstraintName("FK_Orchestre_ProfesseurID");
            });

            modelBuilder.Entity<Percussion>(entity =>
            {
                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.Percussions)
                    .HasForeignKey(d => d.InstrumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Percussion_InstrumentID");
            });

            modelBuilder.Entity<Professeur>(entity =>
            {
                entity.HasOne(d => d.Instrument)
                    .WithMany(p => p.Professeurs)
                    .HasForeignKey(d => d.InstrumentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Professeur_InstruemntID");
            });

            modelBuilder.Entity<VwEtudiantParInstrument>(entity =>
            {
                entity.ToView("vw_EtudiantParInstrument", "Etudiants");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
