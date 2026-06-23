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
    }
}
