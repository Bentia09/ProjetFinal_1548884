USE BD_Orchestre



CREATE NONCLUSTERED INDEX IX_Etudiant_NoEtudiant ON Etudiants.Etudiant (NoEtudiant)

CREATE NONCLUSTERED INDEX IX_Etudiant_Niveau ON Etudiants.Etudiant(Niveau ASC)


CREATE NONCLUSTERED INDEX IX_Etudiant_OrchestrID ON Etudiants.Etudiant (OrchestreID)