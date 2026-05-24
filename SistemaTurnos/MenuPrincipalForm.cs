using Servicios;
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
            this.Load += new System.EventHandler(this.MenuPrincipal_Load);
        }
        private AuthService authService = new AuthService();

        private void InitializeComponent()
        {
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(287, 12);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(130, 46);
            this.button2.TabIndex = 6;
            this.button2.Text = "Cerrar sesión";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click_1);
            // 
            // MenuPrincipalForm
            // 
            this.ClientSize = new System.Drawing.Size(429, 350);
            this.Controls.Add(this.button2);
            this.Name = "MenuPrincipalForm";
            this.ResumeLayout(false);

        }

        private Button button2;

        private void MenuPrincipal_Load(object sender, EventArgs e)
        {
            ConfigurarEstilo();
        }

        private void ConfigurarEstilo()
        {
            this.BackColor = Color.FromArgb(190, 220, 230);
            this.Size = new Size(450, 500);
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Text = "Sistema Sagrado Corazón - Menu principal";

            button2.FlatStyle = FlatStyle.Flat;
            button2.FlatAppearance.BorderSize = 1;
            button2.BackColor = Color.FromArgb(160, 215, 190);
            button2.ForeColor = Color.FromArgb(40, 50, 55);
            button2.FlatAppearance.BorderColor = Color.FromArgb(0, 102, 102);
            button2.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            button2.Cursor = Cursors.Hand;
        }

        private void button2_Click_1(object sender, EventArgs e)
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
    }
}
