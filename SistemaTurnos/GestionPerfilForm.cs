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
    public partial class GestionPerfilForm : Form
    {
        private AdministrarPermisosService admPermisosService = new AdministrarPermisosService();
        public GestionPerfilForm()
        {
            InitializeComponent();
            SetearEstilos();
            ActualizarTreeView();
            ActualizarTreeViewFamilias();
        }

        private void ActualizarTreeViewFamilias()
        {
            treeViewFamilias.Nodes.Clear();

            // familias "Raíz" (las que no son hijas de nadie)
            List<Perfil> familiasRaiz = admPermisosService.ObtenerFamiliasRaiz();

            foreach (var f in familiasRaiz)
            {
                TreeNode nodoRaiz = new TreeNode(f.Nombre);
                nodoRaiz.Tag = f; 
                treeViewFamilias.Nodes.Add(nodoRaiz);

                // cargamos los hijos con info de la base de datos de forma recursiva
                CargarHijosRecursivos(nodoRaiz, (Familia)f);
            }
        }

        private void CargarHijosRecursivos(TreeNode nodoPadre, Familia familiaPadre)
        {
            // Buscamos los hijos de esta familia en la BD 
            List<Perfil> hijos = admPermisosService.ObtenerHijosDeFamilia(familiaPadre.Id);

            foreach (var hijo in hijos)
            {
                familiaPadre.AgregarHijo(hijo);

                TreeNode nodoHijo = new TreeNode(hijo.Nombre);
                nodoHijo.Tag = hijo;
                nodoPadre.Nodes.Add(nodoHijo);

                // Si el hijo es otra familia, se carga de forma recursiva
                if (hijo is Familia subFamilia)
                {
                    CargarHijosRecursivos(nodoHijo, subFamilia);
                }
            }
        }

        private void ActualizarTreeView()
        {
            treeViewFamilias.Nodes.Clear();

            // Traemos de la BD solo los perfiles raíz (las Familias principales)
            List<Perfil> listaRaiz = admPermisosService.ObtenerTodasFamilias();

            foreach (var p in listaRaiz)
            {
                TreeNode nodo = new TreeNode(p.Nombre);
                nodo.Tag = p; 
                treeViewFamilias.Nodes.Add(nodo);

                if (p is Familia f)
                {
                    // Llamás a tu función recursiva para que le busque los hijos en la BD
                    MostrarHijosEnArbol(nodo, f);
                }
            }
        }

        private void MostrarHijosEnArbol(TreeNode nodo, Perfil f)
        {
            foreach (var hijo in f.ObtenerPerfiles())
            {
                TreeNode nodoHijo = new TreeNode(hijo.Nombre);

                nodoHijo.Tag = hijo;
                // agrego hijo en el padre
                nodo.Nodes.Add(nodoHijo);

                // si el hijo es familia se llama recursivamente
                if (hijo is Familia subFamilia)
                {
                    MostrarHijosEnArbol(nodoHijo, subFamilia);
                }
            }
        }


        private void treeViewFamilias_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (treeViewFamilias.SelectedNode != null)
            {
                Perfil perfilSeleccionado = (Perfil)treeViewFamilias.SelectedNode.Tag;

                if (perfilSeleccionado is Familia familiaSeleccionada)
                {
                    ActualizarTreeViewDisponibles(familiaSeleccionada);
                }
            }
        }

        private void ActualizarTreeViewDisponibles(Familia familiaSeleccionadaPadre)
        {
            treeViewPerfilesPosibles.Nodes.Clear();

            List<Perfil> todasLasFamilias = admPermisosService.ObtenerTodasFamilias();
            List<Perfil> todasLasPatentes = admPermisosService.ObtenerTodasPatentes();


            foreach (var f in todasLasFamilias)
            {
                // excluyo a si mismo
                if (f.Id == familiaSeleccionadaPadre.Id) continue;

                // excluyo si ya es hijo directo en ese nivel
                if (familiaSeleccionadaPadre.ObtenerPerfiles().Any(h => h.Id == f.Id)) continue;

                TreeNode nodo = new TreeNode($"📁 {f.Nombre}");
                nodo.Tag = f;
                treeViewPerfilesPosibles.Nodes.Add(nodo);
            }

            // Listar Patentes Disponibles 
            foreach (var p in todasLasPatentes)
            {
                // excluyo a si mismo
                if (familiaSeleccionadaPadre.ObtenerPerfiles().Any(h => h.Id == p.Id)) continue;

                TreeNode nodo = new TreeNode($"📄 {p.Nombre}");
                nodo.Tag = p;
                treeViewPerfilesPosibles.Nodes.Add(nodo);
            }
        }




        private void SetearEstilos()
        {
            // ==========================================
            // 1. PALETA DE COLORES (Definición)
            // ==========================================
            Color fondoOscuroPrincipal = Color.FromArgb(38, 50, 56);   // #263238
            Color fondoControles = Color.FromArgb(55, 71, 79);         // #37474F
            Color turquesaPrincipal = Color.FromArgb(78, 205, 171);    // #4ECDAB
            Color textoClaro = Color.FromArgb(236, 240, 241);          // #ECF0F1
            Color textoGrisBotonSecundario = Color.FromArgb(127, 140, 141); // #7F8C8D

            // Fuentes
            Font fuenteLabels = new Font("Segoe UI", 9.75F, FontStyle.Regular);
            Font fuenteBotones = new Font("Segoe UI", 9.75F, FontStyle.Bold);

            // ==========================================
            // 2. FORMULARIO PRINCIPAL
            // ==========================================
            this.BackColor = fondoOscuroPrincipal;
            this.ForeColor = textoClaro;

            // ==========================================
            // 3. GROUPBOXES (Contenedores)
            // ==========================================
            // Nota: Cambiá los nombres por los que tengan tus GroupBoxes reales
            var groupBoxes = new GroupBox[] { groupBoxArbol, groupBoxArbolEdicion };
            foreach (var gb in groupBoxes)
            {
                if (gb != null)
                {
                    gb.ForeColor = turquesaPrincipal; // Tiñe el título del GroupBox en turquesa
                    gb.Font = fuenteLabels;
                }
            }

            // ==========================================
            // 4. COMPONENTES DE ENTRADA Y VISTAS (Inputs, Listas, Árbol)
            // ==========================================
            // Árbol (TreeView)
            if (treeViewFamilias != null)
            {
                treeViewFamilias.BackColor = fondoControles;
                treeViewFamilias.ForeColor = textoClaro;
                treeViewFamilias.LineColor = turquesaPrincipal; // Color de las líneas del árbol
                treeViewFamilias.BorderStyle = BorderStyle.FixedSingle;
            }

            // Lista (ListBox)
            if (treeViewPerfilesPosibles != null)
            {
                treeViewPerfilesPosibles.BackColor = fondoControles;
                treeViewPerfilesPosibles.ForeColor = textoClaro;
                treeViewPerfilesPosibles.LineColor = turquesaPrincipal; // Color de las líneas del árbol
                treeViewPerfilesPosibles.BorderStyle = BorderStyle.FixedSingle;
            }

            // ==========================================
            // 5. BOTONES PRINCIPALES (Estilo "Actualizar Contraseña")
            // ==========================================
            var botonesPrincipales = new Button[] { btnAgregarHijo };
            foreach (var btn in botonesPrincipales)
            {
                if (btn != null)
                {
                    btn.FlatStyle = FlatStyle.Flat;
                    btn.FlatAppearance.BorderSize = 0;
                    btn.BackColor = turquesaPrincipal;
                    btn.ForeColor = fondoOscuroPrincipal; // Texto oscuro para que contraste con el turquesa
                    btn.Font = fuenteBotones;
                }
            }

            // ==========================================
            // 6. BOTONES SECUNDARIOS (Estilo "Cancelar")
            // ==========================================
            var botonesSecundarios = new Button[] { btnQuitarHijo };
            foreach (var btn in botonesSecundarios)
            {
                if (btn != null)
                {
                    btn.FlatStyle = FlatStyle.Flat;
                    btn.FlatAppearance.BorderSize = 1;
                    btn.FlatAppearance.BorderColor = textoClaro; // Borde fino claro
                    btn.BackColor = fondoOscuroPrincipal;        // Fondo igual al del formulario
                    btn.ForeColor = textoGrisBotonSecundario;    // Texto gris apagado
                    btn.Font = fuenteBotones;
                }
            }
        }

        private void btnAgregarHijo_Click(object sender, EventArgs e)
        {
            // valida seleccion
            if (treeViewFamilias.SelectedNode == null || treeViewPerfilesPosibles.SelectedNode == null)
            {
                MessageBox.Show("Debe seleccionar un elemento del sector de la derecha y uno de la izquierda", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // si agrega un perfil, el perfil contenedor debe ser una familia
            Perfil perfilPadre = (Perfil)treeViewFamilias.SelectedNode.Tag;
            if (!(perfilPadre is Familia familiaPadre))
            {
                MessageBox.Show("El elemento seleccionado en la izquierda debe ser de tipo Familia para poder contener hijos.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            Perfil componenteHijo = (Perfil)treeViewPerfilesPosibles.SelectedNode.Tag;
         
            try
            {
                if (componenteHijo is Familia subFamilia && !subFamilia.ObtenerPerfiles().Any())
                {
                    List<Perfil> hijosDelHijoBD = admPermisosService.ObtenerHijosDeFamilia(subFamilia.Id);
                    
                    foreach (var h in hijosDelHijoBD)
                    {
                        subFamilia.AgregarHijo(h);
                    }
                }
                    
                admPermisosService.AgregarHijoAFamilia(familiaPadre, componenteHijo);

                MessageBox.Show($"'{componenteHijo.Nombre}' fue agregado con éxito a '{familiaPadre.Nombre}'.", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);

                ActualizarTreeViewFamilias(); // Refresca Sector A
                ActualizarTreeViewDisponibles(familiaPadre); // Refresca Sector B 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnQuitarHijo_Click(object sender, EventArgs e)
        {
            if (treeViewFamilias.SelectedNode == null)
            {
                MessageBox.Show("Seleccione el componente hijo que desea quitar.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            TreeNode nodoSeleccionado = treeViewFamilias.SelectedNode;

            if (nodoSeleccionado.Parent == null)
            {
                MessageBox.Show("No se puede quitar este elemento porque es un Rol Raíz y no depende de nadie.", "Operación Inválida", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            Perfil componenteHijo = (Perfil)nodoSeleccionado.Tag;
            Familia familiaPadre = (Familia)nodoSeleccionado.Parent.Tag;

            try
            {
                admPermisosService.QuitarHijoDeFamilia(familiaPadre.Id, componenteHijo.Id);

                MessageBox.Show($"Se desvinculó '{componenteHijo.Nombre}' de la familia '{familiaPadre.Nombre}'.", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);

                ActualizarTreeViewFamilias(); // Refresca Sector A

                Familia padreActualizado = null;
                foreach (TreeNode node in treeViewFamilias.Nodes)
                {
                    if (((Perfil)node.Tag).Id == familiaPadre.Id)
                    {
                        padreActualizado = (Familia)node.Tag;
                        break;
                    }
                }
                if (padreActualizado != null)
                {
                    ActualizarTreeViewDisponibles(padreActualizado);
                }
                else
                {
                    // Si el padre no era raíz, limpie el Sector B para evitar estados inconsistentes
                    treeViewPerfilesPosibles.Nodes.Clear();
                }

               
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al desvincular componentes: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
