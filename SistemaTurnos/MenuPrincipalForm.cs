using BE;
using BLL;
using BLL.Servicios;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace SistemaTurnosUI
{
    public partial class MenuPrincipalForm : Form
    {
        #region Atributos y Propiedades
        private AuthService authService = new AuthService();
        private UsuarioBL usuarioBL = new UsuarioBL(); 
        private BitacoraBL bitacoraBL = new BitacoraBL();
        public List<Bitacora> DatosListado { get; set; }

        // Componentes 
        private MenuStrip menuStrip1;
        private ToolStripMenuItem cambiarClaveToolStripMenuItem;
        private ToolStripMenuItem cerrarSesionToolStripMenuItem;
        private ToolStripMenuItem bitacoraToolStripMenuItem;
        private ToolStripMenuItem verBitácoraToolStripMenuItem;
        private DataGridView _dgv;
        private ComboBox _cmbFiltroSeveridad;
        private TextBox _txtVieja;
        private TextBox _txtNueva;

        // Paleta de colores / Estilos globales
        private readonly Color _fondoOscuro = Color.FromArgb(40, 50, 55);
        private readonly Color _fondoInput = Color.FromArgb(60, 70, 75);
        private readonly Color _acentoTurquesa = Color.FromArgb(100, 200, 180);
        private readonly Color _textoBlanco = Color.White;
        private readonly Color _textoGris = Color.FromArgb(180, 180, 180);
        #endregion

        #region Inicialización del Formulario
        public MenuPrincipalForm()
        {
            InitializeComponent();
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
        #endregion

        #region Lógica: Autenticación y Seguridad (Clave / Sesión)
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
        #endregion

        #region Lógica: Bitácora y Filtros
        private void verBitácoraToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CargarDatos();
            ConfigurarGrid();
        }

        private void bitacoraToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        public void CargarDatos()
        {
            try
            {
                DatosListado = bitacoraBL.ObtenerBitacora();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar la bitácora desde la base de datos: {ex.Message}",
                                "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);

                DatosListado = new List<Bitacora>();
            }
        }

        public void ConfigurarGrid()
        {
            this.ClientSize = new System.Drawing.Size(1000, 620);
            this.StartPosition = FormStartPosition.CenterScreen;

            if (_dgv != null)
            {
                this.Controls.Remove(_dgv);
                _dgv.Dispose();
            }

            ComboBox cmbFiltro = FiltroSeveridad();           

            _dgv = new DataGridView();
            _dgv.Location = new System.Drawing.Point(20, 95); 
            _dgv.Size = new System.Drawing.Size(960, 485); 
            _dgv.AllowUserToAddRows = false;
            _dgv.ReadOnly = true;
            _dgv.BackgroundColor = System.Drawing.Color.White;
            _dgv.RowHeadersVisible = false;
            _dgv.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            _dgv.AlternatingRowsDefaultCellStyle.BackColor = System.Drawing.Color.FromArgb(245, 247, 250);

            _dgv.EnableHeadersVisualStyles = false;
            _dgv.ColumnHeadersDefaultCellStyle.BackColor = System.Drawing.Color.FromArgb(44, 62, 80); 
            _dgv.ColumnHeadersDefaultCellStyle.ForeColor = System.Drawing.Color.White;
            _dgv.ColumnHeadersDefaultCellStyle.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            _dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            _dgv.ColumnHeadersHeight = 35;
            
            string seleccion = cmbFiltro.SelectedItem.ToString();
            if (seleccion == "Todos")
            {
                _dgv.DataSource = DatosListado;
            }
            else
            {
                _dgv.DataSource = DatosListado.FindAll(x => x.Severidad.HasValue && x.Severidad.Value.ToString() == seleccion);
            }

            this.Controls.Add(_dgv);
            FormatearColumnas();
        }
        #endregion

        #region Componentes Dinámicos
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

        private ComboBox FiltroSeveridad()
        {
            Control[] existentes = this.Controls.Find("cmbFiltroSeveridad", true);
            ComboBox cmbFiltro;

            if (existentes.Length > 0)
            {
                cmbFiltro = (ComboBox)existentes[0];
            }
            else
            {
                Label lblFiltro = new Label
                {
                    Text = "Tipo de Severidad:",
                    Location = new System.Drawing.Point(20, 52), 
                    AutoSize = true,
                    Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold)
                };
                this.Controls.Add(lblFiltro);

                cmbFiltro = new ComboBox 
                {
                    Name = "cmbFiltroSeveridad",
                    Location = new System.Drawing.Point(170, 52),
                    Size = new System.Drawing.Size(150, 25),
                    DropDownStyle = ComboBoxStyle.DropDownList,
                    Font = new System.Drawing.Font("Segoe UI", 9F)
                };

                cmbFiltro.Items.Add("Todos"); 
                foreach (var name in Enum.GetNames(typeof(SeveridadLog)))
                {
                    cmbFiltro.Items.Add(name);
                }
                cmbFiltro.SelectedIndex = 0;

                cmbFiltro.SelectedIndexChanged += (sender, e) => ConfigurarGrid();
                this.Controls.Add(cmbFiltro);
            }
            return cmbFiltro;
        }
        #endregion

        #region Estilos Visuales de Controles
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
                Location = new Point(20, 213), 
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

        private void FormatearColumnas()
        {
            if (_dgv.Columns.Count == 0) return;

            if (_dgv.Columns["FechaUTC"] != null) _dgv.Columns["FechaUTC"].HeaderText = "Fecha";
            if (_dgv.Columns["Usuario_ID"] != null) _dgv.Columns["Usuario_ID"].HeaderText = "ID Usu.";
            if (_dgv.Columns["Usuario_Username"] != null) _dgv.Columns["Usuario_Username"].HeaderText = "Usuario";
            if (_dgv.Columns["Accion"] != null) _dgv.Columns["Accion"].HeaderText = "Acción";
            if (_dgv.Columns["Severidad"] != null) _dgv.Columns["Severidad"].HeaderText = "Severidad";
            if (_dgv.Columns["Mensaje"] != null) _dgv.Columns["Mensaje"].HeaderText = "Mensaje";
            if (_dgv.Columns["Detalle"] != null) _dgv.Columns["Detalle"].Visible = false;
            if (_dgv.Columns["Origen"] != null) _dgv.Columns["Origen"].HeaderText = "Origen";
            if (_dgv.Columns["Host"] != null) _dgv.Columns["Host"].HeaderText = "Host";
            if (_dgv.Columns["IP"] != null) _dgv.Columns["IP"].HeaderText = "Dirección IP";

            _dgv.Columns["FechaUTC"].Width = 130;
            _dgv.Columns["Usuario_ID"].Width = 60;
            _dgv.Columns["Usuario_Username"].Width = 90;
            _dgv.Columns["Severidad"].Width = 80;
            _dgv.Columns["IP"].Width = 90;

            _dgv.Columns["Accion"].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            _dgv.Columns["Mensaje"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }
        #endregion

        #region Windows Form Designer Generated Code 
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.cambiarClaveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cerrarSesionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bitacoraToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.verBitácoraToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cambiarClaveToolStripMenuItem,
            this.cerrarSesionToolStripMenuItem,
            this.bitacoraToolStripMenuItem});
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
            // bitacoraToolStripMenuItem
            // 
            this.bitacoraToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.verBitácoraToolStripMenuItem});
            this.bitacoraToolStripMenuItem.Name = "bitacoraToolStripMenuItem";
            this.bitacoraToolStripMenuItem.Size = new System.Drawing.Size(62, 20);
            this.bitacoraToolStripMenuItem.Text = "Bitacora";
            this.bitacoraToolStripMenuItem.Click += new System.EventHandler(this.bitacoraToolStripMenuItem_Click);
            // 
            // verBitácoraToolStripMenuItem
            // 
            this.verBitácoraToolStripMenuItem.Name = "verBitácoraToolStripMenuItem";
            this.verBitácoraToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.verBitácoraToolStripMenuItem.Text = "Ver bitácora";
            this.verBitácoraToolStripMenuItem.Click += new System.EventHandler(this.verBitácoraToolStripMenuItem_Click);
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
        #endregion
    }
}