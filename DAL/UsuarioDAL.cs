using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_AccesoDatos
{
    public class UsuarioDAL
    {
        public static Usuario ObtenerPorNombre(string username)  //Obtenemos el nombre.
        {
            Usuario usuario = new Usuario();
            usuario.Id = 1;
            usuario.Username = username;
            usuario.Password = "rr";
            usuario.IntentosFallidos = 2;
            usuario.Bloqueado = true;
            return usuario;
          /*  var dao = new DAO();

            string sql = $@"
            SELECT 
                Usuario_ID,
                Usuario_Username,
                Usuario_Password,
                Usuario_IntentosFallidos,
                Usuario_Bloqueado
            FROM Usuario
            WHERE Usuario_Username = N'{Esc(username)}';
            ";

            DataSet ds = dao.ExecuteDataSet(sql);

            if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                return null;

            DataRow dr = ds.Tables[0].Rows[0];

            return MapUsuario(dr);
          */
        }
    }
}
