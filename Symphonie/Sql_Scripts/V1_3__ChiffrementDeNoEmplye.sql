USE BD_Orchestre
GO
ALTER TABLE Professeurs.Professeur 
 DROP CONSTRAINT UC_Professeur_NoEmploye
 GO
ALTER TABLE Professeurs.Professeur
ADD NoEmployeChiffre varbinary(max) 
GO

-- Créer une clé symétrique
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'CeciEst1GrosMotDePasse!'
GO
CREATE CERTIFICATE Moncertificat WITH SUBJECT = 'ChiffrementNoEmploye'
GO

CREATE SYMMETRIC KEY MaSuperCle WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE MonCertificat;
GO
--- Chiffrement de la colone NoEmploye
OPEN SYMMETRIC KEY MaSuperCle DECRYPTION BY CERTIFICATE MonCertificat;
UPDATE Professeurs.Professeur
SET NoEmployeChiffre =  EncryptByKey(KEY_GUID('MaSuperCle'), NoEmploye);
 CLOSE SYMMETRIC KEY MaSuperCle;
 GO
 
 

ALTER TABLE Professeurs.Professeur 
DROP COLUMN NoEmploye
GO

CREATE TABLE Professeurs.NoEmplye(
NoEmployeClaire varchar(50) NOT NULL
)
GO 






---- On définit une procédure pour Chiffre NoEmploye

CREATE PROCEDURE Professeurs.USP_ChiffrementNoEmploye
    @Nom varchar(50),
    @Prenom varchar(50),
    @NoEmploye varchar(50),
    @InstrumentID int
   
AS 
BEGIN 
   

    -- Chiffrement du NoEmploye
    OPEN SYMMETRIC KEY MaSuperCle DECRYPTION BY CERTIFICATE MonCertificat;
    
    DECLARE @NoEmployeChiffre varbinary(max) = EncryptByKey(KEY_GUID('MaSuperCle'), @NoEmploye);

    CLOSE SYMMETRIC KEY MaSuperCle;

    INSERT INTO Professeurs.Professeur( Nom ,Prenom ,NoEmployeChiffre ,InstrumentID )
    
    VALUES (@Nom, @Prenom, @NoEmployeChiffre,@InstrumentID);
END
GO
--On définit une procédure pour récupérer les NoEmploye




CREATE PROCEDURE Professeurs.USP_RecuperationNoEmploye
(@ProfesseurID int)
AS
BEGIN
 
    OPEN SYMMETRIC KEY MaSuperCle DECRYPTION BY CERTIFICATE MonCertificat

    SELECT CONVERT(nvarchar(50),DECRYPTBYKEY(NoEmployeChiffre)) AS NoEmployeClaire
    FROM Professeurs.Professeur 
    WHERE ProfesseurID=@ProfesseurID

     CLOSE SYMMETRIC KEY MaSuperCle
    

END
GO
  -- Insertions de quelques Professeur 
    -- EXEC Professeurs.USP_ChiffrementNoEmploye  @Nom='Dalegrand' ,@Prenom ='Bentia' ,@NoEmployeChiffre= 'BD12345',@InstrumentID=1; 
     --EXEC Professeurs.USP_ChiffrementNoEmploye @Nom = 'Garcia', @Prenom = 'Maria', @NoEmployeChiffre = 'MG78901',@InstrumentID=2; 
     --EXEC Professeurs.USP_ChiffrementNoEmploye @Nom = 'Lee', @Prenom = 'David', @NoEmployeChiffre = 'DL12345',@InstrumentID=3; 
     --EXEC Professeurs.USP_ChiffrementNoEmploye @Nom = 'Patel', @Prenom = 'Priya', @NoEmployeChiffre = 'PP45678',@InstrumentID=4;