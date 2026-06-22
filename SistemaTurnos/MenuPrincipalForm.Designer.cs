namespace SistemaTurnos
{
    partial class MenuPrincipalForm
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.usuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cerrarSesionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cambiarClaveToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.bitacoraToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.gestiónDeUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestiónDePerfilesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.desbloqueoDeUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.accionesDeUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.usuarioToolStripMenuItem,
            this.bitacoraToolStripMenuItem1,
            this.cambiarClaveToolStripMenuItem1,
            this.cerrarSesionToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1906, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // usuarioToolStripMenuItem
            // 
            this.usuarioToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gestiónDeUsuariosToolStripMenuItem,
            this.gestiónDePerfilesToolStripMenuItem});
            this.usuarioToolStripMenuItem.Name = "usuarioToolStripMenuItem";
            this.usuarioToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.usuarioToolStripMenuItem.Text = "Usuario";
            // 
            // cerrarSesionToolStripMenuItem
            // 
            this.cerrarSesionToolStripMenuItem.Name = "cerrarSesionToolStripMenuItem";
            this.cerrarSesionToolStripMenuItem.Size = new System.Drawing.Size(88, 20);
            this.cerrarSesionToolStripMenuItem.Text = "Cerrar Sesion";
            this.cerrarSesionToolStripMenuItem.Click += new System.EventHandler(this.cerrarSesionToolStripMenuItem_Click);
            // 
            // cambiarClaveToolStripMenuItem1
            // 
            this.cambiarClaveToolStripMenuItem1.Name = "cambiarClaveToolStripMenuItem1";
            this.cambiarClaveToolStripMenuItem1.Size = new System.Drawing.Size(96, 20);
            this.cambiarClaveToolStripMenuItem1.Text = "Cambiar Clave";
            this.cambiarClaveToolStripMenuItem1.Click += new System.EventHandler(this.cambiarClaveToolStripMenuItem1_Click);
            // 
            // bitacoraToolStripMenuItem1
            // 
            this.bitacoraToolStripMenuItem1.Name = "bitacoraToolStripMenuItem1";
            this.bitacoraToolStripMenuItem1.Size = new System.Drawing.Size(62, 20);
            this.bitacoraToolStripMenuItem1.Text = "Bitacora";
            this.bitacoraToolStripMenuItem1.Click += new System.EventHandler(this.bitacoraToolStripMenuItem1_Click);
            // 
            // gestiónDeUsuariosToolStripMenuItem
            // 
            this.gestiónDeUsuariosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.accionesDeUsuarioToolStripMenuItem,
            this.desbloqueoDeUsuarioToolStripMenuItem});
            this.gestiónDeUsuariosToolStripMenuItem.Name = "gestiónDeUsuariosToolStripMenuItem";
            this.gestiónDeUsuariosToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.gestiónDeUsuariosToolStripMenuItem.Text = "Gestión de Usuarios";
            // 
            // gestiónDePerfilesToolStripMenuItem
            // 
            this.gestiónDePerfilesToolStripMenuItem.Name = "gestiónDePerfilesToolStripMenuItem";
            this.gestiónDePerfilesToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.gestiónDePerfilesToolStripMenuItem.Text = "Gestión de Perfiles";
            this.gestiónDePerfilesToolStripMenuItem.Click += new System.EventHandler(this.gestiónDePerfilesToolStripMenuItem_Click);
            // 
            // desbloqueoDeUsuarioToolStripMenuItem
            // 
            this.desbloqueoDeUsuarioToolStripMenuItem.Name = "desbloqueoDeUsuarioToolStripMenuItem";
            this.desbloqueoDeUsuarioToolStripMenuItem.Size = new System.Drawing.Size(196, 22);
            this.desbloqueoDeUsuarioToolStripMenuItem.Text = "Desbloqueo de Usuario";
            // 
            // accionesDeUsuarioToolStripMenuItem
            // 
            this.accionesDeUsuarioToolStripMenuItem.Name = "accionesDeUsuarioToolStripMenuItem";
            this.accionesDeUsuarioToolStripMenuItem.Size = new System.Drawing.Size(196, 22);
            this.accionesDeUsuarioToolStripMenuItem.Text = "Acciones de Usuario";
            // 
            // MenuPrincipalForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1906, 852);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MenuPrincipalForm";
            this.Text = "MenuForm";
            this.Load += new System.EventHandler(this.MenuForm_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem usuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cerrarSesionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cambiarClaveToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem bitacoraToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem gestiónDeUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestiónDePerfilesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem desbloqueoDeUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem accionesDeUsuarioToolStripMenuItem;
    }
}