using BE;
using BLL.Servicios;
using DAL;
using Seguridad;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class UsuarioBL
    {

        public UsuarioBL() { }


        public Usuario ObtenerPorNombre(string username)
        {
            return UsuarioDAL.ObtenerPorNombre(username);
        }

        public void ActualizarUsuario(Usuario usuario)
        {
            UsuarioDAL.ActualizarPorId(usuario);
        }

        public void ActualizarContraseña(string passVieja, string passNueva)
        {
           
            // hasheo para ver si concide
            CryptoManager crypto = new CryptoManager();
            string passViejaHashed = crypto.HashMD5(passVieja);
            
            Usuario usuario = ObtenerPorNombre(SessionManager.getInstance().ObtenerUsuario().Username);
     
            // coincide -- hasheo la nueva
            if (string.Equals(usuario.Password, passViejaHashed, StringComparison.OrdinalIgnoreCase))
            {
                usuario.Password = crypto.HashMD5(passVieja);
                ActualizarUsuario(usuario);
                BitacoraBL bitacora = new BitacoraBL();
                bitacora.IngresarBitacora(usuario.Id, usuario.Username, "ActualizarContraseña", "Contraseña actualizada", "", SeveridadLog.Info);
            }else
            {// no coincide le digo que vuelva a intentar
                throw new Exception("La contraseña existente no coincide, por favor vuelva a ingresarla");
            }
            
        }

        public int CrearUsuario(string username, string password, string mail)
        {
            
            Usuario usuario = ObtenerPorNombre(username);
            if (usuario == null)// no puede haber dos usuarios iguales
            {
                // hashear contraseña
                CryptoManager  crypto = new CryptoManager();
                string hashedPassw =crypto.HashMD5(password);
                
                // creo objeto con 0 intentos y false no bloqueado
                usuario = new Usuario(username, hashedPassw, mail);

                // guardo en base
                int ultimoID = UsuarioDAL.InsertarUsuario(usuario);
                
                // bitacora
                BitacoraBL bitacora = new BitacoraBL();
                bitacora.IngresarBitacora(ultimoID, username, "Nuevo Usuario", "usuario creado con exito", "", SeveridadLog.Info);
                return ultimoID;
            }
            else
            {
                throw new Exception("Ya existe un usuario con ese nombre, por favor intente con otro nombre");
            }

        }

        public  List<Usuario> ObtenerUsuarios()
        {
            return UsuarioDAL.Listar();
        }
        // este metodo busca los permisos de un usuario (lista) para despues agregarlo en la lista de permisos del usuario
        public Usuario ObtenerPermisos(Usuario usuario)
        {
            AdministrarPermisosService admPermServices = new AdministrarPermisosService();

            foreach (var item in admPermServices.ObtenerArbolUsuario(usuario.Id))
            {
                usuario.AgregarPermiso(item);
            }
           return usuario;
        }
/*
        public int CalcularDVH(Usuario usuario)
        {
            string cadenaFila = usuario.Id.ToString()
                  + usuario.Username
                  + usuario.Password
                  + usuario.Mail
                  + usuario.IntentosFallidos.ToString()
                  + usuario.Bloqueado.ToString()
                  + usuario.IdiomaDefault.Id.ToString();
        }
*/
    }
}
