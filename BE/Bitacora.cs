    using System;

namespace BE
{
    public enum SeveridadLog : byte { Info = 0, Warn = 1, Error = 2, Audit = 3 }
    public class Bitacora
    {
        public DateTime FechaUTC { get; set; }
        public int Usuario_ID { get; set; }
        public string Usuario_Username { get; set; }
        public string Accion { get; set; }
        public SeveridadLog? Severidad { get; set; } = SeveridadLog.Info;
        public string Mensaje { get; set; }
        public string Detalle { get; set; }
        public string Origen { get; set; }
        public string Host { get; set; }
        public string IP { get; set; }

        public Bitacora()
        {
            FechaUTC = DateTime.Now;
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
