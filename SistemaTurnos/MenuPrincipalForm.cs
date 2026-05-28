using BLL;
using BLL.Servicios;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaTurnosUI
{
    public partial class MenuPrincipalForm : Form
    {
        public MenuPrincipalForm()
        {
            InitializeComponent();
        }
        private AuthService authService = new AuthService();
        private MenuStrip menuStrip1;
        private ToolStripMenuItem cambiarClaveToolStripMenuItem;
        private ToolStripMenuItem cerrarSesionToolStripMenuItem;

        // mas adelante puede que se modifique de lugar
        private readonly Color _fondoOscuro = Color.FromArgb(40, 50, 55);
        private readonly Color _fondoInput = Color.FromArgb(60, 70, 75);
        private readonly Color _acentoTurquesa = Color.FromArgb(100, 200, 180);
        private readonly Color _textoBlanco = Color.White;
        private readonly Color _textoGris = Color.FromArgb(180, 180, 180);

        private TextBox _txtVieja;
        private TextBox _txtNueva;

        UsuarioBL usuarioBL = new UsuarioBL();

        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.cambiarClaveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cerrarSesionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cambiarClaveToolStripMenuItem,
            this.cerrarSesionToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(429, 24);
            this.menuStrip1.TabIndex = 7;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // cambiarClaveToolStripMenuItem
            // 
            this.cambiarClaveToolStripMenuItem.Name = "cambiarClaveToolStripMenuItem";
            this.cambiarClaveToolStripMenuItem.Size = new System.Drawing.Size(96, 20);
            this.cambiarClaveToolStripMenuItem.Text = "Cambiar Clave";
            this.cambiarClaveToolStripMenuItem.Click += new System.EventHandler(this.cambiarClaveToolStripMenuItem_Click);
            // 
            // cerrarSesionToolStripMenuItem
            // 
            this.cerrarSesionToolStripMenuItem.Name = "cerrarSesionToolStripMenuItem";
            this.cerrarSesionToolStripMenuItem.Size = new System.Drawing.Size(88, 20);
            this.cerrarSesionToolStripMenuItem.Text = "Cerrar Sesion";
            this.cerrarSesionToolStripMenuItem.Click += new System.EventHandler(this.cerrarSesionToolStripMenuItem_Click);
            // 
            // MenuPrincipalForm
            // 
            this.ClientSize = new System.Drawing.Size(429, 350);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MenuPrincipalForm";
            this.Load += new System.EventHandler(this.MenuPrincipalForm_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        private void MenuPrincipalForm_Load(object sender, EventArgs e)
        {
            this.BackColor = Color.FromArgb(190, 220, 230);
            this.Size = new Size(450, 500);
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema Sagrado Corazón - Menu principal";

            this.menuStrip1.RenderMode = ToolStripRenderMode.System;

            this.menuStrip1.BackColor = SystemColors.Control;

            this.menuStrip1.Padding = new Padding(6, 6, 6, 6);

            this.menuStrip1.Font = new Font("Segoe UI", 9F, FontStyle.Regular);

        }

        ///metodo que cambia la clave de la contraseña
        private void BtnConfirmar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(_txtVieja.Text) || string.IsNullOrWhiteSpace(_txtNueva.Text))
            {
                MessageBox.Show("Por favor, complete todos los campos antes de continuar.", "Campos Incompletos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            try
            {
                usuarioBL.ActualizarContraseña(_txtVieja.Text, _txtNueva.Text);
                MessageBox.Show("Se modificó la contraseña exitosamente", "Exito", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (this.Controls.ContainsKey("panelDarkClave"))
                {
                    Control panel = this.Controls["panelDarkClave"];
                    this.Controls.Remove(panel); 
                    panel.Dispose();             
                }
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message, "Cambio de clave con error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

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

        // el boton que efectivamente cambia la clave es BtnConfirmar_Click, este crea el groupbox, textbox y botones dinamicamente
        private void cambiarClaveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (this.Controls.ContainsKey("panelDarkClave"))
            {
                this.Controls["panelDarkClave"].BringToFront();
                return;
            }

            Panel pnlFondo = EnsamblePanelContenedor();

            this.Controls.Add(pnlFondo);
            pnlFondo.BringToFront();
            _txtVieja.Focus();
        }

        // controles cambio de clave dinamicos
        private Panel EnsamblePanelContenedor()
        {
            Panel pnlFondo = new Panel
            {
                Name = "panelDarkClave",
                Size = new Size(350, 300), 
                BackColor = _fondoOscuro
            };


            pnlFondo.Location = new Point(
                (this.ClientSize.Width - pnlFondo.Width) / 2,
                (this.ClientSize.Height - pnlFondo.Height) / 2
            );

            int inicioY = 15;

            pnlFondo.Controls.Add(CrearLabelEstilizado("Contraseña actual", 20, inicioY));
            _txtVieja = CrearTextBoxEstilizado("txtDinamicoVieja", 20, inicioY + 22, true);
            pnlFondo.Controls.Add(_txtVieja);

            pnlFondo.Controls.Add(CrearLabelEstilizado("Contraseña nueva", 20, inicioY + 65));
            _txtNueva = CrearTextBoxEstilizado("txtDinamicoNueva", 20, inicioY + 87, true);
            pnlFondo.Controls.Add(_txtNueva);


            Button btnConfirmar = CrearBotónConfirmar();
            Button btnCancelar = CrearBotónCancelar(pnlFondo);

            pnlFondo.Controls.Add(btnConfirmar);
            pnlFondo.Controls.Add(btnCancelar);

            return pnlFondo;
        }

        private Label CrearLabelEstilizado(string texto, int x, int y)
        {
            return new Label
            {
                Text = texto,
                Location = new Point(x, y),
                ForeColor = _acentoTurquesa,
                Font = new Font("Segoe UI", 9, FontStyle.Bold),
                AutoSize = true
            };
        }

        private TextBox CrearTextBoxEstilizado(string nombre, int x, int y, bool esPassword)
        {
            return new TextBox
            {
                Name = nombre,
                Location = new Point(x, y),
                Size = new Size(310, 25),
                BackColor = _fondoInput,
                ForeColor = _textoBlanco,
                BorderStyle = BorderStyle.FixedSingle,
                Font = new Font("Segoe UI", 11),
                UseSystemPasswordChar = esPassword
            };
        }

        private Button CrearBotónConfirmar()
        {
            Button btn = new Button
            {
                Text = "Actualizar Contraseña",
                Size = new Size(310, 40),
                Location = new Point(20, 155),
                BackColor = _acentoTurquesa,
                ForeColor = _fondoOscuro,
                FlatStyle = FlatStyle.Flat,
                Font = new Font("Segoe UI", 10, FontStyle.Bold),
                Cursor = Cursors.Hand
            };


            btn.FlatAppearance.BorderSize = 0;
            btn.Click += BtnConfirmar_Click;
            return btn;
          
        }
        

        private Button CrearBotónCancelar(Panel panelARemover)
        {
            Button btn = new Button
            {
                Text = "Cancelar",
                Size = new Size(310, 25),
                Location = new Point(20, 213), // Subió a la posición 255
                ForeColor = _textoGris,
                FlatStyle = FlatStyle.Flat,
                Font = new Font("Segoe UI", 9, FontStyle.Regular),
                Cursor = Cursors.Hand,
                BackColor = Color.Transparent
            };
            btn.FlatAppearance.BorderSize = 0;

            btn.MouseEnter += (s, e) => btn.Font = new Font("Segoe UI", 9, FontStyle.Underline);
            btn.MouseLeave += (s, e) => btn.Font = new Font("Segoe UI", 9, FontStyle.Regular);

            btn.Click += (s, e) => {
                this.Controls.Remove(panelARemover);
                panelARemover.Dispose();
            };

            return btn;
        }
    }
}
