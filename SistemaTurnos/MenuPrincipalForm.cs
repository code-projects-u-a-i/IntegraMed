using BE;
using BLL;
using BLL.Servicios;
using Seguridad;
using SistemaTurnosUI;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaTurnos
{/// <summary>
/// menu principal
/// </summary>
    public partial class MenuPrincipalForm : Form, IIdiomaObserver
    {

        private AuthService authService = new AuthService();
        private UsuarioBL usuarioBL = new UsuarioBL();
        public MenuPrincipalForm( )
        {
            InitializeComponent();
            IdiomaService.Suscribir(this);
            CargarPermisosUser();
            this.WindowState = FormWindowState.Maximized;

        }
        #region Gestión de Permisos y Seguridad

        private void CargarPermisosUser()
        {
            Usuario usuario= SessionManager.getInstance().ObtenerUsuario();

            try
            {
                usuarioBL.EvaluarPerfilesUsuario(SessionManager.getInstance().ObtenerUsuario());
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Sera desconectado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (this.menuStrip1 != null)
            {
                EvaluarPermisosMenu(this.menuStrip1.Items, usuario);
            }
        }

        private void EvaluarPermisosMenu(ToolStripItemCollection items, object usuarioActual)
        {
            foreach (ToolStripItem item in items)
            {
                if (item is ToolStripSeparator) continue;

                
                bool esMenuPadre = item is ToolStripMenuItem menuPrincipal && menuPrincipal.HasDropDownItems;

                if (item.Tag != null && !string.IsNullOrEmpty(item.Tag.ToString()))
                {
                    string tagControl = item.Tag.ToString();

                    if (esMenuPadre)
                    {

                        item.Enabled = true;
                    }
                    else
                    {

                        item.Enabled = SessionManager.getInstance().ObtenerUsuario().TienePermiso(tagControl);
                    }
                }
                else
                {
                    // queda habilitado
                    item.Enabled = true;
                }

                // recursivo para recorrer todo el menu
                if (esMenuPadre)
                {
                    ToolStripMenuItem menuPadre = (ToolStripMenuItem)item;
                    EvaluarPermisosMenu(menuPadre.DropDownItems, SessionManager.getInstance().ObtenerUsuario());
                }
            }
        }
        #endregion


        #region Eventos del Formulario
        private void MenuForm_Load(object sender, EventArgs e)
        {
            this.BackColor = Color.FromArgb(190, 220, 230);
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.menuStrip1.RenderMode = ToolStripRenderMode.System;
            this.menuStrip1.BackColor = SystemColors.Control;
            this.menuStrip1.Padding = new Padding(6, 6, 6, 6);
            this.menuStrip1.Font = new Font("Segoe UI", 9F, FontStyle.Regular);
            IdiomaService.CambiarIdioma(SessionManager.getInstance().IdiomaActual);
        }

        private void cerrarSesionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                authService.Logout();
                MessageBox.Show("Se desconecto exitosamente", "Desconectado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Hide();
                Login menu = new Login();
                menu.ShowDialog();
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Desconectarse", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void bitacoraToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            BitacoraFormFactory fabrica = new BitacoraFormFactory();
            fabrica.Abrir(this);
        }

        private void cambiarClaveToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            CambiarClaveFormFactory cambiarClave = new CambiarClaveFormFactory();
            cambiarClave.Abrir(this);
        }

        private void seleccionarIdiomaToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            IdiomaFormFactory idiomaForm = new IdiomaFormFactory();
            idiomaForm.Abrir(this);
        }

        private void desbloqueoDeUsuarioToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Pronto", "Pronto", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void restaurarIntegridadToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Pronto", "Pronto", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void crearUsuariosToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            RegistrarseFormFactory menu = new RegistrarseFormFactory();
            menu.Abrir(this);
        }

        private void restaurarMailAnteriorToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Pronto", "Pronto", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void gestionarPerfilesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AdministrarPerfilesFormFactory eliminarPerfiles = new AdministrarPerfilesFormFactory();
            eliminarPerfiles.Abrir(this);
        }

        private void asignarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionPerfilFormFactory perfilForm = new GestionPerfilFormFactory();
            perfilForm.Abrir(this);
        }

        private void asignarPerfilesAUsuarioToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            AsignarPerfilesUsuarioFormFactory perfilForm = new AsignarPerfilesUsuarioFormFactory();
            perfilForm.Abrir(this);
        }

        private void gestionarIdiomaToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            AgregarIdiomaFormFactory perfilForm = new AgregarIdiomaFormFactory();
            perfilForm.Abrir(this);
        }

        private void modificarMailToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Pronto", "Pronto", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        #endregion

        #region Implementación del Patrón Observer (IIdiomaObserver)
        public void UpdateIdioma(Dictionary<string, string> traducciones)
        {
            if (this.Tag != null && traducciones.ContainsKey(this.Tag.ToString()))
            {
                this.Text = traducciones[this.Tag.ToString()];
            }
            // el menu tiene botones
            TraducirControlesRecursivo(this, traducciones);

            if (this.MainMenuStrip != null)
            {   // el menu tiene submenus
                TraducirMenuStripRecursivo(this.MainMenuStrip.Items, traducciones);
            }
        }
        private void TraducirMenuStripRecursivo(ToolStripItemCollection items, Dictionary<string, string> traducciones)
        {
            foreach (ToolStripItem item in items)
            {
                if (item.Tag != null && traducciones.ContainsKey(item.Tag.ToString()))
                {
                    item.Text = traducciones[item.Tag.ToString()];
                }

                if (item is ToolStripMenuItem menuPrincipal)
                {
                    if (menuPrincipal.HasDropDownItems)
                    {
                        TraducirMenuStripRecursivo(menuPrincipal.DropDownItems, traducciones);
                    }
                }
            }
        }
        private void TraducirControlesRecursivo(Control contenedor, Dictionary<string, string> traducciones)
        {
            foreach (Control c in contenedor.Controls)
            {
                if (c.Tag != null && traducciones.ContainsKey(c.Tag.ToString()))
                {
                    c.Text = traducciones[c.Tag.ToString()];
                }

                if (c.HasChildren)
                {
                    TraducirControlesRecursivo(c, traducciones);
                }
            }
        }
        #endregion

        private void administradorToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
    }
}
