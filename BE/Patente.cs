using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Patente: Componente
    {
        public override void AgregarHijo(Componente c)
        {
            throw new NotSupportedException("Una patente no puede tener hijos.");
        }

        public override void QuitarHijo(Componente c)
        {
            throw new NotSupportedException("Una patente no puede tener hijos.");
        }

        public override bool Contiene(string patenteNombre)
        {
            return !string.IsNullOrEmpty(patenteNombre) &&
                   Nombre.Equals(patenteNombre, StringComparison.OrdinalIgnoreCase);
        }
    }
}
