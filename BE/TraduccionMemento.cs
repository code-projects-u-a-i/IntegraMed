using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public  class TraduccionMemento
    {
        public List<Traduccion> EstadoTraducciones { get; private set; }

        public TraduccionMemento(List<Traduccion> traduccionesAClonar) 
        {
            EstadoTraducciones = new List<Traduccion>();

            foreach (var t in traduccionesAClonar)
            {
                Traduccion clon = new Traduccion(t.Idioma, t.Etiqueta, t.Texto);
                EstadoTraducciones.Add(clon);
            }
        }
    }
}
