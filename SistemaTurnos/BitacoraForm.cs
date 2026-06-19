using BE;
using BLL;
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
    public partial class BitacoraForm : Form
    {

        private BitacoraBL bitacoraBL = new BitacoraBL();
        private List<Bitacora> DatosListado { get; set; }
        public BitacoraForm()
        {
            InitializeComponent();
        }

        private void BitacoraForm_Load(object sender, EventArgs e)
        {
            cmbFiltro = FiltroSeveridad();
            CargarDatos();
            ConfigurarGrid();
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

        private ComboBox FiltroSeveridad()
        {      
            cmbFiltro.DropDownStyle = ComboBoxStyle.DropDownList;
            cmbFiltro.Font= new System.Drawing.Font("Segoe UI", 9F);
               

            cmbFiltro.Items.Add("Todos");
            foreach (var name in Enum.GetNames(typeof(SeveridadLog)))
            {
               cmbFiltro.Items.Add(name);
            }
            cmbFiltro.SelectedIndex = 0;

            cmbFiltro.SelectedIndexChanged += (sender, e) => ConfigurarGrid();
            
            return cmbFiltro;
        }

        public void ConfigurarGrid()
        {
            this.StartPosition = FormStartPosition.CenterScreen;
            dgv.AllowUserToAddRows = false;
            dgv.ReadOnly = true;
            dgv.BackgroundColor = System.Drawing.Color.White;
            dgv.RowHeadersVisible = false;
            dgv.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgv.AlternatingRowsDefaultCellStyle.BackColor = System.Drawing.Color.FromArgb(245, 247, 250);

            dgv.EnableHeadersVisualStyles = false;
            dgv.ColumnHeadersDefaultCellStyle.BackColor = System.Drawing.Color.FromArgb(44, 62, 80);
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = System.Drawing.Color.White;
            dgv.ColumnHeadersDefaultCellStyle.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgv.ColumnHeadersHeight = 35;

            string seleccion = cmbFiltro.SelectedItem.ToString();
            if (seleccion == "Todos")
            {
                dgv.DataSource = DatosListado;
            }
            else
            {
                dgv.DataSource = DatosListado.FindAll(x => x.Severidad.HasValue && x.Severidad.Value.ToString() == seleccion);
            }
            FormatearColumnas();
        }

        private void FormatearColumnas()
        {
            if (dgv.Columns.Count == 0) return;

            if (dgv.Columns["FechaUTC"] != null) dgv.Columns["FechaUTC"].HeaderText = "Fecha";
            if (dgv.Columns["Usuario_Username"] != null) dgv.Columns["Usuario_Username"].HeaderText = "Usuario";
            if (dgv.Columns["Accion"] != null) dgv.Columns["Accion"].HeaderText = "Acción";
            if (dgv.Columns["Severidad"] != null) dgv.Columns["Severidad"].HeaderText = "Severidad";
            if (dgv.Columns["Mensaje"] != null) dgv.Columns["Mensaje"].HeaderText = "Mensaje";
            if (dgv.Columns["Detalle"] != null) dgv.Columns["Detalle"].Visible = false;
            if (dgv.Columns["Origen"] != null) dgv.Columns["Origen"].HeaderText = "Origen";
            if (dgv.Columns["Host"] != null) dgv.Columns["Host"].HeaderText = "Host";
            if (dgv.Columns["IP"] != null) dgv.Columns["IP"].HeaderText = "Dirección IP";

            dgv.Columns["FechaUTC"].Width = 130;
            dgv.Columns["Usuario_Username"].Width = 90;
            dgv.Columns["Severidad"].Width = 80;
            dgv.Columns["IP"].Width = 90;

            dgv.Columns["Usuario_ID"].Visible = false;
            dgv.Columns["Accion"].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            dgv.Columns["Mensaje"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }
    }
}
