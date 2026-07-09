using BE;
using BLL.Servicios;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class HistorialBL
    {
        public List<Historial> ObtenerPorUsuario(int usuarioId)
        {
            return HistorialDAL.ObtenerPorUsuario(usuarioId);
        }

        public void Insertar(string mail, int id=0)
        {
            // si es un usuario ya existente debo actualizar el usuario
            if (id == 0)
            {
                Usuario usuario = SessionManager.getInstance().ObtenerUsuario();

                usuario.Mail = mail;

                UsuarioBL usuarioBL = new UsuarioBL();

                usuarioBL.ActualizarUsuario(usuario);

                BitacoraBL bitacoraBL = new BitacoraBL();
                bitacoraBL.IngresarBitacora(usuario.Id, usuario.Username, "Se actualiza el mail", "Exitoso", "", SeveridadLog.Info);
            }

            // si es un usuario tengo que ademas ingresar en historial el mail
            if (id != 0)
            {
                id = SessionManager.getInstance().ObtenerUsuario().Id;
            }
            
            Historial historial = new Historial(id, mail, DateTime.Now);
            HistorialDAL.Insertar(historial);
        }
    }
}
