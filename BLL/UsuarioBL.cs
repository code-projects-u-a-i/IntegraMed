using BE;
using DAL_AccesoDatos;
using System;

namespace BLL
{
    public class UsuarioBL
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string password { get; set; }

        public UsuarioBL() { }

      
        public Usuario ObtenerPorNombre(string username)
        {
            return UsuarioDAL.ObtenerPorNombre(username);
        }
         

    }
}
