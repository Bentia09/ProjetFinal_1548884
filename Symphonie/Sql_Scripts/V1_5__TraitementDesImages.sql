USE BD_Orchestre
GO

ALTER TABLE Orchestres.Instrument ADD
Identifiant uniqueidentifier NOT NULL ROWGUIDCOL DEFAULT newid();
GO
ALTER TABLE Orchestres.Instrument ADD CONSTRAINT UC_Instrument_Identifiant
UNIQUE (Identifiant);
GO
ALTER TABLE Orchestres.Instrument ADD 
Photo varbinary(max) FILESTREAM NULL;
GO



--INSERER DES IMAGES


INSERT INTO Orchestres.Instrument (NomInstrument, Photo)
SELECT 'Violon', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Violon.png', SINGLE_BLOB) AS myFile
UNION ALL
SELECT ' Flûte Traversière', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Flute_Traversiere.png', SINGLE_BLOB) AS myFile
UNION ALL
SELECT 'Piano', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Piano.png', SINGLE_BLOB) AS myFile
UNION ALL
SELECT 'Trompette', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Trompette.png', SINGLE_BLOB) AS myFile
UNION ALL
SELECT 'Clarinette', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Clarinette.png', SINGLE_BLOB) AS myFile
UNION ALL
SELECT 'Saxophone alto', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Saxo_alto.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Guitard', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Guitard.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Trombone', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Trombone.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Harpe', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Harpe.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Violoncelle', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Violoncelle.png', SINGLE_BLOB) AS myFile
UNION ALL 


SELECT 'Batterie', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Batterie.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Saxophone baryton', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Saxophonne_Baryton.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Basse électrique', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Basse.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Triangle', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Triangle.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Tuba', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Tuba.png', SINGLE_BLOB) AS myFile
UNION ALL 
SELECT 'Contrebasse', BulkColumn FROM OPENROWSET(BULK 'C:\Users\fry_c\Downloads\ProjetFinal_1548884\Symphonie\ImagesTest\Contrebasse.png' , SINGLE_BLOB)AS myFile


