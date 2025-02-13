/*
	Autor		: Nicolas Jaiquel Rubio
	Fecha		: 2025-02-13
	Descripcion	: Crea o actualiza imagenes	
*/

CREATE OR ALTER PROCEDURE SpSaveImagenes(
	@IdImagen INT= 0,
	@IdTipoImagen INT,
	@ImagenSerializada VARCHAR(500)
)AS
BEGIN
	IF(@IdImagen = 0)
	BEGIN
		INSERT INTO Imagen(IdTipoImagen, ImagenSerializada) SELECT @IdTipoImagen, @ImagenSerializada;
		SET @IdImagen = SCOPE_IDENTITY();
	END
	ELSE
	BEGIN
		UPDATE Imagen
		SET IdTipoImagen = @IdTipoImagen,
		ImagenSerializada = @ImagenSerializada,
		FechaActualizacion = GETDATE()
		WHERE IdImagen = @IdImagen;
	END
	EXEC SpGetImagenes @IdImagen;

END

EXEC SpSaveImagenes @IdImagen = 0, @IdTipoImagen = 1, @ImagenSerializada = 'asdasdad';
