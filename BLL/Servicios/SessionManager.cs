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
        private Usuario _usuario;
        private DateTime _fechaInicio;

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
                if (_usuario != null)
                {
                    throw new Exception("Sesión ya iniciada");
                }

                _usuario = usuario;
                _fechaInicio = DateTime.Now;
            }
        }

        public void CerrarSesion()
        {
            lock (_lock)
            {
                if (_usuario == null)
                {
                    throw new Exception("Sesión no iniciada");
                }

                _usuario = null;

            }
        }
        public bool HaySessionIniciada()
        {
            return _usuario != null;
        }

        public Usuario ObtenerUsuario()
        {
            return _usuario;
        }

    }
}
