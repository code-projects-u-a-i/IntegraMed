using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UsuarioDAL
    {
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

            // Reutilizamos el mismo método de mapeo
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
