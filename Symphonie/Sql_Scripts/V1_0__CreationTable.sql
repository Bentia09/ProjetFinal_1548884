USE BD_Orchestre
GO



CREATE TABLE Orchestres.Orchestre(
OrchestreID  int IDENTITY(1,1),
NbEtudiant int   NOT NULL,
NbSection int  NOT NULL,
NoLocal varchar(20) NOT NULL,
ProfesseurID int NOT NULL,
CONSTRAINT PK_Orchestre_OrchestreID PRIMARY KEY (OrchestreID)
);

CREATE TABLE Orchestres.Instrument( 
InstrumentID int IDENTITY(1,1),
NomInstrument varchar(50) NOT NULL
CONSTRAINT PK_Instrument_InstrumentID PRIMARY KEY (InstrumentID)
);

CREATE TABLE Orchestres.InstrumentVent(
InstrumentVentID int IDENTITY (1,1),
TypeVent varchar(50)  NOT NULL ,
Materiaux varchar(50) NOT NULL ,
InstrumentID int NOT NULL
 CONSTRAINT PK_InstrumentVent_InstrumentVentID PRIMARY KEY (InstrumentVentID)

);


CREATE TABLE Orchestres.InstrumentCorde(
InstrumentCordeID  int IDENTITY (1,1),
TypeCorde varchar(50)  NOT NULL,
NbCorde int  NOT NULL,
InstrumentID int NOT NULL
CONSTRAINT PK_InstrumentCorde_InstrumentCordeID PRIMARY KEY (InstrumentCordeID)
);



CREATE TABLE Orchestres.Percussion(
PercussionID  int IDENTITY (1,1),
TypePercussion varchar(50)  NOT NULL,
MateriauxPercussion varchar(50)  NOT NULL, 
InstrumentID int NOT NULL
CONSTRAINT PK_Percussion_PercussionID PRIMARY KEY (PercussionID)
);

CREATE TABLE Etudiants.Etudiant(
EtudiantID int IDENTITY (1,1),
Nom varchar(50) NOT NULL,
Prenom varchar(50) NOT NULL,
NoEtudiant varchar(50)  NOT NULL ,
Niveau int  NOT NULL,
InstrumentID  int NOT NULL,
OrchestreID int NOT NULL,
CONSTRAINT PK_Etudiant_EtudiantID PRIMARY KEY (EtudiantID)
);

CREATE TABLE Professeurs.Professeur(
ProfesseurID int IDENTITY (1,1),
Nom varchar(50) NOT NULL,
Prenom varchar(50) NOT NULL,
NoEmploye varchar(50) UNIQUE NOT NULL ,
InstrumentID int NOT NULL,
CONSTRAINT PK_Professeur_ProfesseurID PRIMARY KEY (ProfesseurID)
);

CREATE TABLE Adresses.Adresse(
AdresseID int IDENTITY (1,1),
NoPorte varchar(10) NOT NULL,
Rue varchar(50) NOT NULL,
Ville varchar(50) NOT NULL, 
Province varchar(50) NOT NULL,
EtudiantID int NOT NULL,
ProfesseurID int NOT NULL,
CONSTRAINT PK_Adresse_AdresseID PRIMARY KEY ( AdresseID)
);

CREATE TABLE Orchestres.PieceMusique(
PieceMusiqueID int IDENTITY (1,1),
Titre varchar(50) NOT NULL,
Auteur varchar(50) NOT NULL,
Difficulte varchar(50) NOT NULL,
StyleMusique varchar(50) NOT NULL,
Tonalite varchar(50) NOT NULL,
Tempo varchar(50) NOT NULL,
ProfesseurID int  NOT NULL,
OrchestreID int NOT NULL
CONSTRAINT PK_Orchestres_PieceMusique_PieceMusiqueID PRIMARY KEY (PieceMusiqueID)
);
CREATE TABLE Orchestres.ChoixOrchestrePieceMusique(
ChoixOrchestrePieceMusiqueID int IDENTITY (1,1),
DateDuChoix DATE NOT NULL,
    OrchestreID int NOT NULL,
 PieceMusiqueID int NOT NULL,
CONSTRAINT PK_ChoixOrchestrePieceMusique_ChoixOrchestrePieceMusiqueID PRIMARY KEY (ChoixOrchestrePieceMusiqueID)
);


GO

--- Création de ma table Archive des étudiants qui ont gradué

CREATE TABLE Etudiants.ArchiveEtudiant(
ArchirveEtudiantID int IDENTITY (1,1),
Nom varchar(50) NOT NULL,
Prenom varchar(50) NOT NULL,
NoEtudiant varchar(50)  NOT NULL ,
Niveau int  NOT NULL,
InstrumentID  int NOT NULL,
OrchestreID int NOT NULL,
EtudiantID int NOT NULL,
Date  date NOT NULL,
CONSTRAINT PK_ArchiveEtudiant_ArhciveEtudiantID PRIMARY KEY ( ArchirveEtudiantID)
);
GO





-- Création des contraintes de clés étrangères


ALTER TABLE Orchestres.Orchestre ADD CONSTRAINT FK_Orchestre_ProfesseurID
FOREIGN KEY (ProfesseurID) REFERENCES  Professeurs.Professeur(ProfesseurID)
ON DELETE CASCADE 
ON UPDATE CASCADE
GO

