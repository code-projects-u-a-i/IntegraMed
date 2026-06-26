using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PerfilDAL
    {

        public static Perfil Obtener(int perfilId)  
        {
            DAO dao = new DAO();

            var ds = dao.ExecuteDataSet(
                "SELECT TOP 1 * FROM Perfil WHERE Perfil_ID = @ID",
                new SqlParameter("@ID", perfilId)
            );

            if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                return null;

            return MapPerfil(ds.Tables[0].Rows[0]);
        }

        public static int CrearPerfil(string nombre, string tag, string tipo)  
        {
            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(tag))
                return 0;

            DAO dao = new DAO();

            const string sqlInsert = @"
            INSERT INTO Perfil (Perfil_Nombre, Perfil_Tag ,Perfil_Tipo)
            VALUES (@N,@TAG,@T);

            SELECT SCOPE_IDENTITY() AS Id;";

            var ds = dao.ExecuteDataSet(sqlInsert,
                new SqlParameter("@N", nombre),
                new SqlParameter("@TAG", tag),
                new SqlParameter("@T", tipo)
            );

            if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                return 0;

            return Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);
        }

        public static List<Perfil> Listar()
        {
            DAO dao = new DAO();
            var ds = dao.ExecuteDataSet("SELECT * FROM Perfil");

            var list = new List<Perfil>();
            if (ds.Tables.Count == 0) return list;

            foreach (DataRow r in ds.Tables[0].Rows)
                list.Add(MapPerfil(r));

            return list;
        }

        public static List<Perfil> ObtenerTodasFamilias() 
        {
            DAO dao = new DAO();
            var ds = dao.ExecuteDataSet("SELECT * FROM Perfil WHERE Perfil_Tipo LIKE '%Familia%'");

            var list = new List<Perfil>();
            if (ds.Tables.Count == 0) return list;

            foreach (DataRow r in ds.Tables[0].Rows)
                list.Add(MapPerfil(r));

            return list;
        }

        public static List<Perfil> ObtenerTodasPatentes()  
        {
            DAO dao = new DAO();
            var ds = dao.ExecuteDataSet("SELECT * FROM Perfil WHERE Perfil_Tipo LIKE '%Patente%'");

            var list = new List<Perfil>();
            if (ds.Tables.Count == 0) return list;

            foreach (DataRow r in ds.Tables[0].Rows)
                list.Add(MapPerfil(r));

            return list;
        }

        public static List<Perfil> ObtenerRaicesDeUsuario(int usuarioId)  // Obtiene todos los perfiles asignados a un usuario.
        {
            DAO dao = new DAO();

            string sql = @"
            SELECT p.*
            FROM Usuario_Perfil up
            JOIN Perfil p ON p.Perfil_ID = up.Perfil_ID
            WHERE up.Usuario_ID = @U;";

            var ds = dao.ExecuteDataSet(sql, new SqlParameter("@U", usuarioId));

            var list = new List<Perfil>();
            if (ds.Tables.Count == 0) return list;

            foreach (DataRow r in ds.Tables[0].Rows)
                list.Add(MapPerfil(r));

            return list;
        }

        public static void AsignarComponenteAUsuario(int usuarioId, int perfilId)  //Asigna un perfil (patente/familia) a un usuario si no estaba asignado.
        {
            DAO dao = new DAO();

            string sql = @"
IF NOT EXISTS (SELECT 1 FROM Usuario_Perfil WHERE Usuario_ID=@U AND Perfil_ID=@P)
    INSERT INTO Usuario_Perfil (Usuario_ID, Perfil_ID)
    VALUES (@U, @P);";

            dao.ExecuteNonQueryFuntion(sql,
                new SqlParameter("@U", usuarioId),
                new SqlParameter("@P", perfilId)
            );
        }

        public static void QuitarComponenteDeUsuario(int usuarioId, int perfilId)  //Elimina una asignación entre usuario y perfilId.
        {
            DAO dao = new DAO();
            dao.ExecuteNonQueryFuntion(
                "DELETE FROM Usuario_Perfil WHERE Usuario_ID=@U AND Perfil_ID=@P",
                new SqlParameter("@U", usuarioId),
                new SqlParameter("@P", perfilId)
            );
        }

        public static void AgregarHijoAFamilia(int idFamilia, int idHijo)  //Asocia un hijo (perfil) a una familia si no estaba asociado.
        {
            DAO dao = new DAO();

            string sql = @"
            IF NOT EXISTS (SELECT 1 FROM Familia_Hijo WHERE Familia_ID=@F AND Hijo_ID=@H)
            INSERT INTO Familia_Hijo (Familia_ID, Hijo_ID) VALUES (@F, @H);";

            dao.ExecuteNonQueryFuntion(sql,
                new SqlParameter("@F", idFamilia),
                new SqlParameter("@H", idHijo)
            );
        }

        public static void QuitarHijoDeFamilia(int idFamilia, int idHijo)  //Elimina la relación hijo → familia.
        {
            DAO dao = new DAO();
            dao.ExecuteNonQueryFuntion(
                "DELETE FROM Familia_Hijo WHERE Familia_ID=@F AND Hijo_ID=@H",
                new SqlParameter("@F", idFamilia),
                new SqlParameter("@H", idHijo)
            );
        }
        // no se esta haciendo por nombre, podria borrarse
        public static int ObtenerIdFamiliaPorNombre(string nombre)  //Busca el ID de una familia por su nombre.
        {
            if (string.IsNullOrWhiteSpace(nombre))
                return 0;

            DAO dao = new DAO();

            string sql = @"
            SELECT TOP 1 Perfil_ID
            FROM Perfil
            WHERE RTRIM(LTRIM(Nombre)) = @N
            AND Tipo = 'Familia';";

            var ds = dao.ExecuteDataSet(sql, new SqlParameter("@N", nombre));

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                return Convert.ToInt32(ds.Tables[0].Rows[0]["Perfil_ID"]);

            return 0;
        }

        public static List<Perfil> ObtenerHijosDeFamilia(int idFamilia)  //Obtiene todos los perfiles hijos de una familia.
        {
            DAO dao = new DAO();

            string sql = @"
            SELECT c.*
            FROM Familia_Hijo fh
            JOIN Perfil c ON c.Perfil_ID = fh.Hijo_ID
            WHERE fh.Familia_ID = @F;";

            var ds = dao.ExecuteDataSet(sql, new SqlParameter("@F", idFamilia));

            var list = new List<Perfil>();
            if (ds.Tables.Count == 0) return list;

            foreach (DataRow r in ds.Tables[0].Rows)
                list.Add(MapPerfil(r));

            return list;
        }

        public static List<Perfil> ObtenerFamiliasRaiz()
        {
            DAO dao = new DAO();

            // perfiles tipo Familia cuyo ID NO exista en la columna Hijo_ID de la tabla intermedia
            string sql = @"
            SELECT * FROM Perfil 
            WHERE Perfil_Tipo = 'Familia' 
            AND Perfil_ID NOT IN (SELECT DISTINCT Hijo_ID FROM Familia_Hijo);";

            var ds = dao.ExecuteDataSet(sql);

            var list = new List<Perfil>();
            if (ds.Tables.Count == 0) return list;

            foreach (DataRow r in ds.Tables[0].Rows)
                list.Add(MapPerfil(r));

            return list;
        }

        private static Perfil MapPerfil(DataRow row)  
        {
            int id = Convert.ToInt32(row["Perfil_ID"]);
            string nombre = row["Perfil_Nombre"].ToString();
            string tag = row["Perfil_Tag"].ToString();
            string tipo = row["Perfil_Tipo"].ToString().Trim();

            Perfil perfil;

            if (tipo.Equals("Patente", StringComparison.OrdinalIgnoreCase))
                perfil = new Patente();
            else if (tipo.Equals("Familia", StringComparison.OrdinalIgnoreCase))
                perfil = new Familia();
            else
                throw new InvalidOperationException($"Tipo desconocido: {tipo}");

            perfil.Id = id;
            perfil.Nombre = nombre;
            perfil.Tag = tag;

            return perfil;
        }

        public static string EliminarPerfil(int id)
        {
            DAO dao = new DAO();

            // tiene_hijos, es_hijo, tiene_usuarios son las posibilidades de que no pueda ser borrado
            string sqlVerificar = @"
        IF EXISTS (SELECT 1 FROM Familia_Hijo WHERE Familia_ID = @ID)
            SELECT 'TIENE_HIJOS' AS Estado;
        ELSE IF EXISTS (SELECT 1 FROM Familia_Hijo WHERE Hijo_ID = @ID)
            SELECT 'ES_HIJO' AS Estado;
        ELSE IF EXISTS (SELECT 1 FROM Usuario_Perfil WHERE Perfil_ID = @ID)
            SELECT 'TIENE_USUARIOS' AS Estado;
        ELSE
            SELECT 'LIBRE' AS Estado;";

            var ds = dao.ExecuteDataSet(sqlVerificar, new SqlParameter("@ID", id));
            string estado = ds.Tables[0].Rows[0]["Estado"].ToString();
            // si el perfil esta libre entonces no se rompe ninguna integridad referencial
            if (estado == "LIBRE")
            {
                string sqlDelete = "DELETE FROM Perfil WHERE Perfil_ID = @ID;";
                dao.ExecuteNonQueryFuntion(sqlDelete, new SqlParameter("@ID", id));
                return estado;
            }

            return estado;
        }

        public static void EditarPerfil(int id, string nombre)
        {
            var dao = new DAO();
            // a tag no lo toco
            string sql = @"UPDATE Perfil 
                   SET Perfil_Nombre = @N 
                   WHERE Perfil_ID = @Id;";

            dao.ExecuteNonQueryFuntion(sql,
                new SqlParameter("@N", nombre),
                new SqlParameter("@Id", id)
            );
        }
        public static List<Perfil> ListarPerfilesDisponiblesParaAsignar(int usuarioId)
        {
            DAO dao = new DAO();

            // la consulta crea una tabla virtual, donde primero selecciona los perfiles raiz que tiene el usuario y despues lee la tabla Familia_Hijo para buscar de forma recursiva hacia abajo (desde hijo_id)
            string sql = @"
        WITH PermisosDelUsuario AS (
            SELECT Perfil_ID FROM Usuario_Perfil WHERE Usuario_ID = @UsuarioID
            UNION ALL
            SELECT fh.Hijo_ID
            FROM Familia_Hijo fh
            JOIN PermisosDelUsuario pu ON fh.Familia_ID = pu.Perfil_ID
        )
        SELECT DISTINCT p.Perfil_ID, p.Perfil_Nombre, p.Perfil_Tag, p.Perfil_Tipo
        FROM Perfil p
        WHERE p.Perfil_ID NOT IN (SELECT Perfil_ID FROM PermisosDelUsuario);";
            // al final la consulta lista los perfiles que no existan en la tabla virtual permisosDelUsuario
            var ds = dao.ExecuteDataSet(sql, new SqlParameter("@UsuarioID", usuarioId));
            List<Perfil> listaFiltrada = new List<Perfil>();

            if (ds.Tables.Count == 0) return listaFiltrada;

            foreach (DataRow r in ds.Tables[0].Rows)
            {
                listaFiltrada.Add(MapPerfil(r));
            }

            return listaFiltrada;
        }

    }
}
