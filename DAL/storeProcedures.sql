
IF OBJECT_ID('sp_DVV_Operaciones', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_DVV_Operaciones;
GO

CREATE PROCEDURE sp_DVV_Operaciones
    @Accion VARCHAR(20),       -- 'SELECT' o 'UPDATE'
    @NombreTabla VARCHAR(100),
    @Suma VARCHAR(255) = NULL  -- Parámetro opcional (por defecto NULL)
AS
BEGIN
    SET NOCOUNT ON;

    -- ==========================================
    -- ACCIÓN: SELECCIONAR EL DVV DE UNA TABLA
    -- ==========================================
    IF @Accion = 'SELECT'
    BEGIN
        SELECT TOP 1 
            ID, 
            Nombre_tabla, 
            Suma
        FROM DVV 
        WHERE Nombre_tabla = @NombreTabla;
    END

    -- ==========================================
    -- ACCIÓN: ACTUALIZAR LA SUMA DEL DVV
    -- ==========================================
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        -- Verificación básica de seguridad
        IF @Suma IS NULL
        BEGIN
            RAISERROR('El parámetro @Suma no puede ser NULL al realizar una actualización.', 16, 1);
            RETURN;
        END

        UPDATE DVV 
        SET Suma = @Suma 
        WHERE Nombre_tabla = @NombreTabla;

        -- Retorna la cantidad de filas afectadas para la capa de datos en C#
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END
    
    -- ACCIÓN NO RECONOCIDA
    ELSE
    BEGIN
        RAISERROR('Acción no válida. Utilice ''SELECT'' o ''UPDATE''.', 16, 1);
    END
END;
GO