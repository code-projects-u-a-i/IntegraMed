using BE;
using BLL;
using System;

namespace Servicios
{
    public enum LoginResult
    {
        Exito,
        UsuarioNoEncontrado,
        UsuarioBloqueado,
        CredencialesInvalidas,
        BloqueadoPorIntentos
    }
    public class AuthService
    {
        private readonly UsuarioBL _usuarioBL = new UsuarioBL();
        private readonly BitacoraBL _bitacoraBL = new BitacoraBL();

        public AuthService() { }
        public LoginResult Login(string username, string passwordIngresada)
        {
            if (SessionManager.getInstance().HaySessionIniciada())
            {
                throw new System.Exception($"Ya existe una sesión activa en el sistema.");
            }


            Usuario usuario = _usuarioBL.ObtenerPorNombre(username);

            if (usuario == null)
            {
                return LoginResult.UsuarioNoEncontrado;
            }


            if (usuario.Bloqueado)
            {
                _bitacoraBL.IngresarBitacora(usuario.Id, usuario.Username, "Bloqueado", "No puede ingresar", string.Empty);
                return LoginResult.UsuarioBloqueado;
            }


            if (passwordIngresada.Equals(usuario.Password))
            {
                SessionManager.getInstance().CrearSession(usuario);
                _bitacoraBL.IngresarBitacora(usuario.Id, usuario.Username, "Ingreso Exitoso", "Se blanquea intentos fallidos", string.Empty);

                if (usuario.IntentosFallidos != 0)
                {
                    usuario.IntentosFallidos = 0;
                    _usuarioBL.ActualizarUsuario(usuario);
                }

                return LoginResult.Exito;
            }
            else
            {
                usuario.IntentosFallidos++;

                if (usuario.IntentosFallidos >= 3)
                {
                    usuario.Bloqueado = true;
                    _bitacoraBL.IngresarBitacora(usuario.Id, usuario.Username, "Bloqueado", "Alcanzo 3 intentos", string.Empty);
                    _usuarioBL.ActualizarUsuario(usuario);
                    return LoginResult.UsuarioBloqueado;
                }

                _bitacoraBL.IngresarBitacora(usuario.Id, usuario.Username, "Credenciales Erroneas", "Se actualiza intento fallido", string.Empty);
                _usuarioBL.ActualizarUsuario(usuario);
                return LoginResult.CredencialesInvalidas;
            }
        }

        public void Logout()
        {
            if (SessionManager.getInstance().Usuario != null)
            {
                _bitacoraBL.IngresarBitacora(SessionManager.getInstance().Usuario.Id, SessionManager.getInstance().Usuario.Username, "Se cierra sesion", string.Empty, string.Empty);
                SessionManager.getInstance().CerrarSesion();
            }
            else
            {
                throw new Exception("Sesión no iniciada");
            }

        }
    }
}
