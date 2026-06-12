using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BitacoraBL
    {
        public BitacoraBL() { }

        private Bitacora GenerarObjetoBitacora()
        {
            string nombreHost = Dns.GetHostName();
            string ipLocal = "127.0.0.1";
            Bitacora nuevaBitacora = new Bitacora
            {
                FechaUTC = DateTime.UtcNow,
                Usuario_ID = 0,
                Usuario_Username = string.Empty,
                Accion = string.Empty,
                Mensaje = string.Empty,
                Detalle = string.Empty,
                Origen = "SistemaTurnos",
                Host = nombreHost,
                IP = ipLocal
            };
            return nuevaBitacora;
        }
        public void IngresarBitacora(int idUsuario, string nombre, string accion, string mensaje, string detalle, SeveridadLog sev)
        {
            Bitacora bitacora = GenerarObjetoBitacora();
            bitacora.Usuario_ID = idUsuario;
            bitacora.Accion = accion;
            bitacora.Usuario_Username = nombre;
            bitacora.Mensaje = mensaje;
            bitacora.Detalle = detalle;
            bitacora.Severidad= sev;
            BitacoraDAL.Insertar(bitacora);
        }

        public List<Bitacora> ObtenerBitacora()
        {
            return BitacoraDAL.ObtenerBitacora();
        }
    }

}
