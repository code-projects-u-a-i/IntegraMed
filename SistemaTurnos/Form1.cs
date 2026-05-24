using Servicios;
using BE;
using System;
using System.Configuration;
using System.Drawing;
using System.Windows.Forms;

namespace SistemaTurnosUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            this.Load += new System.EventHandler(this.Form1_Load);
        }
        private AuthService authService = new AuthService();

        private void Form1_Load(object sender, EventArgs e)
        {
            ConfigurarEstilo();
        }
        //iniciar sesion
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Length > 0 && textBox2.Text.Length > 0)
            {
                try
                {
                    var result = authService.Login(textBox1.Text, textBox2.Text);

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

        private void ManejarResult(LoginResult result)
        {
            switch (result)
            {
                case LoginResult.Exito:
                    MessageBox.Show("¡Bienvenido al sistema!", "Inicio de Sesión", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    this.Hide();
                    MenuPrincipalForm menu = new MenuPrincipalForm();
                    menu.ShowDialog();
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

        private void ConfigurarEstilo()
        {

            this.BackColor = Color.FromArgb(190, 220, 230);
            this.Size = new Size(450, 500);
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema de Gestión de Salud - Ingreso";


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
    }
}
