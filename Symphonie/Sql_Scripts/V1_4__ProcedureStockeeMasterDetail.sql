USE BD_Orchestre
GO


CREATE PROCEDURE Etudiants.USP_EtudiantParSonInstrument
    @NomInstrument varchar(50)
AS
BEGIN
    SELECT E.EtudiantID, E.Nom, E.Prenom, E.NoEtudiant, E.Niveau, E.InstrumentID, E.OrchestreID
    FROM Etudiants.Etudiant E
    INNER JOIN Orchestres.Instrument I 
    ON E.InstrumentID = I.InstrumentID
    WHERE I.NomInstrument = @NomInstrument;
END
GO
