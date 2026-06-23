using BE;
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

namespace SistemaTurnos
{
    public partial class IdiomaForm : Form
    {
        IdiomaBL idiomaBL = new IdiomaBL();
        public IdiomaForm()
        {
            InitializeComponent();
        }

        private void IdiomaForm_Load(object sender, EventArgs e)
        {
            CargarTarjetasDeIdioma();
        }
        private void CargarTarjetasDeIdioma()
        {
            flpTarjetas.Controls.Clear();

            List<Idioma> listaIdiomas = idiomaBL.Obtener();

            foreach (Idioma idioma in listaIdiomas)
            {
               
                Button btnCard = new Button();

                btnCard.Text = idioma.Nombre.ToUpper(); 
                btnCard.Size = new Size(160, 100);      
                btnCard.Font = new Font("Segoe UI", 11, FontStyle.Bold);
                btnCard.Cursor = Cursors.Hand;

                btnCard.FlatStyle = FlatStyle.Flat;
                btnCard.BackColor = Color.FromArgb(40, 50, 55); 
                btnCard.ForeColor = Color.FromArgb(160, 215, 190); 
                btnCard.FlatAppearance.BorderSize = 1;
                btnCard.FlatAppearance.BorderColor = Color.FromArgb(160, 215, 190);

                btnCard.Tag = idioma.Id;

                btnCard.Click += BotonCardIdioma_Click;

                flpTarjetas.Controls.Add(btnCard);
            }
        }
        private void BotonCardIdioma_Click(object sender, EventArgs e)
        {
            Button botonPresionado = (Button)sender;

            int idIdioma = Convert.ToInt32(botonPresionado.Tag);

            IdiomaService.CambiarIdioma(idIdioma);

            
        }
    }
}
