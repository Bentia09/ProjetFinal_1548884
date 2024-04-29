USE BD_Orchestre
GO




-- Créer une clé symétrique
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'CeciEst1GrosMotDePasse!'
GO
CREATE CERTIFICATE Monvertificat WITH SUBJECT = 'ChiffrementNoEmploye'
GO

CREATE SYMMETRIC KEY MaSuperCle WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE MonCertificat;
GO

---- On définit une procédure pour Chiffre NoEmploye

CREATE PROCEDURE Professeurs.USP_ChiffrementNoEmploye
    @Nom varchar(50),
    @Prenom varchar(50),
    @NoEmploye nvarchar(50)
   
AS 
BEGIN 
    DECLARE @InstrumentID int

    Select @InstrumentID = InstrumentID From Orchestres.Instruments

    -- Chiffrement du NoEmploye
    OPEN SYMMETRIC KEY MaSuperCle
    ENCRYPTION BY CERTIFICATE MonCertificat
    
    DECLARE @NoEmployeChiffre varbinary(50) = EncryptByKey(KEY_GUID('MaSuperCle'), @NoEmploye);

    CLOSE SYMMETRIC KEY MaSuperCle;

    INSERT INTO Professeurs.Professeur( Nom ,Prenom ,NoEmploye ,InstrumentID )
    
    VALUES (@Nom, @Prenom, @NoEmployeChiffre,@InstrumentID);
END;
GO
--On définit une procédure pour récupérer les NoEmploye
CREATE PROCEDURE Professeurs.USP_RecuperationNoEmploye
AS
BEGIN
 DECLARE @NoEmploye nvarchar(50);
 
 OPEN SYMMETRIC KEY MaSuperCle DECRYPTION BY CERTIFICATE MonCertificat

SELECT @NoEmploye = CONVERT(nvarchar(50), DecryptByKey(NoEmploye))
    FROM Professeurs.Professeur;

     CLOSE SYMMETRIC KEY MaSuperCle;

     SELECT @NoEmploye AS NoEmploye;

     END
     GO
