USE master 
GO

-- CREATION ou RECREATION de la BD


IF EXISTS(SELECT * FROM sys.databases WHERE name='BD_Orchestre')
BEGIN
    DROP DATABASE BD_Orchestre
END
CREATE DATABASE BD_Orchestre



-- Configuration de FILESTREAM
EXEC sp_configure filestream_access_level, 2 RECONFIGURE

ALTER DATABASE BD_Orchestre
ADD FILEGROUP FG_Images1548884 CONTAINS FILESTREAM;
GO

ALTER DATABASE BD_Orchestre
ADD FILE (
    NAME = FG_Images1548884,
    FILENAME = 'C:\EspaceLabo\BD_Images'
)
TO FILEGROUP FG_Images1548884
GO

