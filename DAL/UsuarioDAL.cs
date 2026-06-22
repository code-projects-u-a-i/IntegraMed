using System;
using System.Data;
using System.Data.SqlClient;
using BE;

namespace DAL
{
    public class UsuarioDAL
    {

        public static int InsertarUsuario(Usuario nuevoUsuario)
        {
            var dao = new DAO();


            string userEsc = dao.Esc(nuevoUsuario.Username);
            string passEsc = dao.Esc(nuevoUsuario.Password);

            // Seteamos explícitamente IntentosFallidos en 0 y Bloqueado en 0 para el alta
            string sqlInsert = $@"
            INSERT INTO Usuario (
                Usuario_Username,
                Usuario_Password,
                Usuario_IntentosFallidos,
                Usuario_Bloqueado
            )
            VALUES (
                N'{userEsc}',
                '{passEsc}',
                0,
                0
            );
            SELECT SCOPE_IDENTITY();";


            object resultado = dao.ExecuteScalarFunction(sqlInsert);

            if (resultado != null && resultado != DBNull.Value)
            {
                return Convert.ToInt32(resultado);
            }

            return 0; 
        }

        public static Usuario ObtenerPorId(int id)
        {
            var dao = new DAO();

            string sql = $@"
            SELECT Usuario_ID, Usuario_Username, Usuario_Password, Usuario_IntentosFallidos, Usuario_Bloqueado
            FROM Usuario
            WHERE Usuario_ID = {id};";

            DataSet ds = dao.ExecuteDataSet(sql);

            if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                return null;

            return MapUsuario(ds.Tables[0].Rows[0]);
        }

        public static Usuario ObtenerPorNombre(string username)
        {
            var dao = new DAO();

            string sql = $@"
            SELECT Usuario_ID, Usuario_Username, Usuario_Password, Usuario_IntentosFallidos, Usuario_Bloqueado
            FROM Usuario
            WHERE Usuario_Username = N'{dao.Esc(username)}';";

            DataSet ds = dao.ExecuteDataSet(sql);

            if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                return null;

            return MapUsuario(ds.Tables[0].Rows[0]);
        }

        public static void ActualizarPorId(Usuario usuario)
        {
            var dao = new DAO();

            string sqlUpdate = $@"
            UPDATE Usuario SET
                Usuario_Username = N'{dao.Esc(usuario.Username)}',
                Usuario_Password = N'{dao.Esc(usuario.Password)}',
                Usuario_IntentosFallidos = {usuario.IntentosFallidos},
                Usuario_Bloqueado = {dao.BoolToBit(usuario.Bloqueado)}
            WHERE Usuario_ID = {usuario.Id};";

            dao.ExecuteNonQueryFuntion(sqlUpdate);
        }

        public static int Eliminar(Usuario usuario)  // Elimina el usuario.
        {
            var dao = new DAO();

            string sqlDeleteRelacion = @"
        DELETE FROM Usuario_Perfil 
        WHERE Usuario_ID = @IdUsuario;";

            SqlParameter[] p1 = {
            new SqlParameter("@IdUsuario", usuario.Id)
            };

            dao.ExecuteNonQueryFuntion(sqlDeleteRelacion, p1); // primero la tabla intermedia

            string sqlDeleteUsuario = @"
        DELETE FROM Usuario 
        WHERE Usuario_ID = @IdUsuario;";

            SqlParameter[] p2 = {
        new SqlParameter("@IdUsuario", usuario.Id)
        };

            int filas = dao.ExecuteNonQueryFuntion(sqlDeleteUsuario, p2);

            return filas;
        }


        private static Usuario MapUsuario(DataRow dr)
        {
            return new Usuario
            {
                Id = Convert.ToInt32(dr["Usuario_ID"]),
                Username = dr["Usuario_Username"] != DBNull.Value ? dr["Usuario_Username"].ToString() : string.Empty,
                Password = dr["Usuario_Password"] != DBNull.Value ? dr["Usuario_Password"].ToString() : string.Empty,
                IntentosFallidos = dr["Usuario_IntentosFallidos"] != DBNull.Value ? Convert.ToInt32(dr["Usuario_IntentosFallidos"]) : 0,
                Bloqueado = dr["Usuario_Bloqueado"] != DBNull.Value && Convert.ToBoolean(dr["Usuario_Bloqueado"])
            };
        }

    }
}
