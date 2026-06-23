namespace SistemaTurnos
{
    partial class AdministrarPerfilesForm
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
            this.groupBoxArbolEdicion = new System.Windows.Forms.GroupBox();
            this.lblEditar = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.btnEditar = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.treeViewPerfilesPosibles = new System.Windows.Forms.TreeView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.rbFamilia = new System.Windows.Forms.RadioButton();
            this.rbPerfilSimple = new System.Windows.Forms.RadioButton();
            this.label2 = new System.Windows.Forms.Label();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnGuardarPerfil = new System.Windows.Forms.Button();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.groupBoxArbolEdicion.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBoxArbolEdicion
            // 
            this.groupBoxArbolEdicion.Controls.Add(this.lblEditar);
            this.groupBoxArbolEdicion.Controls.Add(this.textBox1);
            this.groupBoxArbolEdicion.Controls.Add(this.btnEditar);
            this.groupBoxArbolEdicion.Controls.Add(this.button1);
            this.groupBoxArbolEdicion.Controls.Add(this.treeViewPerfilesPosibles);
            this.groupBoxArbolEdicion.Location = new System.Drawing.Point(141, 30);
            this.groupBoxArbolEdicion.Name = "groupBoxArbolEdicion";
            this.groupBoxArbolEdicion.Size = new System.Drawing.Size(402, 325);
            this.groupBoxArbolEdicion.TabIndex = 7;
            this.groupBoxArbolEdicion.TabStop = false;
            this.groupBoxArbolEdicion.Text = "Perfiles para elegir";
            // 
            // lblEditar
            // 
            this.lblEditar.AutoSize = true;
            this.lblEditar.Location = new System.Drawing.Point(18, 222);
            this.lblEditar.Name = "lblEditar";
            this.lblEditar.Size = new System.Drawing.Size(44, 13);
            this.lblEditar.TabIndex = 11;
            this.lblEditar.Text = "Nombre";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(18, 241);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(361, 20);
            this.textBox1.TabIndex = 10;
            // 
            // btnEditar
            // 
            this.btnEditar.Location = new System.Drawing.Point(226, 280);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.btnEditar.Size = new System.Drawing.Size(153, 23);
            this.btnEditar.TabIndex = 9;
            this.btnEditar.Text = "Editar Perfil";
            this.btnEditar.UseVisualStyleBackColor = true;
            this.btnEditar.Click += new System.EventHandler(this.btnEditar_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(18, 280);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(153, 23);
            this.button1.TabIndex = 8;
            this.button1.Text = "Eliminar Perfil";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // treeViewPerfilesPosibles
            // 
            this.treeViewPerfilesPosibles.Location = new System.Drawing.Point(18, 19);
            this.treeViewPerfilesPosibles.Name = "treeViewPerfilesPosibles";
            this.treeViewPerfilesPosibles.Size = new System.Drawing.Size(361, 190);
            this.treeViewPerfilesPosibles.TabIndex = 1;
            this.treeViewPerfilesPosibles.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeViewPerfilesPosibles_AfterSelect);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbFamilia);
            this.groupBox1.Controls.Add(this.txtNombre);
            this.groupBox1.Controls.Add(this.btnGuardarPerfil);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.btnLimpiar);
            this.groupBox1.Controls.Add(this.rbPerfilSimple);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(141, 376);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(402, 151);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Nuevo Perfil";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Nombre";
            // 
            // rbFamilia
            // 
            this.rbFamilia.AutoSize = true;
            this.rbFamilia.Location = new System.Drawing.Point(270, 77);
            this.rbFamilia.Name = "rbFamilia";
            this.rbFamilia.Size = new System.Drawing.Size(98, 17);
            this.rbFamilia.TabIndex = 17;
            this.rbFamilia.TabStop = true;
            this.rbFamilia.Text = "Familia de Perfil";
            this.rbFamilia.UseVisualStyleBackColor = true;
            // 
            // rbPerfilSimple
            // 
            this.rbPerfilSimple.AutoSize = true;
            this.rbPerfilSimple.Location = new System.Drawing.Point(112, 77);
            this.rbPerfilSimple.Name = "rbPerfilSimple";
            this.rbPerfilSimple.Size = new System.Drawing.Size(82, 17);
            this.rbPerfilSimple.TabIndex = 16;
            this.rbPerfilSimple.TabStop = true;
            this.rbPerfilSimple.Text = "Perfil Simple";
            this.rbPerfilSimple.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(18, 77);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(31, 13);
            this.label2.TabIndex = 15;
            this.label2.Text = "Tipo:";
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Location = new System.Drawing.Point(18, 111);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(153, 23);
            this.btnLimpiar.TabIndex = 14;
            this.btnLimpiar.Text = "Limipiar";
            this.btnLimpiar.UseVisualStyleBackColor = true;
            this.btnLimpiar.Click += new System.EventHandler(this.btnLimpiar_Click);
            // 
            // btnGuardarPerfil
            // 
            this.btnGuardarPerfil.Location = new System.Drawing.Point(226, 111);
            this.btnGuardarPerfil.Name = "btnGuardarPerfil";
            this.btnGuardarPerfil.Size = new System.Drawing.Size(153, 23);
            this.btnGuardarPerfil.TabIndex = 13;
            this.btnGuardarPerfil.Text = "Agregar";
            this.btnGuardarPerfil.UseVisualStyleBackColor = true;
            this.btnGuardarPerfil.Click += new System.EventHandler(this.btnGuardarPerfil_Click);
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(18, 44);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(361, 20);
            this.txtNombre.TabIndex = 12;
            // 
            // EliminarPerfilesForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(696, 552);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBoxArbolEdicion);
            this.Name = "EliminarPerfilesForm";
            this.Text = "EliminarPerfilesForm";
            this.groupBoxArbolEdicion.ResumeLayout(false);
            this.groupBoxArbolEdicion.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBoxArbolEdicion;
        private System.Windows.Forms.TreeView treeViewPerfilesPosibles;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Label lblEditar;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RadioButton rbFamilia;
        private System.Windows.Forms.RadioButton rbPerfilSimple;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.Button btnGuardarPerfil;
        private System.Windows.Forms.TextBox txtNombre;
    }
}