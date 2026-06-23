using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Idioma
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public Idioma()
        {
        }

        public Idioma(int id, string nombre)
        {
            this.Id = id;
            this.Nombre = nombre;
        }
    }
}
