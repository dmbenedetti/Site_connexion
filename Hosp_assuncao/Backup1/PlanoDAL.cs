using System;
using System.Collections.Generic;
using System.Web;
using HAssuncao.Models;
using System.Configuration;
using System.Text;
using System.Data;


namespace HAssuncao.DataAccess
{
    public class PlanoDAL
    {
        #region variável
        private string Con = ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString;
        #endregion

        #region Métodos
        public List<Planos> ListarPlano()
        {
            List<Planos> lista = new List<Planos>();
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            StringBuilder query = new StringBuilder();
            query.AppendLine ("SELECT Plano.descricao as Plano,");
            query.AppendLine (" Convenio.Descricao as Convenio,");
            query.AppendLine ("Tipo.Descricao as TipoAtendimento,");
            query.AppendLine("PlanoTipo.Status as Status,");
            query.AppendLine ("Plano.codPlano, Convenio.CodConvenio,");
            query.AppendLine ("Tipo.CodTipoAtendimento FROM Tb_Plano Plano");
            query.AppendLine ("INNER JOIN Tb_convenio Convenio");
            query.AppendLine ("on Convenio.codconvenio=Plano.codConvenio");
            query.AppendLine ("INNER JOIN Tb_Plano_Tipo_Atendimento PlanoTipo");
            query.AppendLine ("on PlanoTipo.codplano=Plano.codPlano");
            query.AppendLine ("INNER JOIN Tb_Tipo_Atendimento Tipo ");
            query.AppendLine("on Tipo.codTipoAtendimento=PlanoTipo.codTipoAtendimento");

            IDataReader reader = con.RetornaDados(query.ToString());
            Int32 idxPlano = reader.GetOrdinal("Plano");
            Int32 idxConvenio = reader.GetOrdinal("Convenio");
            Int32 idxTipoAtendimento = reader.GetOrdinal("TipoAtendimento");
            Int32 idxStatus = reader.GetOrdinal("Status");
            Int32 idxcodPlano = reader.GetOrdinal("codPlano");
            Int32 idxCodConvenio = reader.GetOrdinal("CodConvenio");
            Int32 idxCodTipoAtendimento = reader.GetOrdinal("CodTipoAtendimento");


            while (reader.Read())
            {
                Planos plano = new Planos();
                plano.DescPlano = reader.GetString(idxPlano);
                plano.Descricao = reader.GetString(idxConvenio);
                plano.DescTipoAtendimento = reader.GetString(idxTipoAtendimento);
                plano.Status = reader.GetBoolean(idxStatus);
                plano.CodPlano = reader.GetInt32(idxcodPlano);
                plano.CodConvenio = reader.GetInt32(idxCodConvenio);
                plano.CodTipo = reader.GetInt32(idxCodTipoAtendimento);
                lista.Add(plano);
            }
            reader.Close();
            con.FechaConexao();

            return lista;
        }

        public List<Planos> ObterListaPlanoTipoAtendimento(string sConvenio)
        {
            List<Planos> lista = new List<Planos>();
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT Plano.descricao as Plano,");
            query.AppendLine("Tipo.Descricao as TipoAtendimento ");
            query.AppendLine("PlanoTipo.Status as Status ");
            query.AppendLine("FROM Tb_Plano Plano");
            query.AppendLine("INNER JOIN Tb_convenio Convenio");
            query.AppendLine("on Convenio.codconvenio=Plano.codConvenio");
            query.AppendLine("INNER JOIN Tb_Plano_Tipo_Atendimento PlanoTipo");
            query.AppendLine("on PlanoTipo.codplano=Plano.codPlano");
            query.AppendLine("INNER JOIN Tb_Tipo_Atendimento Tipo ");
            query.AppendLine("on Tipo.codTipoAtendimento=PlanoTipo.codTipoAtendimento");
            query.AppendLine("WHERE Convenio.CodConvenio=" + sConvenio);


            IDataReader reader = con.RetornaDados(query.ToString());
            Int32 idxPlano = reader.GetOrdinal("Plano");
            Int32 idxTipoAtendimento = reader.GetOrdinal("TipoAtendimento");
            

            while (reader.Read())
            {
                Planos plano = new Planos();
                plano.DescPlano = reader.GetString(idxPlano);
                plano.DescTipoAtendimento = reader.GetString(idxTipoAtendimento);
                lista.Add(plano);
            }
            reader.Close();
            con.FechaConexao();

            return lista;
        }

