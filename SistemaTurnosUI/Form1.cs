using BL;
using Servicios;

namespace SistemaTurnosUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Length > 0 && textBox2.Text.Length > 0)
            {
                Usuario usuario = new Usuario();
                usuario.Id = 1;
                usuario.Nombre = textBox1.Text;
                usuario.password = textBox2.Text;

                SesionSingleton.getInstance().Login(usuario);
                MessageBox.Show("Ingreso OK, hola " + textBox1.Text);
            }
            else
            {
                MessageBox.Show("Debe ingresar usuario y contraseña para continuar");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
           if( SesionSingleton.getInstance().EstaLogueado())
           {
                SesionSingleton.getInstance().Logout();
                MessageBox.Show("Salio OK");
            }
            else
            {
                MessageBox.Show("No ingresó con el usuario y contraseña, para salir, primero debe ingresar");
            }
        }
    }
}
