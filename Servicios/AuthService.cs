using BE;
using BLL;

namespace Servicios
{
    public enum LoginResult
    {
        //Para reflejar los distintos estados donde se puede caer cuando se hacen los chequeos.
        Exito,
        UsuarioNoEncontrado,
        UsuarioBloqueado,
        CredencialesInvalidas,
        BloqueadoPorIntentos
    }
    public class AuthService
    {
        private readonly UsuarioBL _usuarioBL = new UsuarioBL();


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
                //bitacora
                return LoginResult.UsuarioBloqueado;
            }


            if (passwordIngresada.Equals(usuario.Password))
            {
                //bitacora
                usuario.IntentosFallidos = 0;
               // if (usuario.IntentosFallidos!=0) //update Usuario
                
               return LoginResult.Exito;
            }
            else
            {
                usuario.IntentosFallidos++;

                if (usuario.IntentosFallidos >= 3)
                {
                    //bitacora
                    //update bloqueado
                    return LoginResult.UsuarioBloqueado;
                }
                //bitacora
                //update IntentosFallidos
                return LoginResult.CredencialesInvalidas;
            }
        }

        public void Logout()
        {
            //update bitacora;
            SessionManager.getInstance().CerrarSesion();
        }
    }
}