        public List<Planos> TrocaLinhaColunaFrontEnd()
        {
            List<Planos> lista = new List<Planos>();
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "sp_Planos_Selecionar_Todos";
            IDataReader reader = con.RetornaDados(query);
            Int32 idxPlano = reader.GetOrdinal("Plano");
            Int32 idxAmbulatorio = reader.GetOrdinal("AMBULATORIO");
            Int32 idxExames = reader.GetOrdinal("EXAMES");
            Int32 idxHospital = reader.GetOrdinal("HOSPITAL");
            Int32 idxMaternidade = reader.GetOrdinal("MATERNIDADE");
            Int32 idxPS = reader.GetOrdinal("PS");
            Int32 idxConvenio = reader.GetOrdinal("CONVENIO");
            Int32 idxCODCONVENIO = reader.GetOrdinal("CODCONVENIO");
            Int32 idxCODPLANO = reader.GetOrdinal("CODPLANO");
            while (reader.Read())
            {
                Planos plano = new Planos();
                plano.DescPlano = reader.GetString(idxPlano);
                plano.Ambulatorio = reader.GetInt32(idxAmbulatorio);
                plano.Exames = reader.GetInt32(idxExames);
                plano.Hospital = reader.GetInt32(idxHospital);
                plano.Maternidade = reader.GetInt32(idxMaternidade);
                plano.PS = reader.GetInt32(idxPS);
                plano.CodConvenio = reader.GetInt32(idxCODCONVENIO);
                plano.CodPlano = reader.GetInt32(idxCODPLANO);
                plano.Descricao = reader.GetString(idxConvenio);
                lista.Add(plano);
            }
            reader.Close();
            con.FechaConexao();

            return lista;

        }
        public int InserirPlano(int StatusAmbulatorio,int statusExames, int statusHosp, int statusMat,int statusPS, int codConvenio, int CodTipoAmb,int CodTipoExames, int CodTipoHosp, int CodTipoMat, int CodTipoPS, string descricao)
        {

            try
            {

                int Retorno;
                DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
                con.AbrirConexao();
                string query;
                query = "INSERT INTO Tb_Plano (Descricao, CodConvenio) values ('" + descricao + "'," + codConvenio + ")";
                Retorno = con.ExecutaComando(query);
                if (Retorno > 0)
                {
                    query = "select max(codPlano) as codPlano from Tb_Plano where Descricao=";
                    query += "'" + descricao + "' AND CODCONVENIO=" + codConvenio;
                    IDataReader reader1 = con.RetornaDados(query.ToString());
                    Int32 idxcodPlano1 = reader1.GetOrdinal("codPlano");
                    Planos plano = new Planos();
                    while (reader1.Read())
                    {
                        plano.CodPlano = reader1.GetInt32(idxcodPlano1);
                    }
                    reader1.Close();
                    con.FechaConexao();

                    Cadastra_PlanoXTipo(plano.CodPlano, CodTipoAmb,CodTipoExames, CodTipoHosp, CodTipoMat, CodTipoPS, StatusAmbulatorio,statusExames, statusHosp, statusMat, statusPS);

                }

                return Retorno;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public  int EliminarPlano(int codTipo, int codConvenio, int codPlano)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "DELETE Tb_Plano_Tipo_Atendimento WHERE CODPLANO= " + codPlano; //+ " AND CodTipoAtendimento=" + codTipo;
            Retorno = con.ExecutaComando(query);
            if (Retorno > 0)
            {
                query = "DELETE Tb_Plano WHERE CODPLANO= " + codPlano + " AND codConvenio=" + codConvenio;
                Retorno = con.ExecutaComando(query);
            }
            con.FechaConexao();
            return Retorno;
        }

        public List<Convenios> CarregarConvenio()
        {
            List<Convenios> lista = new List<Convenios>();
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT * FROM Tb_Convenio");
            IDataReader reader = con.RetornaDados(query.ToString());
            Int32 idxcodConvenio = reader.GetOrdinal("codConvenio");
            Int32 idxDescricao = reader.GetOrdinal("Descricao");
            while (reader.Read())
            {
                Convenios convenio = new Convenios();
                convenio.CodConvenio = reader.GetInt32(idxcodConvenio);
                convenio.Descricao = reader.GetString(idxDescricao);
                lista.Add(convenio);

            }
            reader.Close();
            con.FechaConexao();
            return lista;

        }


        public int AlterarPlano(int codPlano, int StatusAmbulatorio,int StatusExames, int statusHosp, int statusMat, int statusPS, int codConvenio, int CodTipoAmb,int CodTipoExames, int CodTipoHosp, int CodTipoMat, int CodTipoPS, string descricao)
        {
            int Retorno;
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query;
            query = "UPDATE Tb_Plano SET Descricao='" + descricao + "', CodConvenio=" + codConvenio;
            query = query + " WHERE CodPlano=" + codPlano;



            Retorno = con.ExecutaComando(query);
            if (Retorno > 0)
            {
                query = "DELETE Tb_Plano_Tipo_Atendimento WHERE CODPLANO=" + codPlano;
                Retorno = con.ExecutaComando(query);
                if (Retorno > 0)
                {
                    Cadastra_PlanoXTipo(codPlano, CodTipoAmb,CodTipoExames, CodTipoHosp, CodTipoMat, CodTipoPS, StatusAmbulatorio,StatusExames, statusHosp, statusMat, statusPS);
                }


            }

            return Retorno;

        }

        public void Cadastra_PlanoXTipo(int CodPlano, int CodTipoAmb,int CodTipoExames, int CodTipoHosp, int CodTipoMat, int CodTipoPS, int StatusAmbulatorio,int StatusExames, int statusHosp, int statusMat, int statusPS)
        {
            try
            {

                string query;
                DataAccess.Conexao con1 = new DataAccess.Conexao(this.Con);
                con1.AbrirConexao();

                //Ambulatorio
                if (CodTipoAmb != 0)
                {
                    query = "INSERT INTO Tb_Plano_Tipo_Atendimento (CodPlano, CodTipoAtendimento,Status) values (" + CodPlano + "," + CodTipoAmb + "," + StatusAmbulatorio + ")";
                    con1.ExecutaComando(query);

                }

                //Exames
                if (CodTipoAmb != 0)
                {
                    query = "INSERT INTO Tb_Plano_Tipo_Atendimento (CodPlano, CodTipoAtendimento,Status) values (" + CodPlano + "," + CodTipoExames + "," + StatusExames + ")";
                    con1.ExecutaComando(query);

                }


                //Hospital
                if (CodTipoHosp != 0)
                {
                    query = "INSERT INTO Tb_Plano_Tipo_Atendimento (CodPlano, CodTipoAtendimento,Status) values (" + CodPlano + "," + CodTipoHosp + "," + statusHosp + ")";
                    con1.ExecutaComando(query);

                }

                //Maternidade
                if (CodTipoMat != 0)
                {
                    query = "INSERT INTO Tb_Plano_Tipo_Atendimento (CodPlano, CodTipoAtendimento,Status) values (" + CodPlano + "," + CodTipoMat + "," + statusMat + ")";
                    con1.ExecutaComando(query);

                }


                //PS
                if (CodTipoPS != 0)
                {
                    query = "INSERT INTO Tb_Plano_Tipo_Atendimento (CodPlano, CodTipoAtendimento,Status) values (" + CodPlano + "," + CodTipoPS + "," + statusPS + ")";
                    con1.ExecutaComando(query);
                }

                con1.FechaConexao();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public List<Planos> CarregaPlanos(string titulo)
        {
            List<Planos> lista = new List<Planos>();
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            string query = string.Empty;
            query = "sp_Planos_Selecionar";
            IDataReader reader = con.RetornaDadosSP(query, titulo);


            if (titulo == string.Empty)
            {
                Int32 idxDescricao = reader.GetOrdinal("CONVENIO");
                while (reader.Read())
                {
                    Planos Plano = new Planos();
                    Plano.Descricao = reader.GetString(idxDescricao);
                    lista.Add(Plano);

                }
            }

            else
            {


                Int32 idxPlano = reader.GetOrdinal("Plano");
                Int32 idxAmbulatorio = reader.GetOrdinal("Ambulatorio");
                Int32 idxExames = reader.GetOrdinal("Exames");
                Int32 idxHospital = reader.GetOrdinal("Hospital");
                Int32 idxMaternidade = reader.GetOrdinal("Maternidade");
                Int32 idxPS = reader.GetOrdinal("PS");
                while (reader.Read())
                {
                    Planos Plano = new Planos();
                    Plano.DescPlano = reader.GetString(idxPlano);
                    Plano.DescAmbulatorio = reader.GetString(idxAmbulatorio);
                    Plano.DescExames = reader.GetString(idxExames);
                    Plano.DescHospital = reader.GetString(idxHospital);
                    Plano.DescMaternidade = reader.GetString(idxMaternidade);
                    Plano.DescPS = reader.GetString(idxPS);
                    lista.Add(Plano);

                }
            }
            reader.Close();
            con.FechaConexao();
            return lista;
        }



        public  List<TiposAtendimentos> CarregarTipoAtendimento()
        {
            List<TiposAtendimentos> lista = new List<TiposAtendimentos>();
            DataAccess.Conexao con = new DataAccess.Conexao(this.Con);
            con.AbrirConexao();
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT * FROM Tb_Tipo_Atendimento");
            IDataReader reader = con.RetornaDados(query.ToString());
            Int32 idxcodTipoAtendimento = reader.GetOrdinal("codTipoAtendimento");
            Int32 idxDescricao = reader.GetOrdinal("Descricao");
            while (reader.Read())
            {
                TiposAtendimentos tipo = new TiposAtendimentos();
                tipo.CodTipo = reader.GetInt32(idxcodTipoAtendimento);
                tipo.Descricao = reader.GetString(idxDescricao);
                lista.Add(tipo);

            }
            reader.Close();
            con.FechaConexao();
            return lista;

        }
        #endregion
    }
}