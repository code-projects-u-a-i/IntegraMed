
INSERT INTO Idioma (Idioma_Id, Idioma_Nombre) 
VALUES (1, 'Español');

INSERT INTO Etiqueta (Etiqueta_Clave) VALUES 
('Login'),
('LoginTitulo'),
('loginSubtitulo'),
('loginNombre'),
('loginPass'),
('loginBtnIniciar');

INSERT INTO Traduccion (Traduccion_IdiomaId, Traduccion_EtiquetaClave, Traduccion_Texto) VALUES 
(1, 'Login', 'Login'),
(1, 'LoginTitulo', 'Sagrado Corazón'),
(1, 'loginSubtitulo', 'Introduce tus credenciales para continuar'),
(1, 'loginNombre', 'Nombre usuario'),
(1, 'loginPass', 'Contraseña'),
(1, 'loginBtnIniciar', 'Iniciar Sesion');

INSERT INTO Idioma (Idioma_Id, Idioma_Nombre) VALUES (2, 'English');

INSERT INTO Traduccion (Traduccion_IdiomaId, Traduccion_EtiquetaClave, Traduccion_Texto) VALUES 
(2, 'Login', 'Login'),
(2, 'LoginTitulo', 'Sacred Heart'),
(2, 'loginSubtitulo', 'Enter your credentials to continue'),
(2, 'loginNombre', 'Username'),
(2, 'loginPass', 'Password'),
(2, 'loginBtnIniciar', 'Sign In');

INSERT INTO Etiqueta (Etiqueta_Clave) VALUES 
('mpUsuario'),
('mpGestionUsuarios'),
('mpGestionPerfiles'),
('mpAdministrarUsuario'),
('mpDesbloqueoUsuario'),
('mpCrearUsuario'),
('mpGestionarPerfiles'),
('mpAsignarFamilias'),
('mpAsignarPerfiles'),
('mpBitacora'),
('mpIdioma'),
('mpSeleccionarIdioma'),
('mpGestionarIdioma');

INSERT INTO Traduccion (Traduccion_IdiomaId, Traduccion_EtiquetaClave, Traduccion_Texto) VALUES 
(1, 'mpUsuario', 'Usuario'),
(1, 'mpGestionUsuarios', 'Gestión de Usuarios'),
(1, 'mpGestionPerfiles', 'Gestión de Perfiles'),
(1, 'mpAdministrarUsuario', 'Administrar Usuario'),
(1, 'mpDesbloqueoUsuario', 'Desbloquear Usuario'),
(1, 'mpCrearUsuario', 'Crear Usuario'),
(1, 'mpGestionarPerfiles', 'Administrar Perfiles'),
(1, 'mpAsignarFamilias', 'Asignacion de Familias'),
(1, 'mpAsignarPerfiles', 'Asignar Perfiles a Usuario'),
(1, 'mpBitacora', 'Bitacora'),
(1, 'mpIdioma', 'Idioma'),
(1, 'mpSeleccionarIdioma', 'Seleccionar Idioma'),
(1, 'mpGestionarIdioma', 'Gestión de Idioma');

INSERT INTO Traduccion (Traduccion_IdiomaId, Traduccion_EtiquetaClave, Traduccion_Texto) VALUES 
(2, 'mpUsuario', 'User'),
(2, 'mpGestionUsuarios', 'User Management'),
(2, 'mpGestionPerfiles', 'Profile Management'),
(2, 'mpAdministrarUsuario', 'Manage User'),
(2, 'mpDesbloqueoUsuario', 'Unlock User'),
(2, 'mpCrearUsuario', 'Create User'),
(2, 'mpGestionarPerfiles', 'Manage Profiles'),
(2, 'mpAsignarFamilias', 'Assign Families'),
(2, 'mpAsignarPerfiles', 'Assign Profiles to User'),
(2, 'mpBitacora', 'Logs'), 
(2, 'mpIdioma', 'Language'),
(2, 'mpSeleccionarIdioma', 'Select Language'),
(2, 'mpGestionarIdioma', 'Language Management');