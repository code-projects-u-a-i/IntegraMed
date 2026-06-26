using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public abstract class Perfil
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Tag { get; set; }

        // esto lo podria poner en familia, porque es el unico que va a iterar la lista, pero "composite dice que todos los objetos deben ser tratados por igual, independientemente de su tipo"
        protected List<Perfil> listaPerfiles = new List<Perfil>();

        public virtual void AgregarHijo(Perfil c)
        {
            if (c == null) return;
            if (!listaPerfiles.Any(h => h.Id == c.Id))
                listaPerfiles.Add(c);
        }

        public virtual void QuitarHijo(Perfil c)
        {
            listaPerfiles.RemoveAll(h => h.Id == c.Id);
        }
        public virtual IEnumerable<Perfil> ObtenerPerfiles()
        {
            return listaPerfiles;
        }

        public virtual bool Contiene(string patenteTag)
        {
            return this.Tag.Equals(patenteTag, StringComparison.OrdinalIgnoreCase);
        }
    }
}
