using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Familia : Componente
    {
        public override void AgregarHijo(Componente componente)
        {
            if (componente == null) return;

            if (!listaHijos.Any(h => h.Id == componente.Id))
                listaHijos.Add(componente);
        }

        public override void QuitarHijo(Componente componente)
        {
            listaHijos.RemoveAll(h => h.Id == componente.Id);
        }

        public override bool Contiene(string patenteNombre)
        {
            if (base.Contiene(patenteNombre)) return true; // familia tiene el mismo nombre?

            
            foreach (var hijo in listaHijos)
            {
                if (hijo.Contiene(patenteNombre)) return true; // hijos de familia tiene el mismo nombre
            }

            return false;
        }
    }
}
