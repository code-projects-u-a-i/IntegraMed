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
    public class AdministrarPermisosService
    {
        public void AgregarHijoAFamilia(Familia familia, Perfil hijo)
        {
            if(hijo.Contiene(familia.Tag))
            {
                throw new Exception("Se detectó una relación cíclica. El perfil seleccionado ya existe en la familia de permisos.");
            }
            PerfilDAL.AgregarHijoAFamilia(familia.Id, hijo.Id);
        }

        public void CrearPerfil(string nombre, string tag,string tipo)
        {
            PerfilDAL.CrearPerfil(nombre,tag,tipo);
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

        public List<Perfil> ObtenerTodosLosPerfiles(int id)
        {
            return PerfilDAL.ListarPerfilesDisponiblesParaAsignar(id);
        }

        public void QuitarHijoDeFamilia(int idPadre, int idHijo)
        {
            PerfilDAL.QuitarHijoDeFamilia(idPadre, idHijo);
        }

        public List<Perfil> ListarPerfiles()
        {
            return PerfilDAL.Listar();
        }
        public void QuitarPerfilAUsuario(int usuario, int perfil)
        {
            PerfilDAL.QuitarComponenteDeUsuario(usuario, perfil);
        }

        public void EditarPerfil(int id, string nombre)
        {
            PerfilDAL.EditarPerfil(id, nombre);
        }

        public string[] ObtenerTagsPermisos()
        {
            return PermisoTag.PermisosNombreTags;
        }

       
        public void AsignarRolAUsuario(int idUsuario, int idFamilia)
        {
            PerfilDAL.AsignarComponenteAUsuario(idUsuario, idFamilia);  
        }
        public List<Perfil> ObtenerArbolUsuario(int usuarioId)  
        {
            var raices = PerfilDAL.ObtenerRaicesDeUsuario(usuarioId);
            var list = new List<Perfil>();

            foreach (var raiz in raices)
            {
                var sub = ConstruirArbol(raiz.Id);
                if (sub != null)
                    list.Add(sub);
            }

            return list;
        }

        public Perfil ConstruirArbol(int perfilId)  
        {
            HashSet<int> componentesVisitados = new HashSet<int>();
            return ConstruirArbolInterno(perfilId, componentesVisitados);
        }

        //  recursivo, obtiene un componente y carga todos sus hijos
        private Perfil ConstruirArbolInterno(int perfilId, HashSet<int> componentesVisitados)  
        {
            if (componentesVisitados.Contains(perfilId))
                return null;

            componentesVisitados.Add(perfilId);

            Perfil perfil = PerfilDAL.Obtener(perfilId);
            if (perfil == null)
                return null;

            var familia = perfil as Familia;
            if (familia != null)
            {
                var hijos = PerfilDAL.ObtenerHijosDeFamilia(familia.Id);
                foreach (var hijo in hijos)
                {
                    var sub = ConstruirArbolInterno(hijo.Id, componentesVisitados);
                    if (sub != null)
                        familia.AgregarHijo(sub);
                }
            }

            return perfil;
        }

        private string EvaluarRta(string rta)
        {

            switch (rta)
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
