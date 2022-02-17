using System;
using System.Collections.Generic;
using System.Web;
using HAssuncao.Models;
using System.Configuration;
using System.Text;
using System.Data;


namespace HAssuncao.DataAccess
{
    public class TipoAtendimentoDAL
    {
        #region variável
        private string Con = ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString;
        #endregion

        #region Métodos
        public List<TiposAtendimentos> ListarTipoAtendimento()
        {
            List<TiposAtendimentos> lista = new List<TiposAtendimentos>();
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT * FROM Tb_Tipo_Atendimento");

            IDataReader reader = con.RetornaDados(query.ToString());
            Int32 idxCodConvenio = reader.GetOrdinal("CodTipoAtendimento");
            Int32 idxDescricao = reader.GetOrdinal("Descricao");

            while (reader.Read())
            {
                TiposAtendimentos tipoAtendimento = new TiposAtendimentos();
                tipoAtendimento.CodTipo = reader.GetInt32(idxCodConvenio);
                tipoAtendimento.Descricao = reader.GetString(idxDescricao);
                lista.Add(tipoAtendimento);
            }

            con.FechaConexao();

            return lista;
        }

        public  int InserirTipoAtendimento(string descricao)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao( this.Con);
            con.AbrirConexao();
            string query;
            query = "INSERT INTO Tb_Tipo_Atendimento (Descricao) values ('" + descricao + "')";
            Retorno = con.ExecutaComando(query);
            return Retorno;
        }

        public int AlterarTipoAtendimento(string descricao, int codTipoAtendimento)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "UPDATE Tb_Tipo_Atendimento SET Descricao='" + descricao + "'";
            query = query + " WHERE CodTipoAtendimento=" + codTipoAtendimento;
            Retorno = con.ExecutaComando(query);
            return Retorno;
        }

        public  int EliminarTipoAtendimento(int codTipoAtendimento)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "DELETE Tb_Tipo_Atendimento WHERE CodTipoAtendimento= (" + codTipoAtendimento + ")";
            Retorno = con.ExecutaComando(query);
            return Retorno;
        }

        public int SelecionarTipoAtendimento(string descricao)
        {
            int Retorno = 0;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "SELECT 1 AS DADOS FROM Tb_Tipo_Atendimento WHERE DESCRICAO= '" + descricao + "'";
            IDataReader reader = con.RetornaDados(query);
            Int32 idxDados = reader.GetOrdinal("DADOS");
            while (reader.Read())
            {
                Retorno = reader.GetInt32(idxDados);
            }

            con.FechaConexao();

            return Retorno;
        
        }

        #endregion
    }
}