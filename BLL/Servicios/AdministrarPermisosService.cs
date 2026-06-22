using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AdministrarPermisosService
    {
        public void AgregarHijoAFamilia(Familia familia, Perfil hijo)
        {
            if(hijo.Contiene(familia.Nombre))
            {
                throw new Exception("Se detectó una relación cíclica. El perfil seleccionado ya existe en la familia de permisos.");
            }
            PerfilDAL.AgregarHijoAFamilia(familia.Id, hijo.Id);
        }

        public void CrearPerfil(string nombre, string tipo)
        {
            PerfilDAL.CrearPerfil(nombre,tipo);
        }

        public string EliminarPerfil(int id)
        {
            String rta = PerfilDAL.EliminarPerfil(id);
            return EvaluarRta(rta);
        }

      

        public List<Perfil> ObtenerFamiliasRaiz()
        {
            return PerfilDAL.ObtenerFamiliasRaiz();
        }

        public List<Perfil> ObtenerHijosDeFamilia(int id)
        {
            return PerfilDAL.ObtenerHijosDeFamilia(id);
        }

        public List<Perfil> ObtenerTodasFamilias()
        {
            return PerfilDAL.ObtenerTodasFamilias();
        }

        public List<Perfil> ObtenerTodasPatentes()
        {
           return PerfilDAL.ObtenerTodasPatentes();
        }

        public void QuitarHijoDeFamilia(int idPadre, int idHijo)
        {
            PerfilDAL.QuitarHijoDeFamilia(idPadre, idHijo);
        }
        
        private string EvaluarRta(string rta)
        {

            switch(rta) 
            {
                case "TIENE_HIJOS":
                    throw new Exception("El perfil seleccionado es una familia de perfiles, debe vaciarlo antes de eliminarlo");

                case "ES_HIJO":
                    throw new Exception("El perfil seleccionado ya esta asignado a una familia, debe desasociarlo de todas las familias antes de eliminarlo");

                case "TIENE_USUARIOS":
                    throw new Exception("El perfil seleccionado ya esta asignado a un usuario del sistema, debe desasociarlo del usuario para poder eliminarlo");
                case "LIBRE":
                    return rta;
                default: throw new Exception("No se pudo eliminar el perfil");
            }
        }
    }
}
