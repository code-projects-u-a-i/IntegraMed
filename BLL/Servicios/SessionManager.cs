using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Servicios
{
    public class SessionManager
    {
        private static readonly object _lock = new object();
        private static SessionManager _instancia;


        public Usuario Usuario { get; private set; }
        public DateTime FechaInicio { get; private set; }

        private SessionManager() { }

        public static SessionManager getInstance()
        {
            if (_instancia == null)
            {
                lock (_lock)
                {
                    if (_instancia == null)
                    {
                        _instancia = new SessionManager();
                    }
                }
            }
            return _instancia;
        }

        public void CrearSession(Usuario usuario)
        {
            lock (_lock)
            {
                if (Usuario != null)
                {
                    throw new Exception("Sesión ya iniciada");
                }

                Usuario = usuario;
                FechaInicio = DateTime.Now;
            }
        }

        public void CerrarSesion()
        {
            lock (_lock)
            {
                if (Usuario == null)
                {
                    throw new Exception("Sesión no iniciada");
                }

                Usuario = null;

            }
        }

        public bool HaySessionIniciada()
        {
            return Usuario != null;
        }
    }
}
