using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class TraduccionBL
    {
        public  List<Traduccion> Listar()
        {
            return TraduccionDAL.Listar();
        }

        public  void InsertarTraduccion(Traduccion nuevaTraduccion)
        {
            if (string.IsNullOrWhiteSpace(nuevaTraduccion.Texto))
                throw new Exception("El texto de la traducción no puede estar vacío.");

            try
            {
                TraduccionDAL.InsertarTraduccion(nuevaTraduccion);
            }
            catch (Exception ex)
            {
                throw new Exception($"Error al insertar la traducción para la etiqueta '{nuevaTraduccion.Etiqueta}'.", ex);
            }
        }

        public  void Actualizar(Traduccion traduccion)
        {         
            if (string.IsNullOrWhiteSpace(traduccion.Texto))
                throw new Exception("El texto de la traducción no puede estar vacío");

            try
            {
                TraduccionDAL.Actualizar(traduccion);
            }
            catch (Exception ex)
            {
                throw new Exception($"Error al actualizar la traducción de la etiqueta '{traduccion.Etiqueta}'.", ex);
            }
        }
    }
}
