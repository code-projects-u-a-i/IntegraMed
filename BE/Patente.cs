using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Patente: Perfil
    {
        public override void AgregarHijo(Perfil p)
        {
            throw new NotSupportedException("Una patente no puede tener hijos.");
        }

        public override void QuitarHijo(Perfil p)
        {
            throw new NotSupportedException("Una patente no puede tener hijos.");
        }

        public override bool Contiene(string patenteTag)
        {
            return !string.IsNullOrEmpty(patenteTag) &&
                   Tag.Equals(patenteTag, StringComparison.OrdinalIgnoreCase);
        }
    }
}
