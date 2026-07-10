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

        public void Insertar(string mail, int id=0) /// si viene sin id porque quiere modificar su mail, debe actualizar el usuario y el historial. Si el admin crea un usuario tiene que usar el id del insert
        {
            // si es un usuario que ya existe cree debo actualizar el usuario conectado (porque es el que quiere modificar su mail)
            if (id == 0)
            {
                Usuario usuario = SessionManager.getInstance().ObtenerUsuario();

                usuario.Mail = mail;

                UsuarioBL usuarioBL = new UsuarioBL();

                usuarioBL.ActualizarUsuario(usuario);

                BitacoraBL bitacoraBL = new BitacoraBL();
                bitacoraBL.IngresarBitacora(usuario.Id, usuario.Username, "Se actualiza el mail", "Exitoso", "", SeveridadLog.Info);
                id = usuario.Id;
            }

            // si es un usuario recien creado solo hay ingresar en historial el mail
            
            Historial historial = new Historial(id, mail, DateTime.Now);
            HistorialDAL.Insertar(historial);
        }
    }
}
