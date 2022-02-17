using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace HAssuncao.DataAccess
{
    public class Conexao
    {

        private SqlConnection con;


        /// Dados de conexao para SqlServer
        public string ConnectionString { get; set; }
        public Conexao() { }

        /// Construtor que recebe como parametro a ConnectionString
        /// <param name="ConnectionString"></param>
        public Conexao(string ConnectionString)
        {
            this.ConnectionString = ConnectionString;
        }
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
        /// <returns>Retorna coleção de dados</returns>
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

        /// Executa comando
        /// <returns>Retorna o total de linhas afetadas</returns>
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
    }
}