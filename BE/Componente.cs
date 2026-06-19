using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public abstract class Componente
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        // esto lo podria poner en familia, porque es el unico que va a iterar la lista, pero "composite dice que todos los objetos deben ser tratados por igual, independientemente de su tipo"
        protected List<Componente> listaHijos = new List<Componente>();
        public virtual void AgregarHijo(Componente c)
        {
            listaHijos.Add(c);
        }

        public virtual void QuitarHijo(Componente c)
        {
            listaHijos.Remove(c);
        }

        public virtual IEnumerable<Componente> ObtenerHijos()
        {
            return listaHijos;
        }
        public virtual bool Contiene(string patenteNombre)
        {
            return this.Nombre.Equals(patenteNombre, StringComparison.OrdinalIgnoreCase);
        }
    }
}
