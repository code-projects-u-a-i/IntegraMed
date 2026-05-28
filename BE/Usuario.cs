namespace BE
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int IntentosFallidos { get; set; }
        public bool Bloqueado { get; set; }

        public Usuario() { }

        public Usuario( string username, string password)
        {
            Username = username;
            Password = password;
            IntentosFallidos = 0;
            Bloqueado = false;
        }
    }
}