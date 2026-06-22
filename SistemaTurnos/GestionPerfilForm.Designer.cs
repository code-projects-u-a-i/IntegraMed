namespace SistemaTurnos
{
    partial class GestionPerfilForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.treeViewFamilias = new System.Windows.Forms.TreeView();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.labelNombre = new System.Windows.Forms.Label();
            this.groupBoxArbol = new System.Windows.Forms.GroupBox();
            this.groupBoxAlta = new System.Windows.Forms.GroupBox();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.rbFamilia = new System.Windows.Forms.RadioButton();
            this.rbPerfilSimple = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnGuardarPerfil = new System.Windows.Forms.Button();
            this.btnQuitarHijo = new System.Windows.Forms.Button();
            this.btnAgregarHijo = new System.Windows.Forms.Button();
            this.treeViewPerfilesPosibles = new System.Windows.Forms.TreeView();
            this.groupBoxArbolEdicion = new System.Windows.Forms.GroupBox();
            this.groupBoxArbol.SuspendLayout();
            this.groupBoxAlta.SuspendLayout();
            this.groupBoxArbolEdicion.SuspendLayout();
            this.SuspendLayout();
            // 
            // treeViewFamilias
            // 
            this.treeViewFamilias.Location = new System.Drawing.Point(12, 19);
            this.treeViewFamilias.Name = "treeViewFamilias";
            this.treeViewFamilias.Size = new System.Drawing.Size(386, 400);
            this.treeViewFamilias.TabIndex = 0;
            this.treeViewFamilias.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeViewFamilias_AfterSelect);
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(16, 52);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(342, 20);
            this.txtNombre.TabIndex = 1;
            // 
            // labelNombre
            // 
            this.labelNombre.AutoSize = true;
            this.labelNombre.Location = new System.Drawing.Point(13, 26);
            this.labelNombre.Name = "labelNombre";
            this.labelNombre.Size = new System.Drawing.Size(44, 13);
            this.labelNombre.TabIndex = 2;
            this.labelNombre.Text = "Nombre";
            // 
            // groupBoxArbol
            // 
            this.groupBoxArbol.Controls.Add(this.treeViewFamilias);
            this.groupBoxArbol.Location = new System.Drawing.Point(40, 30);
            this.groupBoxArbol.Name = "groupBoxArbol";
            this.groupBoxArbol.Size = new System.Drawing.Size(414, 442);
            this.groupBoxArbol.TabIndex = 3;
            this.groupBoxArbol.TabStop = false;
            this.groupBoxArbol.Text = "Seleccione el Perfil a Editar";
            // 
            // groupBoxAlta
            // 
            this.groupBoxAlta.Controls.Add(this.btnEliminar);
            this.groupBoxAlta.Controls.Add(this.rbFamilia);
            this.groupBoxAlta.Controls.Add(this.rbPerfilSimple);
            this.groupBoxAlta.Controls.Add(this.label1);
            this.groupBoxAlta.Controls.Add(this.btnLimpiar);
            this.groupBoxAlta.Controls.Add(this.btnGuardarPerfil);
            this.groupBoxAlta.Controls.Add(this.labelNombre);
            this.groupBoxAlta.Controls.Add(this.txtNombre);
            this.groupBoxAlta.Location = new System.Drawing.Point(240, 478);
            this.groupBoxAlta.Name = "groupBoxAlta";
            this.groupBoxAlta.Size = new System.Drawing.Size(637, 143);
            this.groupBoxAlta.TabIndex = 4;
            this.groupBoxAlta.TabStop = false;
            this.groupBoxAlta.Text = "Agregar - Editar Perfil";
            // 
            // btnEliminar
            // 
            this.btnEliminar.Location = new System.Drawing.Point(16, 88);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(175, 33);
            this.btnEliminar.TabIndex = 8;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.UseVisualStyleBackColor = true;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // rbFamilia
            // 
            this.rbFamilia.AutoSize = true;
            this.rbFamilia.Location = new System.Drawing.Point(503, 52);
            this.rbFamilia.Name = "rbFamilia";
            this.rbFamilia.Size = new System.Drawing.Size(98, 17);
            this.rbFamilia.TabIndex = 7;
            this.rbFamilia.TabStop = true;
            this.rbFamilia.Text = "Familia de Perfil";
            this.rbFamilia.UseVisualStyleBackColor = true;
            // 
            // rbPerfilSimple
            // 
            this.rbPerfilSimple.AutoSize = true;
            this.rbPerfilSimple.Location = new System.Drawing.Point(386, 52);
            this.rbPerfilSimple.Name = "rbPerfilSimple";
            this.rbPerfilSimple.Size = new System.Drawing.Size(82, 17);
            this.rbPerfilSimple.TabIndex = 6;
            this.rbPerfilSimple.TabStop = true;
            this.rbPerfilSimple.Text = "Perfil Simple";
            this.rbPerfilSimple.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(383, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(31, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Tipo:";
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Location = new System.Drawing.Point(220, 88);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(176, 33);
            this.btnLimpiar.TabIndex = 4;
            this.btnLimpiar.Text = "Limipiar";
            this.btnLimpiar.UseVisualStyleBackColor = true;
            this.btnLimpiar.Click += new System.EventHandler(this.btnLimpiar_Click);
            // 
            // btnGuardarPerfil
            // 
            this.btnGuardarPerfil.Location = new System.Drawing.Point(425, 88);
            this.btnGuardarPerfil.Name = "btnGuardarPerfil";
            this.btnGuardarPerfil.Size = new System.Drawing.Size(176, 33);
            this.btnGuardarPerfil.TabIndex = 3;
            this.btnGuardarPerfil.Text = "Agregar";
            this.btnGuardarPerfil.UseVisualStyleBackColor = true;
            this.btnGuardarPerfil.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnQuitarHijo
            // 
            this.btnQuitarHijo.Location = new System.Drawing.Point(479, 307);
            this.btnQuitarHijo.Name = "btnQuitarHijo";
            this.btnQuitarHijo.Size = new System.Drawing.Size(179, 66);
            this.btnQuitarHijo.TabIndex = 5;
            this.btnQuitarHijo.Text = ">> Quitar del Perfil Seleccionado";
            this.btnQuitarHijo.UseVisualStyleBackColor = true;
            this.btnQuitarHijo.Click += new System.EventHandler(this.btnQuitarHijo_Click);
            // 
            // btnAgregarHijo
            // 
            this.btnAgregarHijo.Location = new System.Drawing.Point(479, 224);
            this.btnAgregarHijo.Name = "btnAgregarHijo";
            this.btnAgregarHijo.Size = new System.Drawing.Size(179, 66);
            this.btnAgregarHijo.TabIndex = 5;
            this.btnAgregarHijo.Text = "<< Agregar al Perfil Seleccionado";
            this.btnAgregarHijo.UseVisualStyleBackColor = true;
            this.btnAgregarHijo.Click += new System.EventHandler(this.btnAgregarHijo_Click);
            // 
            // treeViewPerfilesPosibles
            // 
            this.treeViewPerfilesPosibles.Location = new System.Drawing.Point(18, 19);
            this.treeViewPerfilesPosibles.Name = "treeViewPerfilesPosibles";
            this.treeViewPerfilesPosibles.Size = new System.Drawing.Size(415, 400);
            this.treeViewPerfilesPosibles.TabIndex = 1;
            // 
            // groupBoxArbolEdicion
            // 
            this.groupBoxArbolEdicion.Controls.Add(this.treeViewPerfilesPosibles);
            this.groupBoxArbolEdicion.Location = new System.Drawing.Point(673, 30);
            this.groupBoxArbolEdicion.Name = "groupBoxArbolEdicion";
            this.groupBoxArbolEdicion.Size = new System.Drawing.Size(456, 442);
            this.groupBoxArbolEdicion.TabIndex = 6;
            this.groupBoxArbolEdicion.TabStop = false;
            this.groupBoxArbolEdicion.Text = "Perfiles posibles de elegir";
            // 
            // GestionPerfilForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1169, 635);
            this.Controls.Add(this.groupBoxArbolEdicion);
            this.Controls.Add(this.btnQuitarHijo);
            this.Controls.Add(this.btnAgregarHijo);
            this.Controls.Add(this.groupBoxAlta);
            this.Controls.Add(this.groupBoxArbol);
            this.Name = "GestionPerfilForm";
            this.Text = "PerfilesForm";
            this.Load += new System.EventHandler(this.GestionPerfilForm_Load);
            this.groupBoxArbol.ResumeLayout(false);
            this.groupBoxAlta.ResumeLayout(false);
            this.groupBoxAlta.PerformLayout();
            this.groupBoxArbolEdicion.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TreeView treeViewFamilias;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label labelNombre;
        private System.Windows.Forms.GroupBox groupBoxArbol;
        private System.Windows.Forms.GroupBox groupBoxAlta;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.Button btnGuardarPerfil;
        private System.Windows.Forms.Button btnQuitarHijo;
        private System.Windows.Forms.Button btnAgregarHijo;
        private System.Windows.Forms.RadioButton rbFamilia;
        private System.Windows.Forms.RadioButton rbPerfilSimple;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.TreeView treeViewPerfilesPosibles;
        private System.Windows.Forms.GroupBox groupBoxArbolEdicion;
    }
}