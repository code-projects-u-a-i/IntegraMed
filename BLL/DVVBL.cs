using BE;
using BLL.Servicios;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace BLL
{
    public class DVVBL
    {
        UsuarioBL _usuarioBL = new UsuarioBL();
        public DVVBL() { }

        public void CalcularDVV(string tabla)
        {
           long suma =  _usuarioBL.CalcularDVV();
            DVVDAL.UpdateSumaPorNombreTabla(tabla, suma);
        }

        public bool EvaluarInconsistencia()
        {
            List<Usuario> listaUsuarios = _usuarioBL.ObtenerUsuarios();
            long suma = 0;

            foreach (var usuario in listaUsuarios)
            {
                suma += _usuarioBL.CalcularDVH(usuario);
            }

            if (suma == DVVDAL.ObtenerPorNombreTabla("Usuario").Suma) 
            {
                return false;
            }
            return true;
           

        }

        public void RestaurarIntegridad()
        {
            long suma = 0;
            foreach (var item in _usuarioBL.ObtenerUsuarios())
            {
                long dvh = _usuarioBL.CalcularDVH(item);
                _usuarioBL.UpdateDVH(item.Id, dvh);
                suma += dvh;
            }
            DVVDAL.UpdateSumaPorNombreTabla("Usuario", suma);
            SessionManager.getInstance().IntegridadBaseDatos = false;
        }
    }
}
