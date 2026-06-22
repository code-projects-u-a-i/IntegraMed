using BLL.Servicios;
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
{
    public partial class MenuPrincipalForm : Form
    {
        private AuthService authService = new AuthService();
        public MenuPrincipalForm()
        {
            InitializeComponent();
        }

        private void cambiarClaveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CambiarClaveForm cambiarClave = new CambiarClaveForm();
            cambiarClave.MdiParent = this;
            cambiarClave.Show();
        }

        private void MenuForm_Load(object sender, EventArgs e)
        {
            this.BackColor = Color.FromArgb(190, 220, 230);
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema Sagrado Corazón - Menu principal";
            this.menuStrip1.RenderMode = ToolStripRenderMode.System;
            this.menuStrip1.BackColor = SystemColors.Control;
            this.menuStrip1.Padding = new Padding(6, 6, 6, 6);
            this.menuStrip1.Font = new Font("Segoe UI", 9F, FontStyle.Regular);
        }

        private void cerrarSesionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                authService.Logout();
                MessageBox.Show("Se desconecto exitosamente", "Desconectado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Hide();
                Form1 menu = new Form1();
                menu.ShowDialog();
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Desconectarse", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cambiarClaveToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            CambiarClaveForm cambiarClave = new CambiarClaveForm();
            cambiarClave.MdiParent = this;
            cambiarClave.Show();
        }

        private void bitacoraToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            BitacoraForm bitacoraForm = new BitacoraForm();
            bitacoraForm.MdiParent = this;
            bitacoraForm.Show();
        }

        private void gestiónDePerfilesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionPerfilForm perfilForm = new GestionPerfilForm();
            perfilForm.MdiParent = this;
            perfilForm.Show();
        }
    }
}
