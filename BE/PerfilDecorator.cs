using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class PerfilDecorator : Perfil
    {
        protected Perfil perfilDecorado;

        protected PerfilDecorator(Perfil perfil)
        {
            perfilDecorado = perfil;
            this.Tag = perfil.Tag;
            this.Nombre = perfil.Nombre; 
            this.Id = perfil.Id;
        }
   
        public override bool Contiene(string patenteTag)
        {
            return base.Tag.Equals(patenteTag, StringComparison.OrdinalIgnoreCase);
        }


    }
}
