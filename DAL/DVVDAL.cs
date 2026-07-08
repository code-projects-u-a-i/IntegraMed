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
    public class DVVDAL
    {
        public static DVV ObtenerPorNombreTabla(string nombreTabla)
        {
            DAO dao = new DAO();

            var ds = dao.ExecuteDataSet(
                "SELECT TOP 1 * FROM DVV WHERE Nombre_tabla = @NombreTabla",
                new SqlParameter("@NombreTabla", nombreTabla)
            );

            if (ds.Tables.Count == 0 ||     ds.Tables[0].Rows.Count == 0)
                return null;

            return MapDVV(ds.Tables[0].Rows[0]);
        }
        public static bool UpdateSumaPorNombreTabla(string nombreTabla, long nuevaSuma)
        {
            DAO dao = new DAO();

            int filasAfectadas = dao.ExecuteNonQueryFuntion(
                "UPDATE DVV SET Suma = @Suma WHERE Nombre_tabla = @NombreTabla",
                new SqlParameter("@Suma", nuevaSuma),
                new SqlParameter("@NombreTabla", nombreTabla)
            );

            return filasAfectadas > 0;
        }

        private static DVV MapDVV(DataRow row)
        {
            if (row == null)
                return null;

            return new DVV
            {
                ID = Convert.ToInt32(row["ID"]),
                Nombre_tabla = row["Nombre_tabla"].ToString(),
                Suma = Convert.ToInt32(row["Suma"])
            };
        }
    }
}
