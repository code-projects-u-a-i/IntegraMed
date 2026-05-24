using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{

    public class DAO
    {
        private readonly string _connectionString;

        public DAO()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["ConnString"]?.ConnectionString;

            if (string.IsNullOrEmpty(_connectionString))
            {
                throw new Exception("Error: No se encontró la cadena de conexión 'ConnString' en el archivo de configuración.");
            }
        }

        protected SqlConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }

        public DataSet ExecuteDataSet(string sql, params SqlParameter[] parameters)
        {
            var ds = new DataSet();

            using (var cn = GetConnection())
            using (var cmd = new SqlCommand(sql, cn))
            {
                if (parameters != null && parameters.Length > 0)
                    cmd.Parameters.AddRange(parameters);

                using (var da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }

            return ds;
        }


        public int ExecuteNonQueryFuntion(string sql, params SqlParameter[] parameters)
        {
            using (var cn = GetConnection())
            using (var cmd = new SqlCommand(sql, cn))
            {
                if (parameters != null && parameters.Length > 0)
                    cmd.Parameters.AddRange(parameters);

                cn.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        public int ExecuteStoredProcedure(string spName, params SqlParameter[] parameters)
        {
            using (var cn = GetConnection())
            using (var cmd = new SqlCommand(spName, cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (parameters != null && parameters.Length > 0)
                    cmd.Parameters.AddRange(parameters);

                cn.Open();
                return cmd.ExecuteNonQuery();
            }
        }



        public object ExecuteScalarFunction(string sql, params SqlParameter[] parameters)
        {
            using (var cn = GetConnection())
            using (var cmd = new SqlCommand(sql, cn))
            {
                if (parameters != null && parameters.Length > 0)
                    cmd.Parameters.AddRange(parameters);

                cn.Open();
                return cmd.ExecuteScalar();
            }
        }

        public int ObtenerUltimoId(string tabla)
        {
            string columnaId = tabla + "_ID";
            string sql = $"SELECT ISNULL(MAX({columnaId}), 0) FROM {tabla};";

            object value = ExecuteScalarFunction(sql);
            return Convert.ToInt32(value);
        }


        internal string Esc(string texto)
        {
            if (string.IsNullOrEmpty(texto))
                return string.Empty;

            return texto.Replace("'", "''");
        }

        internal int BoolToBit(bool valor)
        {
            return valor ? 1 : 0;
        }
    }
}

