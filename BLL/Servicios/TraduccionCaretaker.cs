using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Servicios
{
    public class TraduccionCaretaker
    {
        private Stack<TraduccionMemento> _historial = new Stack<TraduccionMemento>(); // si usamos stack nos olvidamos de indices, nos manejamos con push y pop y ya

        public void GuardarEstado(List<Traduccion> listaActual)
        {
            _historial.Push(new TraduccionMemento(listaActual));
        }
        public List<Traduccion> Deshacer()
    {
            if (puedeDeshacer())
            {
                var memento = _historial.Pop();
                return new List<Traduccion>(memento.EstadoTraducciones);
            }
            return null;
        }

        public bool puedeDeshacer()
        {
            return _historial.Count() > 0;
        }

    }
}
