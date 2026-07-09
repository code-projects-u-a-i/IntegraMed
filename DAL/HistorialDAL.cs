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
    public class HistorialDAL
    {
        public static List<Historial> ObtenerPorUsuario(int usuarioId)
        {
            DAO dao = new DAO();
            List<Historial> listaHistorial = new List<Historial>();

            var ds = dao.ExecuteDataSet(
                "SELECT Historial_Id, Usuario_Id, Historial_mail, Historial_fecha FROM Historial WHERE Usuario_Id = @UsuarioId ORDER BY Historial_fecha DESC",
                new SqlParameter("@UsuarioId", usuarioId)
            );

            if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                return listaHistorial; 

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listaHistorial.Add(MapHistorial(row));
            }

            return listaHistorial;
        }

        public static bool Insertar(Historial historial)
        {
            DAO dao = new DAO();

            object fechaParam = historial.Fecha == default(DateTime) ? DateTime.Now : (object)historial.Fecha;

            int filasAfectadas = dao.ExecuteNonQueryFuntion(
                "INSERT INTO Historial (Usuario_Id, Historial_mail, Historial_fecha) VALUES (@UsuarioId, @HistorialMail, @HistorialFecha)",
                new SqlParameter("@UsuarioId", historial.UsuarioID),
                new SqlParameter("@HistorialMail", historial.Mail),
                new SqlParameter("@HistorialFecha", fechaParam)
            );

            return filasAfectadas > 0;
        }

        private static Historial MapHistorial(DataRow row)
        {
            if (row == null)
                return null;

            return new Historial
            {
                Id = Convert.ToInt32(row["Historial_Id"]),
                UsuarioID = Convert.ToInt32(row["Usuario_Id"]),
                Mail = row["Historial_mail"] != DBNull.Value ? row["Historial_mail"].ToString() : null,
                Fecha = row["Historial_fecha"] != DBNull.Value ? Convert.ToDateTime(row["Historial_fecha"]) : default(DateTime)
            };
        }
    }
}