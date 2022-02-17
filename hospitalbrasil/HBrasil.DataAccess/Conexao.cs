using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Linq;

namespace HBrasil.DataAccess
{
    public class Conexao
    {
        #region variáveis/constantes
            private SqlConnection con;
        #endregion

        #region Propriedades
          /// Dados de conexao para SqlServer
          public string ConnectionString { get; set; }
        #endregion

        #region Construtor
          public Conexao() { }
          
        /// Construtor que recebe como parametro a ConnectionString
          public Conexao(string ConnectionString)
          {
              this.ConnectionString = ConnectionString;
          }
        #endregion

        #region Métodos
      
        /// Abre conexao
        public void AbrirConexao()
        {
            if (string.IsNullOrEmpty(this.ConnectionString)) throw new Exception("Não foi informado a ConnectionString.");
            if (con == null)
            {
                con = new SqlConnection();
                con.ConnectionString = this.ConnectionString;
            }
            con.Open();
        }

        /// Fecha conexao
        public void FechaConexao()
        {
            if (con != null && con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        /// Retorna os dados
        public IDataReader RetornaDados(string sql)
        {
            if (string.IsNullOrEmpty(sql)) throw new Exception("Não foi informado a query SQL.");
            if (con == null || con.State == ConnectionState.Closed) throw new Exception("A conexão fechada. Execute o comando AbrirConexao e não se esqueça de FecharConexao no final.");
            SqlCommand command = new SqlCommand();
            command.Connection = this.con;
            command.CommandText = sql;
            IDataReader reader = command.ExecuteReader();
            return reader;
        }


        public IDataReader RetornaDadosSP(string sql,string parametros)
        {
            if (string.IsNullOrEmpty(sql)) throw new Exception("Não foi informado a query SQL.");
            if (con == null || con.State == ConnectionState.Closed) throw new Exception("A conexão fechada. Execute o comando AbrirConexao e não se esqueça de FecharConexao no final.");
            SqlCommand command = new SqlCommand();
            command.Connection = this.con;
            command.CommandText = sql;
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter Parametro = command.Parameters.Add("@titulo", SqlDbType.Text);
            Parametro.Value = parametros;
            Parametro.Direction = ParameterDirection.Input;
            IDataReader reader = command.ExecuteReader();
            return reader;
        }
        public SqlDataReader RetornaDadosSP(string sql, List<SqlParameter> parametros)
        {
            if (string.IsNullOrEmpty(sql)) throw new Exception("Não foi informado a query SQL.");
            if (con == null || con.State == ConnectionState.Closed) throw new Exception("A conexão fechada. Execute o comando AbrirConexao e não se esqueça de FecharConexao no final.");
            SqlCommand command = new SqlCommand();
            command.Connection = this.con;
            command.CommandText = sql;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddRange(parametros.ToArray());
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }

        /// Executa comando e Retorna o total de linhas afetadas
        public int ExecutaComando(string sql)
        {
            if (string.IsNullOrEmpty(sql)) throw new Exception("Não foi informado a query SQL.");
            if (con == null || con.State == ConnectionState.Closed) throw new Exception("A conexão fechada. Execute o comando AbrirConexao e não se esqueça de FecharConexao no final.");
            SqlCommand command = new SqlCommand();
            command.Connection = this.con;
            command.CommandText = sql;
            int result = command.ExecuteNonQuery();
            return result;
        }

       #endregion
    }
    
}