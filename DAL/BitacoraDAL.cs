using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class BitacoraDAL
    {
        public static void Insertar(Bitacora bitacora)
        {
            var dao = new DAO();


            string fechaFormateada = bitacora.FechaUTC.ToString("yyyy-MM-dd HH:mm:ss");

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
                IP
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
                N'{dao.Esc(bitacora.IP)}'
            );";

            dao.ExecuteNonQueryFuntion(sqlInsert);
        }
    }
}