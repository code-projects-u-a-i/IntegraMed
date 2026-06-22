using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Familia : Perfil
    {
        public override bool Contiene(string patenteNombre)
        {
            if (base.Contiene(patenteNombre)) return true; // familia tiene el mismo nombre?

            
            foreach (var hijo in listaPerfiles)
            {
                if (hijo.Contiene(patenteNombre)) return true; // hijos de familia tiene el mismo nombre
            }

            return false;
        }
    }
}
