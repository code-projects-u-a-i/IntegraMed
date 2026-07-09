using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Historial
    {
        public int Id { get; set; }

        public int UsuarioID { get; set; }

        public string Mail { get; set; }
        public DateTime Fecha { get; set; }

        public Historial() { }
        public Historial(int usuarioID, string mail, DateTime fecha)
        {
            UsuarioID = usuarioID;
            Mail = mail;
            Fecha = fecha;
        }
    }
}