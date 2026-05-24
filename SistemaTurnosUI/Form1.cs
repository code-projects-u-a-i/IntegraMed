using Servicios;
using BE;
using System;
using System.Configuration;
using Microsoft.Data.SqlClient;

namespace SistemaTurnosUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private AuthService authService = new AuthService();

        private void Form1_Load(object sender, EventArgs e)
        {
                // 1. Leer la cadena del App.config
                string connectionString = ConfigurationManager.ConnectionStrings["ConnString"]?.ConnectionString;

               
        }

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

      

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                authService.Logout();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }


        private void ManejarResult(LoginResult result)
        {
            switch (result)
            {
                case LoginResult.Exito:
                    MessageBox.Show("¡Bienvenido al sistema!", "Inicio de Sesión", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
    }
}
