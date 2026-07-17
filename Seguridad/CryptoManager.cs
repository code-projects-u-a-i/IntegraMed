using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Seguridad
{
    public class CryptoManager 
    {
        public string GenerarHashMD5(string textoPlano) 
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] inputBytes = Encoding.UTF8.GetBytes(textoPlano);
                byte[] hashBytes = sha256.ComputeHash(inputBytes);

                var sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("x2")); 
                }

                return sb.ToString();
            }
        }

    }
}
