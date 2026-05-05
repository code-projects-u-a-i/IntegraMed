using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Collections.Specialized.BitVector32;
using BL;
using System.Runtime.Remoting.Messaging;

namespace Servicios
{
    public class SesionSingleton
    {
        private static SesionSingleton instancia;

        public Usuario Usuario { get; private set; }

        private SesionSingleton() { }

        public static SesionSingleton getInstance()
        {
            if (instancia == null)
            {
                instancia = new SesionSingleton();
            }
            return instancia;
        }

        public void Login(Usuario usuario)
        {
            Usuario = usuario;
        }

        public void Logout()
        {
            Usuario = null;
        }

        public bool EstaLogueado()
        {
            return Usuario != null;

        }
    }
}
