using BE;
using DAL;
using System;

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


    }
}
