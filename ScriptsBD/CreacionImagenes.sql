/*
	Autor		: Nicolas Jaiquel Rubio
	Fecha		: 2025-02-13
	Descripcion	: Creacion de tablas
	DROP TABLE Imagen;
	DROP TABLE TipoImagen;
*/
USE HeonImagenes;

CREATE TABLE TipoImagen(
	IdTipoImagen INT IDENTITY PRIMARY KEY,
	NombreTipoImagen VARCHAR(MAX) NOT NULL,
	FechaCreacion DATETIME,
	FechaActualizacion DATETIME
);
ALTER TABLE TipoImagen ADD CONSTRAINT [DF_TipoImagen_FechaCreacion] DEFAULT GETDATE() FOR FechaCreacion;

INSERT INTO TipoImagen(NombreTipoImagen) SELECT 'Paisajes';
INSERT INTO TipoImagen(NombreTipoImagen) SELECT 'Comida';

CREATE TABLE Imagen(
	IdImagen INT IDENTITY PRIMARY KEY,
	IdTipoImagen INT NOT NULL,
	ImagenSerializada VARCHAR(500) NOT NULL,
	FechaCreacion DATETIME,
	FechaActualizacion DATETIME,
);
ALTER TABLE Imagen ADD CONSTRAINT [DF_Imagen_FechaCreacion] DEFAULT GETDATE() FOR FechaCreacion;
ALTER TABLE Imagen ADD CONSTRAINT [FK_Imagen_TipoImagen] FOREIGN KEY (IdTipoImagen) REFERENCES TipoImagen(IdTipoImagen);

INSERT INTO Imagen(IdTipoImagen, ImagenSerializada) SELECT 1, 'ASJDAKSD';