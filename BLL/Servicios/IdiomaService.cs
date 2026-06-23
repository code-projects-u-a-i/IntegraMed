using DAL;
using Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Servicios
{
    public class IdiomaService
    {
        // Lista de todos los formularios abiertos que están escuchando
        private static List<IIdiomaObserver> _observadores = new List<IIdiomaObserver>();

        // El diccionario en memoria con las traducciones del idioma actual
        // Ejemplo: ["lbl_Usuario" => "Username", "btn_Agregar" => "Add"]
        public static Dictionary<string, string> TraduccionesActuales { get; private set; }

        public static void Suscribir(IIdiomaObserver observador)
        {
            _observadores.Add(observador);
        }

        public static void Desuscribir(IIdiomaObserver observador)
        {
            _observadores.Remove(observador);
        }

        // Cuando el usuario cambia el idioma en el combo principal, llamás a este método
        public static void CambiarIdioma(int idiomaId)
        {
            // 1. Vas a la DAL y te traés el diccionario del idioma seleccionado
            TraduccionesActuales = IdiomaDAL.ObtenerTraducciones(idiomaId);

            // 2. NOTIFICAR (Avisar a todas las pantallas abiertas que se actualicen)
            foreach (var obs in _observadores)
            {
                obs.UpdateIdioma(TraduccionesActuales);
            }
        }
    }
}
