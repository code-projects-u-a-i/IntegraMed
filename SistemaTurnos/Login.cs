using BE;
using BLL.Servicios;
using SistemaTurnos;
using System;
using System.Configuration;
using System.Drawing;
using System.Windows.Forms;
using Seguridad;
using BLL;
using System.Collections.Generic;

namespace SistemaTurnosUI
{/// <summary>
/// entrada de la app, selecciona idioma y login
/// </summary>
    public partial class Login : Form, IIdiomaObserver
    {
        private ComboBox cmbIdiomas;
        private Label lblSeleccioneIdioma;
        private AuthService authService = new AuthService();
        private IdiomaBL IdiomaBL = new IdiomaBL();
        public Login()
        {
            InitializeComponent();
            
            #region Registrar Idioma
            IdiomaService.Suscribir(this);
            #endregion
        }


        private void Login_Load(object sender, EventArgs e)
        {
            ConfigurarEstilo();
            ConfigurarSelectorIdioma();
        }
   

        #region Eventos de Controles (Actions)
        //iniciar sesion
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Length > 0 && textBox2.Text.Length > 0)
            {
                try
                {
                    var result = authService.Login(textBox1.Text, textBox2.Text, Convert.ToInt32(cmbIdiomas.SelectedValue));

                    ManejarResult(result);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Debe ingresar usuario y contraseña para continuar");
            }
        }

        private void CmbIdiomas_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (cmbIdiomas.SelectedIndex != -1)
            {
                string idiomaSeleccionado = cmbIdiomas.SelectedItem.ToString();
                // cambio idioma segun seleccion
                IdiomaService.CambiarIdioma(Convert.ToInt32(cmbIdiomas.SelectedValue));
                // esconder seleccion y visibilizar el login
                cmbIdiomas.Visible = false;
                panelLogin.Visible = true;
            }

        }

        #endregion

        #region Implementación del Patrón Observer (IIdiomaObserver)

        public void UpdateIdioma(Dictionary<string, string> traducciones)
        {
            if (this.Tag != null && traducciones.ContainsKey(this.Tag.ToString()))
            {
                this.Text = traducciones[this.Tag.ToString()];
            }

            TraducirControlesRecursivo(this, traducciones);
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

        
        private void ManejarResult(LoginResult result)
        {
            switch (result)
            {
                case LoginResult.Exito:
                    MessageBox.Show("¡Bienvenido al sistema!", "Inicio de Sesión", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Hide();
                    MenuPrincipalForm menuForm = new MenuPrincipalForm(Convert.ToInt32(cmbIdiomas.SelectedValue));
                    menuForm.ShowDialog();
                    this.Close();

                    break;

                case LoginResult.CredencialesInvalidas:
                    MessageBox.Show("Usuario o contraseña incorrectos. Por favor, intente nuevamente.", "Error de Autenticación", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    textBox2.Clear();
                    textBox2.Focus();
                    break;

                case LoginResult.UsuarioBloqueado:
                    MessageBox.Show("Esta cuenta se encuentra bloqueada por superar el límite de intentos fallidos. Contacte al administrador.", "Cuenta Bloqueada", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;

                case LoginResult.UsuarioNoEncontrado:
                    MessageBox.Show("Usuario o contraseña incorrectos.", "Error de Autenticación", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;

                default:
                    MessageBox.Show("Ocurrió un estado inesperado durante el inicio de sesión.", "Error Desconocido", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }

 




        #region Inicialización y Estilos de Interfaz (UI)
        private void ConfigurarSelectorIdioma()
        {

            
            lblSeleccioneIdioma = new Label();
            lblSeleccioneIdioma.Text = "Seleccione su idioma / Select your language:";
            lblSeleccioneIdioma.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            lblSeleccioneIdioma.ForeColor = Color.FromArgb(40, 50, 55);
            lblSeleccioneIdioma.AutoSize = true;
            lblSeleccioneIdioma.Location = new Point((this.ClientSize.Width - 300) / 2, 160);
            this.Controls.Add(lblSeleccioneIdioma);

            
            cmbIdiomas = new ComboBox();
            cmbIdiomas.DropDownStyle = ComboBoxStyle.DropDownList;
            cmbIdiomas.Font = new Font("Segoe UI", 11);
            cmbIdiomas.Size = new Size(200, 30);
            cmbIdiomas.Location = new Point((this.ClientSize.Width - 200) / 2, 190);      

            cmbIdiomas.DataSource = null;
            cmbIdiomas.DataSource = IdiomaBL.Obtener();
            cmbIdiomas.DisplayMember = "Nombre";
            cmbIdiomas.ValueMember = "Id";
            cmbIdiomas.SelectedIndex = -1;

            cmbIdiomas.SelectedIndexChanged += CmbIdiomas_SelectedIndexChanged;
            this.Controls.Add(cmbIdiomas);

            panelLogin.Visible = false;

            // Esta línea le ordena a Windows Forms: "Terminá de renderizar los controles nuevos, 
            // y un milisegundo después, poné el combo en blanco sin disparar errores"
            this.BeginInvoke((MethodInvoker)delegate {
                cmbIdiomas.SelectedIndex = -1;
            });
        }

        private void ConfigurarEstilo()
        {

            this.BackColor = Color.FromArgb(190, 220, 230);
            this.Size = new Size(450, 500);
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;


            panelLogin.BackColor = Color.FromArgb(40, 50, 55);
            panelLogin.Size = new Size(350, 400);
            panelLogin.BorderStyle = BorderStyle.None;


            panelLogin.Location = new Point(
                (this.ClientSize.Width - panelLogin.Width) / 2,
                (this.ClientSize.Height - panelLogin.Height) / 2
            );


            label3.ForeColor = Color.White;
            label3.Font = new Font("Segoe UI", 16, FontStyle.Bold);

            label4.ForeColor = Color.FromArgb(170, 185, 190);
            label4.Font = new Font("Segoe UI", 9, FontStyle.Regular);

            label1.ForeColor = Color.FromArgb(160, 215, 190);
            label1.Font = new Font("Segoe UI", 9, FontStyle.Bold);

            label2.ForeColor = Color.FromArgb(160, 215, 190);
            label2.Font = new Font("Segoe UI", 9, FontStyle.Bold);


            textBox1.BackColor = Color.FromArgb(43, 54, 59);
            textBox1.ForeColor = Color.FromArgb(160, 215, 190);
            textBox1.Font = new Font("Segoe UI", 11);
            textBox1.BorderStyle = BorderStyle.FixedSingle;

            textBox2.BackColor = Color.FromArgb(43, 54, 59);
            textBox2.ForeColor = Color.FromArgb(160, 215, 190);
            textBox2.Font = new Font("Segoe UI", 11);
            textBox2.BorderStyle = BorderStyle.FixedSingle;
            textBox2.UseSystemPasswordChar = true;


            button1.FlatStyle = FlatStyle.Flat;
            button1.FlatAppearance.BorderSize = 1;
            button1.BackColor = Color.FromArgb(160, 215, 190);
            button1.ForeColor = Color.FromArgb(40, 50, 55);
            button1.FlatAppearance.BorderColor = Color.FromArgb(0, 102, 102);
            button1.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            button1.Cursor = Cursors.Hand;


            this.AcceptButton = button1;
        }
        #endregion

    }
}
