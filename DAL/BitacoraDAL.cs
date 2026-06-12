using BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class BitacoraDAL
    {
      
        public static void Insertar(Bitacora bitacora)
        {
            DAO dao = new DAO();

            string fechaFormateada = bitacora.FechaUTC.ToString("yyyy-MM-dd HH:mm:ss");
            string severidadValor = bitacora.Severidad.HasValue? ((int)bitacora.Severidad.Value).ToString(): "NULL";

            string sqlInsert = $@"
            INSERT INTO Bitacora (
                FechaUTC,
                Usuario_ID,
                Usuario_Username,
                Accion,
                Mensaje,
                Detalle,
                Origen,
                Host,
                IP,
                Severidad
            )
            VALUES (
                '{fechaFormateada}',
                {bitacora.Usuario_ID},
                N'{dao.Esc(bitacora.Usuario_Username)}',
                N'{dao.Esc(bitacora.Accion)}',
                N'{dao.Esc(bitacora.Mensaje)}',
                N'{dao.Esc(bitacora.Detalle)}',
                N'{dao.Esc(bitacora.Origen)}',
                N'{dao.Esc(bitacora.Host)}',
                N'{dao.Esc(bitacora.IP)}',
                {severidadValor}
            );";

            dao.ExecuteNonQueryFuntion(sqlInsert);
        }
        public static List<Bitacora> ObtenerBitacora()
        {
            DAO dao = new DAO();

            var lista = new List<Bitacora>();
            string sql = "SELECT * FROM dbo.Bitacora";

            // Usamos tu método del DAO base
            DataSet ds = dao.ExecuteDataSet(sql);

            if (ds != null && ds.Tables.Count > 0)
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    var bitacora = new Bitacora
                    {
                        // Los campos que NO son null en la BD se asignan directo
                        FechaUTC = Convert.ToDateTime(row["FechaUTC"]),
                        Usuario_ID = Convert.ToInt32(row["Usuario_ID"]),

                        Usuario_Username = row["Usuario_Username"] == DBNull.Value ? null : row["Usuario_Username"].ToString(),
                        Accion = row["Accion"] == DBNull.Value ? null : row["Accion"].ToString(),
                        Mensaje = row["Mensaje"] == DBNull.Value ? null : row["Mensaje"].ToString(),
                        Detalle = row["Detalle"] == DBNull.Value ? null : row["Detalle"].ToString(),
                        Origen = row["Origen"] == DBNull.Value ? null : row["Origen"].ToString(),
                        Host = row["Host"] == DBNull.Value ? null : row["Host"].ToString(),
                        IP = row["IP"] == DBNull.Value ? null : row["IP"].ToString(),
                        Severidad = row["Severidad"] == DBNull.Value ? null : (SeveridadLog?)Convert.ToInt32(row["Severidad"])
                    };

                    lista.Add(bitacora);
                }
            }

            return lista;
        }
    }
}