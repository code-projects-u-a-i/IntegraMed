using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class IdiomaDAL
    {
        public static Dictionary<string, string> ObtenerTraducciones(int idiomaId)
        {
            DAO dao = new DAO();
            // La clave es un string, la consulta no requiere JOINs
            string sql = @"SELECT Traduccion_EtiquetaClave, Traduccion_Texto 
                           FROM Traduccion 
                           WHERE Traduccion_IdiomaId = @Id";

            var dic = new Dictionary<string, string>();

           
            var ds = dao.ExecuteDataSet(sql, new SqlParameter("@Id", idiomaId));

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string clave = dr["Traduccion_EtiquetaClave"].ToString();
                string texto = dr["Traduccion_Texto"].ToString();

                dic[clave] = texto;
            }

            return dic;
        }

       
        public static List<Idioma> ListarIdiomas()
        {
            DAO dao = new DAO();
            string sql = "SELECT Idioma_Id, Idioma_Nombre FROM Idioma";
            var ds = dao.ExecuteDataSet(sql);

            var lista = new List<Idioma>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                lista.Add(new Idioma
                {
                    Id = Convert.ToInt32(dr["Idioma_Id"]),
                    Nombre = dr["Idioma_Nombre"].ToString()
                });
            }
            return lista;
        }

       
        public static int InsertarIdioma(string nombre)
        {
            DAO dao = new DAO();
            string sql = @"INSERT INTO Idioma (Idioma_Nombre) VALUES (@Nombre);
                           SELECT SCOPE_IDENTITY();";

            object result = dao.ExecuteScalarFunction(sql, new SqlParameter("@Nombre", nombre));

            return Convert.ToInt32(result);
        }

         
        // Elimina un idioma.  'ON DELETE CASCADE' , 
        // al borrar el idioma se borran sus traducciones en la bd.
        public static void EliminarIdioma(int id)
        {
            DAO dao = new DAO();
            string sql = "DELETE FROM Idioma WHERE Idioma_Id = @Id";
            dao.ExecuteNonQueryFuntion(sql, new SqlParameter("@Id", id));
        }
    }
}