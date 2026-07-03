using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaTurnos
{
    public abstract class FormFactory
    {
        public abstract Form CrearForm();
      
        public void Abrir(Form parent)
        {
            Form nuevoForm = CrearForm();

            if (!(parent is IdiomaForm)) // idiomaForm es el unico que no debe ser parent porque esta el observer ahi
            {
                nuevoForm.MdiParent = parent;
            }

            nuevoForm.Show();

        }

    }

    public class AdministrarPerfilesFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
            return new AdministrarPerfilesForm();
        }
    }

    public class AgregarIdiomaFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
           return new AgregarIdioma();
        }
    }
    public class AsignarPerfilesUsuarioFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
            return new AsignarPerfilesUsuarioForm();
        }
    }

    public class BitacoraFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
            return new BitacoraForm();
        }
    }

    public class CambiarClaveFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
            return new CambiarClaveForm();
        }
    }
    public class GestionPerfilFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
            return new GestionPerfilForm();
        }
    }
    public class RegistrarseFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
            return new RegistrarseForm();
        }
    }

    public class IdiomaFormFactory : FormFactory
    {
        public override Form CrearForm()
        {
            return new IdiomaForm();
        }
    }

}
