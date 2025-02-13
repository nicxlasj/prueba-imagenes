/*
	Autor		: Nicolas Jaiquel Rubio
	Fecha		: 2025-02-13
	Descripcion	: Elimina imagenes	
*/

CREATE OR ALTER PROCEDURE SpDeleteImagen(
	@IdImagen INT
)AS
BEGIN
	DELETE Imagen WHERE IdImagen = @IdImagen;
END