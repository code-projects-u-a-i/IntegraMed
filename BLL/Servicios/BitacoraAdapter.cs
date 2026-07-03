using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Servicios
{
    public class BitacoraAdapter
    {
        private BitacoraBL _bitacoraBL= new BitacoraBL();
        public BitacoraAdapter()
        {

        }

        public void RegistrarFallido(string permiso)
        {
            _bitacoraBL.IngresarBitacora(
            SessionManager.getInstance().ObtenerUsuario().Id,
            SessionManager.getInstance().ObtenerUsuario().Username,
            permiso,
            $"Acceso denegado al usuario:" + SessionManager.getInstance().ObtenerUsuario().Username,
            "",
            SeveridadLog.Warn 
        );
        }
    }
}