ALTER TABLE Etudiants.Etudiant ADD CONSTRAINT FK_Etudiant_OrchestreID
FOREIGN KEY (OrchestreID) REFERENCES Orchestres.Orchestre(OrchestreID)
GO
ALTER TABLE Etudiants.Etudiant ADD CONSTRAINT FK_Etudiant_InstrumentID
FOREIGN KEY (InstrumentID) REFERENCES Orchestres.Instrument(InstrumentID)
GO
ALTER TABLE Professeurs.Professeur ADD CONSTRAINT FK_Professeur_InstruemntID
FOREIGN KEY (InstrumentID) REFERENCES Orchestres.Instrument(InstrumentID)
GO

ALTER TABLE Orchestres.InstrumentCorde ADD CONSTRAINT FK_InstrumentCorde_InstrumentID
FOREIGN KEY (InstrumentID) REFERENCES Orchestres.Instrument(InstrumentID)
GO

ALTER TABLE Orchestres.InstrumentVent ADD CONSTRAINT FK_InstrumentVent_InstrumentID
FOREIGN KEY (InstrumentID) REFERENCES Orchestres.Instrument(InstrumentID)

ALTER TABLE Orchestres.Percussion ADD CONSTRAINT FK_Percussion_InstrumentID
FOREIGN KEY (InstrumentID) REFERENCES Orchestres.Instrument(InstrumentID)
GO

ALTER TABLE Adresses.Adresse ADD CONSTRAINT FK_Adresse_ProfesseurID
FOREIGN KEY (ProfesseurId) REFERENCES Professeurs.Professeur(ProfesseurID)
ON DELETE CASCADE 
ON UPDATE CASCADE
GO
ALTER TABLE Adresses.Adresse ADD CONSTRAINT FK_Adresse_EtudiantID
FOREIGN KEY (EtudiantID) REFERENCES Etudiants.Etudiant(EtudiantID)
ON DELETE CASCADE 
ON UPDATE CASCADE
GO

ALTER TABLE Orchestres.ChoixOrchestrePieceMusique
ADD CONSTRAINT FK_ChoixOrchestrePieceMusique_OrchestreID
FOREIGN KEY (OrchestreID) REFERENCES Orchestres.Orchestre(OrchestreID)
ON DELETE CASCADE 
ON UPDATE CASCADE
GO

ALTER TABLE Orchestres.ChoixOrchestrePieceMusique
ADD CONSTRAINT FK_ChoixOrchestrePieceMusique_PieceMusiqueID
FOREIGN KEY (PieceMusiqueID) REFERENCES Orchestres.PieceMusique(PieceMusiqueID)
ON DELETE CASCADE 
ON UPDATE CASCADE
GO



-- Création des contraintes autres que celles de clés primaires et étrangères

ALTER TABLE Orchestres.Orchestre ADD CONSTRAINT CK_Orchestre_NbSection CHECK (NbSection >= 1 AND NbSection <= 4)
GO
ALTER TABLE Orchestres.Orchestre ADD CONSTRAINT CK_Orchestre_NbEleve CHECK (NbEtudiant >= 10 AND NbEtudiant <= 40)
GO

ALTER TABLE Orchestres.InstrumentVent ADD CONSTRAINT CK_InstrumentVent_TypeVent CHECK (TypeVent IN ('Flûte Traversière', 'Saxophone alto', 'Trompette', 'Clarinette', 'Trombone', 'Tuba', 'Saxophone baryton'))
GO
ALTER TABLE Orchestres.InstrumentCorde ADD CONSTRAINT CK_InstrumentCorde_TypeCorde CHECK (TypeCorde IN ('Violon', 'Alto', 'Violoncelle', 'Contrebasse', 'Basse électronique', 'Harpe'))
GO
ALTER TABLE Orchestres.Percussion ADD CONSTRAINT CK_Percussion_TypePercussion CHECK (TypePercussion IN ('Tambour', 'Batterie',  'Triangle', 'Grosse caisse', 'Cymbales'))
GO

ALTER TABLE Etudiants.Etudiant ADD CONSTRAINT UQ_Etudiant_NoEtudiant UNIQUE (NoEtudiant)
GO

ALTER TABLE Professeurs.Professeur ADD CONSTRAINT UQ_Professeur_NoEmploye UNIQUE (NoEmploye)
GO

ALTER TABLE Adresses.Adresse ADD CONSTRAINT UQ_Adresse_NoPorte UNIQUE (NoPorte)
GO

ALTER TABLE Orchestres.PieceMusique ADD CONSTRAINT CK_PieceMusique_Difficulte CHECK (Difficulte IN ('Facile', 'Moyen', 'Difficile', 'Très difficile'))
GO
ALTER TABLE Orchestres.PieceMusique ADD CONSTRAINT CK_PieceMusique_StyleMusique CHECK (StyleMusique IN ('Classique', 'Jazz', 'Gospel'))
GO
ALTER TABLE Orchestres.PieceMusique ADD CONSTRAINT CK_PieceMusique_Tonalite CHECK (Tonalite IN ('Do', 'Ré', 'Mi', 'Fa', 'Sol', 'La', 'Si', 'Do#', 'Ré#', 'Mi#', 'Fa#', 'Sol#', 'La#', 'Si#'))
GO
ALTER TABLE Orchestres.PieceMusique ADD CONSTRAINT CK_PieceMusique_Tempo CHECK (Tempo IN ('Largo', 'Adagio', 'Andante', 'Moderato', 'Allegro', 'Vivace', 'Presto'))
GO

