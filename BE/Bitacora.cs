using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Bitacora
    {
        public DateTime FechaUTC { get; set; }
        public int Usuario_ID { get; set; }
        public string Usuario_Username { get; set; }
        public string Accion { get; set; }
        public string Mensaje { get; set; }
        public string Detalle { get; set; }
        public string Origen { get; set; }
        public string Host { get; set; }
        public string IP { get; set; }

        public Bitacora()
        {
            FechaUTC = DateTime.UtcNow; 
            Usuario_Username = string.Empty;
            Accion = string.Empty;
            Mensaje = string.Empty;
            Detalle = string.Empty;
            Origen = string.Empty;
            Host = string.Empty;
            IP = string.Empty;
        }
    }
}
