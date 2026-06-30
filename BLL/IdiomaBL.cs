using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class IdiomaBL
    {

        public IdiomaBL() { }

        public List<Idioma> Obtener()
        {
            return IdiomaDAL.ListarIdiomas();
        }

        public int AgregarIdioma(Idioma idioma)
        {
           return IdiomaDAL.AgregarIdioma(idioma);
        }
        public void EliminarIdioma (int idIdioma)
        {
            IdiomaDAL.EliminarIdioma(idIdioma);
        }
    }
}
