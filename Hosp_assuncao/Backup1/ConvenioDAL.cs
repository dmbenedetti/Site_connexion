using System;
using System.Collections.Generic;
using System.Web;
using HAssuncao.Models;
using System.Configuration;
using System.Text;
using System.Data;


namespace HAssuncao.DataAccess
{
    public class ConvenioDAL
    {
        #region variável
            private string Con = ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString;
        #endregion

        #region Métodos
        public  List<Convenios> ListarConvenio()
        {
            List<Convenios> lista = new List<Convenios>();
            DataAccess.Conexao con = new DataAccess.Conexao( this.Con);
            con.AbrirConexao();
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT * FROM Tb_Convenio");

            IDataReader reader = con.RetornaDados(query.ToString());
            Int32 idxCodConvenio = reader.GetOrdinal("CodConvenio");
            Int32 idxDescricao = reader.GetOrdinal("Descricao");

            while (reader.Read())
            {
                Convenios convenios = new Convenios();
                convenios.CodConvenio = reader.GetInt32(idxCodConvenio);
                convenios.Descricao = reader.GetString(idxDescricao);
                lista.Add(convenios);
            }

            con.FechaConexao();

            return lista;
        }

        public  int InserirConvenio(string descricao)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query="INSERT INTO Tb_Convenio (Descricao) values ('" + descricao + "')";
            Retorno = con.ExecutaComando(query);
            return Retorno;
        }
        public int AlterarConvenio(int codConvenio, string descricao)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "UPDATE Tb_CONVENIO SET Descricao='" + descricao + "'";
            query = query + " WHERE CodConvenio=" + codConvenio;
            Retorno = con.ExecutaComando(query);
            return Retorno;
        }

        public  int EliminarConvenio(int codConvenio)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "DELETE Tb_Convenio WHERE CODCONVENIO= (" + codConvenio + ")";
            Retorno = con.ExecutaComando(query);
            return Retorno;
        }

        #endregion
    }
}