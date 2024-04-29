USE BD_Orchestre
GO

CREATE VIEW Etudiants.vw_EtudiantParInstrument 

AS

SELECT 
 E.EtudiantID,E.NoEtudiant, E.Prenom , E.Nom , I.InstrumentID , I.NomInstrument 

FROM Etudiants.Etudiant E
INNER JOIN Orchestres.Instrument I
ON E.InstrumentID = I.InstrumentID
