/*
	Autor		: Nicolas Jaiquel Rubio
	Fecha		: 2025-02-13
	Descripcion	: Lista Imagenes o imagen en su defecto		
*/

CREATE OR ALTER PROCEDURE SpGetImagenes(
	@IdImagen INT = NULL
)
AS
BEGIN
	SELECT i.*, ti.NombreTipoImagen FROM Imagen i
	INNER JOIN TipoImagen ti ON ti.IdTipoImagen = i.IdTipoImagen
	WHERE (@IdImagen IS NULL OR i.IdImagen = @IdImagen);
END

EXEC SpGetImagenes 1