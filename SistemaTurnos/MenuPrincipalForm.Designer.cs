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
            this.administradorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.modificarMailToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cambiarClaveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.usuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestiónDeUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.desbloqueoDeUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.crearUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.restaurarMailAnteriorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestiónDePerfilesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.eliminarPerfilesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.administrarPerfilesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.asignarPerfilesAUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bitacoraToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionarIdiomaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.seleccionarIdiomaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionarIdiomaToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.restaurarIntegridadDatosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.restaurarIntegridadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cerrarSesionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.administradorToolStripMenuItem,
            this.usuarioToolStripMenuItem,
            this.bitacoraToolStripMenuItem1,
            this.gestionarIdiomaToolStripMenuItem,
            this.restaurarIntegridadDatosToolStripMenuItem,
            this.cerrarSesionToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1700, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // administradorToolStripMenuItem
            // 
            this.administradorToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.modificarMailToolStripMenuItem,
            this.cambiarClaveToolStripMenuItem});
            this.administradorToolStripMenuItem.Name = "administradorToolStripMenuItem";
            this.administradorToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.administradorToolStripMenuItem.Tag = "mpUsuario";
            this.administradorToolStripMenuItem.Text = "Usuario";
            // 
            // modificarMailToolStripMenuItem
            // 
            this.modificarMailToolStripMenuItem.Name = "modificarMailToolStripMenuItem";
            this.modificarMailToolStripMenuItem.Size = new System.Drawing.Size(151, 22);
            this.modificarMailToolStripMenuItem.Text = "Modificar Mail";
            // 
            // cambiarClaveToolStripMenuItem
            // 
            this.cambiarClaveToolStripMenuItem.Name = "cambiarClaveToolStripMenuItem";
            this.cambiarClaveToolStripMenuItem.Size = new System.Drawing.Size(151, 22);
            this.cambiarClaveToolStripMenuItem.Text = "Cambiar Clave";
            this.cambiarClaveToolStripMenuItem.Click += new System.EventHandler(this.cambiarClaveToolStripMenuItem_Click_1);
            // 
            // usuarioToolStripMenuItem
            // 
            this.usuarioToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gestiónDeUsuariosToolStripMenuItem,
            this.gestiónDePerfilesToolStripMenuItem});
            this.usuarioToolStripMenuItem.Name = "usuarioToolStripMenuItem";
            this.usuarioToolStripMenuItem.Size = new System.Drawing.Size(95, 20);
            this.usuarioToolStripMenuItem.Tag = "mpAdministrador";
            this.usuarioToolStripMenuItem.Text = "Administrador";
            // 
            // gestiónDeUsuariosToolStripMenuItem
            // 
            this.gestiónDeUsuariosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.desbloqueoDeUsuarioToolStripMenuItem,
            this.crearUsuariosToolStripMenuItem,
            this.restaurarMailAnteriorToolStripMenuItem});
            this.gestiónDeUsuariosToolStripMenuItem.Name = "gestiónDeUsuariosToolStripMenuItem";
            this.gestiónDeUsuariosToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.gestiónDeUsuariosToolStripMenuItem.Tag = "mpGestionUsuarios";
            this.gestiónDeUsuariosToolStripMenuItem.Text = "Gestión de Usuarios";
            // 
            // desbloqueoDeUsuarioToolStripMenuItem
            // 
            this.desbloqueoDeUsuarioToolStripMenuItem.Name = "desbloqueoDeUsuarioToolStripMenuItem";
            this.desbloqueoDeUsuarioToolStripMenuItem.Size = new System.Drawing.Size(196, 22);
            this.desbloqueoDeUsuarioToolStripMenuItem.Tag = "mpDesbloqueoUsuario";
            this.desbloqueoDeUsuarioToolStripMenuItem.Text = "Desbloqueo de Usuario";
            this.desbloqueoDeUsuarioToolStripMenuItem.Click += new System.EventHandler(this.desbloqueoDeUsuarioToolStripMenuItem_Click);
            // 
            // crearUsuariosToolStripMenuItem
            // 
            this.crearUsuariosToolStripMenuItem.Name = "crearUsuariosToolStripMenuItem";
            this.crearUsuariosToolStripMenuItem.Size = new System.Drawing.Size(196, 22);
            this.crearUsuariosToolStripMenuItem.Tag = "mpCrearUsuario";
            this.crearUsuariosToolStripMenuItem.Text = "Crear Usuarios";
            this.crearUsuariosToolStripMenuItem.Click += new System.EventHandler(this.crearUsuariosToolStripMenuItem_Click);
            // 
            // restaurarMailAnteriorToolStripMenuItem
            // 
            this.restaurarMailAnteriorToolStripMenuItem.Name = "restaurarMailAnteriorToolStripMenuItem";
            this.restaurarMailAnteriorToolStripMenuItem.Size = new System.Drawing.Size(196, 22);
            this.restaurarMailAnteriorToolStripMenuItem.Text = "Restaurar Mail anterior";
            this.restaurarMailAnteriorToolStripMenuItem.Click += new System.EventHandler(this.restaurarMailAnteriorToolStripMenuItem_Click);
            // 
            // gestiónDePerfilesToolStripMenuItem
            // 
            this.gestiónDePerfilesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.eliminarPerfilesToolStripMenuItem,
            this.administrarPerfilesToolStripMenuItem,
            this.asignarPerfilesAUsuarioToolStripMenuItem});
            this.gestiónDePerfilesToolStripMenuItem.Name = "gestiónDePerfilesToolStripMenuItem";
            this.gestiónDePerfilesToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.gestiónDePerfilesToolStripMenuItem.Tag = "mpGestionPerfiles";
            this.gestiónDePerfilesToolStripMenuItem.Text = "Gestión de Perfiles";
            // 
            // eliminarPerfilesToolStripMenuItem
            // 
            this.eliminarPerfilesToolStripMenuItem.Name = "eliminarPerfilesToolStripMenuItem";
            this.eliminarPerfilesToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
            this.eliminarPerfilesToolStripMenuItem.Tag = "mpGestionarPerfiles";
            this.eliminarPerfilesToolStripMenuItem.Text = "Gestionar Perfiles";
            this.eliminarPerfilesToolStripMenuItem.Click += new System.EventHandler(this.eliminarPerfilesToolStripMenuItem_Click);
            // 
            // administrarPerfilesToolStripMenuItem
            // 
            this.administrarPerfilesToolStripMenuItem.Name = "administrarPerfilesToolStripMenuItem";
            this.administrarPerfilesToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
            this.administrarPerfilesToolStripMenuItem.Tag = "mpAsignarFamilias";
            this.administrarPerfilesToolStripMenuItem.Text = "Asignar Familias de Permisos";
            this.administrarPerfilesToolStripMenuItem.Click += new System.EventHandler(this.administrarPerfilesToolStripMenuItem_Click_1);
            // 
            // asignarPerfilesAUsuarioToolStripMenuItem
            // 
            this.asignarPerfilesAUsuarioToolStripMenuItem.Name = "asignarPerfilesAUsuarioToolStripMenuItem";
            this.asignarPerfilesAUsuarioToolStripMenuItem.Size = new System.Drawing.Size(227, 22);
            this.asignarPerfilesAUsuarioToolStripMenuItem.Tag = "mpAsignarPerfiles";
            this.asignarPerfilesAUsuarioToolStripMenuItem.Text = "Asignar Perfiles a Usuario";
            this.asignarPerfilesAUsuarioToolStripMenuItem.Click += new System.EventHandler(this.asignarPerfilesAUsuarioToolStripMenuItem_Click);
            // 
            // bitacoraToolStripMenuItem1
            // 
            this.bitacoraToolStripMenuItem1.Name = "bitacoraToolStripMenuItem1";
            this.bitacoraToolStripMenuItem1.Size = new System.Drawing.Size(62, 20);
            this.bitacoraToolStripMenuItem1.Tag = "mpBitacora";
            this.bitacoraToolStripMenuItem1.Text = "Bitacora";
            this.bitacoraToolStripMenuItem1.Click += new System.EventHandler(this.bitacoraToolStripMenuItem1_Click);
            // 
            // gestionarIdiomaToolStripMenuItem
            // 
            this.gestionarIdiomaToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.seleccionarIdiomaToolStripMenuItem,
            this.gestionarIdiomaToolStripMenuItem1});
            this.gestionarIdiomaToolStripMenuItem.Name = "gestionarIdiomaToolStripMenuItem";
            this.gestionarIdiomaToolStripMenuItem.Size = new System.Drawing.Size(56, 20);
            this.gestionarIdiomaToolStripMenuItem.Tag = "mpIdioma";
            this.gestionarIdiomaToolStripMenuItem.Text = "Idioma";
            // 
            // seleccionarIdiomaToolStripMenuItem
            // 
            this.seleccionarIdiomaToolStripMenuItem.Name = "seleccionarIdiomaToolStripMenuItem";
            this.seleccionarIdiomaToolStripMenuItem.Size = new System.Drawing.Size(174, 22);
            this.seleccionarIdiomaToolStripMenuItem.Tag = "mpSeleccionarIdioma";
            this.seleccionarIdiomaToolStripMenuItem.Text = "Seleccionar Idioma";
            this.seleccionarIdiomaToolStripMenuItem.Click += new System.EventHandler(this.seleccionarIdiomaToolStripMenuItem_Click);
            // 
            // gestionarIdiomaToolStripMenuItem1
            // 
            this.gestionarIdiomaToolStripMenuItem1.Name = "gestionarIdiomaToolStripMenuItem1";
            this.gestionarIdiomaToolStripMenuItem1.Size = new System.Drawing.Size(174, 22);
            this.gestionarIdiomaToolStripMenuItem1.Tag = "mpGestionarIdioma";
            this.gestionarIdiomaToolStripMenuItem1.Text = "Gestionar Idioma";
            // 
            // restaurarIntegridadDatosToolStripMenuItem
            // 
            this.restaurarIntegridadDatosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.restaurarIntegridadToolStripMenuItem});
            this.restaurarIntegridadDatosToolStripMenuItem.Name = "restaurarIntegridadDatosToolStripMenuItem";
            this.restaurarIntegridadDatosToolStripMenuItem.Size = new System.Drawing.Size(49, 20);
            this.restaurarIntegridadDatosToolStripMenuItem.Text = "Datos";
            // 
            // restaurarIntegridadToolStripMenuItem
            // 
            this.restaurarIntegridadToolStripMenuItem.Name = "restaurarIntegridadToolStripMenuItem";
            this.restaurarIntegridadToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.restaurarIntegridadToolStripMenuItem.Text = "Restaurar Integridad";
            // 
            // cerrarSesionToolStripMenuItem
            // 
            this.cerrarSesionToolStripMenuItem.Name = "cerrarSesionToolStripMenuItem";
            this.cerrarSesionToolStripMenuItem.Size = new System.Drawing.Size(88, 20);
            this.cerrarSesionToolStripMenuItem.Text = "Cerrar Sesion";
            this.cerrarSesionToolStripMenuItem.Click += new System.EventHandler(this.cerrarSesionToolStripMenuItem_Click);
            // 
            // MenuPrincipalForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1700, 721);
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
        private System.Windows.Forms.ToolStripMenuItem bitacoraToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem gestiónDeUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestiónDePerfilesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem desbloqueoDeUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem administrarPerfilesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem asignarPerfilesAUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem eliminarPerfilesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem crearUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionarIdiomaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem seleccionarIdiomaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionarIdiomaToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem restaurarMailAnteriorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem restaurarIntegridadDatosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem restaurarIntegridadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem administradorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem modificarMailToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cambiarClaveToolStripMenuItem;
    }
}