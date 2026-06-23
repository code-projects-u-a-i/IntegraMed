using BLL;
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
    public partial class RegistrarseForm : Form
    {
        public RegistrarseForm()
        {
            InitializeComponent();
            this.Load += new System.EventHandler(this.RegistrarseForm_Load);
        }
        private UsuarioBL usuarioBL = new UsuarioBL();
        private void RegistrarseForm_Load(object sender, EventArgs e)
        {
            ConfigurarEstilo();
        }
        // registrarse
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Length > 0 && textBox2.Text.Length > 0)
            {
                try
                {
                    usuarioBL.CrearUsuario(textBox1.Text, textBox2.Text);
                    MessageBox.Show("¡Usuario creado con Exito!", "Exito", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    this.Hide();
                    Form1 menu = new Form1();
                    menu.ShowDialog();
                    this.Close();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Debe ingresar usuario y contraseña para continuar");
            }
        }
        private void ConfigurarEstilo()
        {

            this.BackColor = Color.FromArgb(190, 220, 230);
            this.Size = new Size(450, 500);
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema Sagrado Corazón- Registrarme";


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
