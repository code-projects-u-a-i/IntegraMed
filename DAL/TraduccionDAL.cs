using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class TraduccionDAL
    {
        public static void InsertarTraduccion(Traduccion nuevaTraduccion)
        {
            var dao = new DAO();

            string etiquetaEsc = dao.Esc(nuevaTraduccion.Etiqueta);
            string textoEsc = dao.Esc(nuevaTraduccion.Texto);
            string idiomaValue = (nuevaTraduccion.Idioma != null)
                ? nuevaTraduccion.Idioma.Id.ToString()
                : "NULL";

            string sqlInsert = $@"
            INSERT INTO Traduccion (
                Traduccion_IdiomaId,
                Traduccion_EtiquetaClave,
                Traduccion_Texto
            )
            VALUES (
                {idiomaValue},
                N'{etiquetaEsc}',
                N'{textoEsc}'
            );";

            dao.ExecuteNonQueryFuntion(sqlInsert);
        }

        public static List<Traduccion> Listar()
        {
            var dao = new DAO();

            string sql = @"
            SELECT Traduccion_IdiomaId, Traduccion_EtiquetaClave, Traduccion_Texto
            FROM Traduccion
            ORDER BY Traduccion_IdiomaId, Traduccion_EtiquetaClave;";

            DataSet ds = dao.ExecuteDataSet(sql);
            var lista = new List<Traduccion>();

            if (ds.Tables.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    lista.Add(MapTraduccion(dr));
                }
            }

            return lista;
        }

        public static void Actualizar(Traduccion traduccion)
        {
            var dao = new DAO();

            string idiomaValue = (traduccion.Idioma != null)
                ? traduccion.Idioma.Id.ToString()
                : "NULL";

            string sqlUpdate = $@"
            UPDATE Traduccion SET
                Traduccion_Texto = N'{dao.Esc(traduccion.Texto)}'
            WHERE Traduccion_IdiomaId = {idiomaValue} 
              AND Traduccion_EtiquetaClave = N'{dao.Esc(traduccion.Etiqueta)}';";

            dao.ExecuteNonQueryFuntion(sqlUpdate);
        }
        /// <summary>
        ///  se puede borrar
        /// </summary>
        /// <param name="traduccion"></param>
        /// <returns></returns>
        public static int Eliminar(Traduccion traduccion)
        {
            var dao = new DAO();

            string idiomaValue = (traduccion.Idioma != null)
                ? traduccion.Idioma.Id.ToString()
                : "NULL";

            string sqlDelete = $@"
            DELETE FROM Traduccion 
            WHERE Traduccion_IdiomaId = {idiomaValue} 
              AND Traduccion_EtiquetaClave = N'{dao.Esc(traduccion.Etiqueta)}';";

            int filas = dao.ExecuteNonQueryFuntion(sqlDelete);
            return filas;
        }

        private static Traduccion MapTraduccion(DataRow dr)
        {
            return new Traduccion
            {
                Etiqueta = dr["Traduccion_EtiquetaClave"] != DBNull.Value ? dr["Traduccion_EtiquetaClave"].ToString() : string.Empty,
                Texto = dr["Traduccion_Texto"] != DBNull.Value ? dr["Traduccion_Texto"].ToString() : string.Empty,

                Idioma = dr["Traduccion_IdiomaId"] != DBNull.Value
                    ? IdiomaDAL.ListarIdiomas().FirstOrDefault(x => x.Id == Convert.ToInt32(dr["Traduccion_IdiomaId"]))
                    : null
            };
        }
    }
}
