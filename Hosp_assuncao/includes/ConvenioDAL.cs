using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HAssuncao.Models;
using System.Configuration;
using System.Text;
using System.Data;


namespace HAssuncao.DataAccess
{
    public class ConvenioDAL
    {
        private string Con = ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString;
       
        public List<Convenios> ListarConvenio()
        {
            List<Convenios> lista = new List<Convenios>();
            DataAccess.Conexao con = new DataAccess.Conexao( this.Con);
            con.AbrirConexao();
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT * FROM Tb_Convenio");
           // query.AppendLine("SELECT * FROM Tb_Tipo_Atendimento");

            IDataReader reader = con.RetornaDados(query.ToString());
            Int32 idxCodConvenio = reader.GetOrdinal("CodConvenio");
            //Int32 idxCodConvenio = reader.GetOrdinal("CodTipoAtendimento");
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

    }
}