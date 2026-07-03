using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Seguridad
{
    public interface IBitacoraAdapter
    {
        void RegistrarAcceso(int idUsuario, string username, string accion, string mensaje, string detalle);
    }
}
