using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class DiasDeAtencion :PerfilDecorator
    {
        
        public DiasDeAtencion(Perfil perfil):base(perfil) { } // llamo al padre


        public override bool Contiene(string patenteTag)
        {
            if (patenteTag != null && patenteTag.Equals("HORARIO_ATENCION"))
            {
                DateTime hoy = DateTime.Now;

                int dia = (int)hoy.DayOfWeek; // el nro de dia

                if (dia == 0 || dia == 5) // si es sabado o domingo, devuelve false (viernes para probar)
                {
                    throw new Exception("No puede ingresar el dia " + hoy.DayOfWeek.ToString());
                }
            }            
            return perfilDecorado.Contiene(patenteTag);

        }
    }
}
