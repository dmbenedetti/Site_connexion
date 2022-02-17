using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for exameBO
/// </summary>
public class exameBO
{
	public exameBO()
	{
	}

    private void InsereCliente(ref exame_cliente oCliente)
    {
        string sSQL = "spExameClienteInserir";
        SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
        SqlCommand oComm = new SqlCommand(sSQL, oConn);
        oConn.Open();
        oComm.CommandType = System.Data.CommandType.StoredProcedure;
        oComm.Parameters.Add("@id_exame_cliente", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame_cliente"].Direction = System.Data.ParameterDirection.InputOutput;
        oComm.Parameters["@id_exame_cliente"].Value = 0;
        oComm.Parameters.Add("@ds_nome", System.Data.SqlDbType.VarChar, 200);
        oComm.Parameters["@ds_nome"].Value = oCliente.ds_nome == null ? DBNull.Value : oCliente.ds_nome as object;
        oComm.Parameters.Add("@dt_nascimento", System.Data.SqlDbType.DateTime);
        oComm.Parameters["@dt_nascimento"].Value = oCliente.dt_nascimento == null ? DBNull.Value : oCliente.dt_nascimento as object;
        oComm.Parameters.Add("@id_identificacao", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_identificacao"].Value = oCliente.id_identificacao == null ? DBNull.Value : oCliente.id_identificacao as object;
        oComm.ExecuteNonQuery();
        oCliente.id_exame_cliente = Convert.ToInt32(oComm.Parameters["@id_exame_cliente"].Value);
        oConn.Close();
        oComm.Dispose();
        oConn.Dispose();
    }

    private void InsereExame(ref exame oExame)
    {
        string sSQL = "spExameInserir";
        SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
        SqlCommand oComm = new SqlCommand(sSQL, oConn);
        oConn.Open();
        oComm.CommandType = System.Data.CommandType.StoredProcedure;
        oComm.Parameters.Add("@id_exame", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame"].Direction = System.Data.ParameterDirection.InputOutput;
        oComm.Parameters["@id_exame"].Value = 0;
        oComm.Parameters.Add("@id_exame_profissional_saude", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame_profissional_saude"].Value = oExame.id_exame_profissional_saude == null ? DBNull.Value : oExame.id_exame_profissional_saude as object; ;
        oComm.Parameters.Add("@ds_laudo", System.Data.SqlDbType.VarChar);
        oComm.Parameters["@ds_laudo"].Value = oExame.ds_laudo == null ? DBNull.Value : oExame.ds_laudo as object;
        oComm.Parameters.Add("@ds_evolutivo", System.Data.SqlDbType.VarChar);
        oComm.Parameters["@ds_evolutivo"].Value = oExame.ds_evolutivo == null ? DBNull.Value : oExame.ds_evolutivo as object;
        oComm.Parameters.Add("@dt_exame", System.Data.SqlDbType.DateTime);
        oComm.Parameters["@dt_exame"].Value = oExame.dt_exame == null ? DBNull.Value : oExame.dt_exame as object;
        oComm.Parameters.Add("@ds_sigla_exame", System.Data.SqlDbType.VarChar, 30);
        oComm.Parameters["@ds_sigla_exame"].Value = oExame.ds_sigla_exame == null ? DBNull.Value : oExame.ds_sigla_exame as object;
        oComm.Parameters.Add("@id_exame_externo", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame_externo"].Value = oExame.id_exame_externo == null ? DBNull.Value : oExame.id_exame_externo as object;
        oComm.Parameters.Add("@id_exame_ficha", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame_ficha"].Value = oExame.id_exame_ficha == null ? DBNull.Value : oExame.id_exame_ficha as object;
        oComm.ExecuteNonQuery();
        //oExame.id_exames = Convert.ToInt32(oComm.Parameters["@id_exame"].Value);
        oConn.Close();
        oComm.Dispose();
        oConn.Dispose();
    }

    private void InsereProfissionalSaude(ref exame_profissional_saude oProfissionalSaude)
    {
        string sSQL = "spExameProfissionalSaudeInserir";
        SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
        SqlCommand oComm = new SqlCommand(sSQL, oConn);
        oConn.Open();
        oComm.CommandType = System.Data.CommandType.StoredProcedure;
        oComm.Parameters.Add("@id_exame_profissional_saude", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame_profissional_saude"].Direction = System.Data.ParameterDirection.InputOutput;
        oComm.Parameters["@id_exame_profissional_saude"].Value = 0;
        oComm.Parameters.Add("@nu_registro", System.Data.SqlDbType.Int);
        oComm.Parameters["@nu_registro"].Value = oProfissionalSaude.nu_registro == null ? DBNull.Value : oProfissionalSaude.nu_registro as object; ;
        oComm.Parameters.Add("@ds_nome", System.Data.SqlDbType.VarChar, 200);
        oComm.Parameters["@ds_nome"].Value = oProfissionalSaude.ds_nome == null ? DBNull.Value : oProfissionalSaude.ds_nome as object;
        oComm.Parameters.Add("@id_estado", System.Data.SqlDbType.Char, 2);
        oComm.Parameters["@id_estado"].Value = oProfissionalSaude.id_estado == null ? DBNull.Value : oProfissionalSaude.id_estado as object; ;
        oComm.Parameters.Add("@ds_tipo_conselho", System.Data.SqlDbType.VarChar, 50);
        oComm.Parameters["@ds_tipo_conselho"].Value = oProfissionalSaude.ds_tipo_conselho == null ? DBNull.Value : oProfissionalSaude.ds_tipo_conselho as object;
        oComm.ExecuteNonQuery();
        oProfissionalSaude.id_exame_profissional_saude = Convert.ToInt32(oComm.Parameters["@id_exame_profissional_saude"].Value);
        oConn.Close();
        oComm.Dispose();
        oConn.Dispose();
    }

    private void InsereFicha(ref exame_ficha oFicha)
    {
        string sSQL = "spExameFichaInserir";
        SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
        SqlCommand oComm = new SqlCommand(sSQL, oConn);
        oConn.Open();
        oComm.CommandType = System.Data.CommandType.StoredProcedure;
        oComm.Parameters.Add("@id_exame_ficha", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame_ficha"].Direction = System.Data.ParameterDirection.InputOutput;
        oComm.Parameters["@id_exame_ficha"].Value = 0;
        oComm.Parameters.Add("@nu_cliente", System.Data.SqlDbType.Int);
        oComm.Parameters["@nu_cliente"].Value = oFicha.nu_cliente == null ? DBNull.Value : oFicha.nu_cliente as object;
        oComm.Parameters.Add("@nu_internacao", System.Data.SqlDbType.Int);
        oComm.Parameters["@nu_internacao"].Value = oFicha.nu_internacao == null ? DBNull.Value : oFicha.nu_internacao as object;
        oComm.Parameters.Add("@nu_requisicao", System.Data.SqlDbType.Int);
        oComm.Parameters["@nu_requisicao"].Value = oFicha.nu_requisicao == null ? DBNull.Value : oFicha.nu_requisicao as object;
        oComm.Parameters.Add("@nu_unidade", System.Data.SqlDbType.Int);
        oComm.Parameters["@nu_unidade"].Value = oFicha.nu_unidade == null ? DBNull.Value : oFicha.nu_unidade as object;
        oComm.Parameters.Add("@id_exame_cliente", System.Data.SqlDbType.Int);
        oComm.Parameters["@id_exame_cliente"].Value = oFicha.id_exame_cliente == null ? DBNull.Value : oFicha.id_exame_cliente as object;
        oComm.Parameters.Add("@nu_ficha", System.Data.SqlDbType.Int);
        oComm.Parameters["@nu_ficha"].Value = oFicha.nu_ficha == null ? DBNull.Value : oFicha.nu_ficha as object;
        oComm.Parameters.Add("@nu_prontuario", System.Data.SqlDbType.Int);
        oComm.Parameters["@nu_prontuario"].Value = oFicha.nu_prontuario == null ? DBNull.Value : oFicha.nu_prontuario as object;
        oComm.ExecuteNonQuery();
        oFicha.id_exame_ficha = Convert.ToInt32(oComm.Parameters["@id_exame_ficha"].Value);
        oConn.Close();
        oComm.Dispose();
        oConn.Dispose();
    }


    public exameBO_Result Import(string sXML)
    {
        exameBO_Result oResult = new exameBO_Result();
        XmlDocument oDoc = new XmlDocument();
        oDoc.LoadXml(sXML);
        exame_ficha oFicha = null;
        exame_cliente oCliente = null;
        exame_profissional_saude oProfissional = null;
        exame oExame = null;
        XmlNode oNodeLaudo = null;
        XmlNode oNodeExames = null;
        XmlNode oNodeEvolutivo = null;
        XmlNode oNodeProfissionalSaude = null;
        try
        {
            if (oDoc.HasChildNodes)
            {
                foreach (XmlNode oNode in oDoc.SelectNodes("ResultadoExames"))
                {
                    oFicha = new exame_ficha();
                    oCliente = new exame_cliente();
                    if (oNode.Attributes["NrCliente"] != null)
                    {
                        oCliente.id_identificacao = Convert.ToInt32(oNode.Attributes["NrCliente"].InnerText);
                    }
                    if (oNode.Attributes["NomeCliente"] != null)
                    {
                        oCliente.ds_nome = oNode.Attributes["NomeCliente"].InnerText;
                    }
                    if (oNode.Attributes["Nascimento"] != null)
                    {
                        oCliente.dt_nascimento = GetDate(oNode.Attributes["Nascimento"].InnerText);
                    }
                    if (oCliente.id_identificacao != null)
                    {
                        InsereCliente(ref oCliente);
                    }
                    else
                        break;
                    oFicha.nu_cliente = oCliente.id_identificacao;
                    oFicha.id_exame_cliente = oCliente.id_exame_cliente;
                    if (oNode.Attributes["NrFicha"] != null)
                    {
                        oFicha.nu_ficha = Convert.ToInt32(oNode.Attributes["NrFicha"].InnerText);
                    }
                    if (oNode.Attributes["NrInternacao"] != null)
                    {
                        oFicha.nu_internacao = Convert.ToInt32(oNode.Attributes["NrInternacao"].InnerText);
                    }
                    if (oNode.Attributes["NrRequisicao"] != null)
                    {
                        oFicha.nu_requisicao = Convert.ToInt32(oNode.Attributes["NrRequisicao"].InnerText);
                    }
                    if (oNode.Attributes["Prontuario"] != null)
                    {
                        oFicha.nu_prontuario = Convert.ToInt32(oNode.Attributes["Prontuario"].InnerText);
                    }
                    if (oNode.Attributes["Unidade"] != null)
                    {
                        oFicha.nu_unidade = Convert.ToInt32(oNode.Attributes["Unidade"].InnerText);
                    }
                    InsereFicha(ref oFicha);
                    oNodeExames = oNode.SelectSingleNode("Exames");
                    if (oNodeExames != null)
                    {
                        foreach (XmlNode oNodeExame in oNodeExames.SelectNodes("Exame"))
                        {
                            oProfissional = null;
                            oNodeProfissionalSaude = oNodeExame.SelectSingleNode("ProfissionaisSaude");
                            if (oNodeProfissionalSaude != null)
                            {
                                foreach (XmlNode oNodeProfissional in oNodeProfissionalSaude.SelectNodes("ProfissionalSaude"))
                                {
                                    oProfissional = new exame_profissional_saude();
                                    if (oNodeProfissional.Attributes["NumeroRegistro"] != null)
                                    {
                                        oProfissional.nu_registro = Convert.ToInt32(oNodeProfissional.Attributes["NumeroRegistro"].InnerText);
                                    }
                                    if (oNodeProfissional.Attributes["Estado"] != null)
                                    {
                                        oProfissional.id_estado = Convert.ToString(oNodeProfissional.Attributes["Estado"].InnerText);
                                    }
                                    if (oNodeProfissional.Attributes["Nome"] != null)
                                    {
                                        oProfissional.ds_nome = Convert.ToString(oNodeProfissional.Attributes["Nome"].InnerText);
                                    }
                                    if (oNodeProfissional.Attributes["TipoConselho"] != null)
                                    {
                                        oProfissional.ds_tipo_conselho = Convert.ToString(oNodeProfissional.Attributes["TipoConselho"].InnerText);
                                    }
                                    InsereProfissionalSaude(ref oProfissional);
                                }

                            }
                            oExame = new exame();
                            oExame.id_exame_ficha = oFicha.id_exame_ficha;
                            if (oProfissional != null)
                            {
                                oExame.id_exame_profissional_saude = oProfissional.id_exame_profissional_saude;
                            }
                            if (oNodeExame.Attributes["SiglaExame"] != null)
                            {
                                oExame.ds_sigla_exame = Convert.ToString(oNodeExame.Attributes["SiglaExame"].InnerText);
                            }
                            if (oNodeExame.Attributes["DataColeta"] != null)
                            {
                                oExame.dt_exame = GetDate(oNodeExame.Attributes["DataColeta"].InnerText);
                            }
                            if (oNodeExame.Attributes["IdExame"] != null)
                            {
                                oExame.id_exame_externo = Convert.ToInt32(oNodeExame.Attributes["IdExame"].InnerText);
                            }
                            oNodeLaudo = oNodeExame.SelectSingleNode("Laudo");
                            if (oNodeLaudo != null)
                            {
                                oExame.ds_laudo = oNodeLaudo.InnerText;
                            }
                            oNodeEvolutivo = oNodeExame.SelectSingleNode("Evolutivo");
                            if (oNodeEvolutivo != null)
                            {
                                oNodeLaudo = oNodeEvolutivo.SelectSingleNode("EvolutivoHTML");
                                if (oNodeLaudo != null)
                                {
                                    oExame.ds_evolutivo = oNodeLaudo.InnerText;
                                }
                            }
                            InsereExame(ref oExame);
                            oResult.Status = true;
                            oResult.ID = oFicha.nu_ficha.ToString();
                        }
                    }

                }
            }
        }
        catch (Exception ex)
        {
            oResult.Status = false;
            oResult.Mensage = ex.Message;
            if (oExame != null) 
                oResult.IDE = oExame.id_exame_externo.ToString();
            if (oFicha != null)
                oResult.ID = oFicha.nu_ficha.ToString();
        }
        

        return oResult;
    }

    public exame_ficha ExameFicha(int idExame, int idCliente)
    {
        exame_ficha oExameFicha = null;
        try
        {
            string sSQL = "spExameFichaLoad";
            SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
            SqlCommand oComm = new SqlCommand(sSQL, oConn);
            oConn.Open();
            oComm.CommandType = System.Data.CommandType.StoredProcedure;
            oComm.Parameters.Add("@idCliente", System.Data.SqlDbType.Int);
            oComm.Parameters["@idCliente"].Value = idCliente;
            oComm.Parameters.Add("@idExameFicha", System.Data.SqlDbType.Int);
            oComm.Parameters["@idExameFicha"].Value = idExame;
            SqlDataReader oReader = oComm.ExecuteReader();
            if (oReader.Read())
            {
                oExameFicha = new exame_ficha();
                oExameFicha.id_exame_ficha = Convert.ToInt32(oReader["id_exame_ficha"]);
                if (!Convert.IsDBNull(oReader["id_exame_cliente"]))
                    oExameFicha.id_exame_cliente = Convert.ToInt32(oReader["id_exame_cliente"]);
                if (!Convert.IsDBNull(oReader["nu_cliente"]))
                    oExameFicha.nu_cliente = Convert.ToInt32(oReader["nu_cliente"]);
                if (!Convert.IsDBNull(oReader["nu_ficha"]))
                    oExameFicha.nu_ficha = Convert.ToInt32(oReader["nu_ficha"]);
                if (!Convert.IsDBNull(oReader["nu_internacao"]))
                    oExameFicha.nu_internacao = Convert.ToInt32(oReader["nu_internacao"]);
                if (!Convert.IsDBNull(oReader["nu_prontuario"]))
                    oExameFicha.nu_prontuario = Convert.ToInt32(oReader["nu_prontuario"]);
                if (!Convert.IsDBNull(oReader["nu_requisicao"]))
                    oExameFicha.nu_requisicao = Convert.ToInt32(oReader["nu_requisicao"]);
                if (!Convert.IsDBNull(oReader["nu_unidade"]))
                    oExameFicha.nu_unidade = Convert.ToInt32(oReader["nu_unidade"]);
            }
            oConn.Close();
        }
        catch
        {
            oExameFicha = null;
        }

        return oExameFicha;
    }

    public exame_profissional_saude ExameProfissionalSaude(int idProfissionalSaude)
    {
        exame_profissional_saude oExameProfissionalSaude = null;
        try
        {
            string sSQL = "spExameProfissionalSaudeLoad";
            SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
            SqlCommand oComm = new SqlCommand(sSQL, oConn);
            oConn.Open();
            oComm.CommandType = System.Data.CommandType.StoredProcedure;
            oComm.Parameters.Add("@idProfissionalSaude", System.Data.SqlDbType.Int);
            oComm.Parameters["@idProfissionalSaude"].Value = idProfissionalSaude;
            SqlDataReader oReader = oComm.ExecuteReader();
            if (oReader.Read())
            {
                oExameProfissionalSaude = new exame_profissional_saude();
                oExameProfissionalSaude.id_exame_profissional_saude = Convert.ToInt32(oReader["id_exame_profissional_saude"]);
                if (!Convert.IsDBNull(oReader["ds_nome"]))
                    oExameProfissionalSaude.ds_nome = Convert.ToString(oReader["ds_nome"]);
                if (!Convert.IsDBNull(oReader["ds_tipo_conselho"]))
                    oExameProfissionalSaude.ds_tipo_conselho = Convert.ToString(oReader["ds_tipo_conselho"]);
                if (!Convert.IsDBNull(oReader["id_estado"]))
                    oExameProfissionalSaude.id_estado = Convert.ToString(oReader["id_estado"]);
                if (!Convert.IsDBNull(oReader["nu_registro"]))
                    oExameProfissionalSaude.nu_registro = Convert.ToInt32(oReader["nu_registro"]);
            }
            oConn.Close();
        }
        catch
        {
            oExameProfissionalSaude = null;
        }

        return oExameProfissionalSaude;
    }

    public exame_cliente ExameCliente(int idCliente)
    {
        exame_cliente oExameCliente = null;
        try
        {
            string sSQL = "spExameClienteLoad";
            SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
            SqlCommand oComm = new SqlCommand(sSQL, oConn);
            oConn.Open();
            oComm.CommandType = System.Data.CommandType.StoredProcedure;
            oComm.Parameters.Add("@idExameCliente", System.Data.SqlDbType.Int);
            oComm.Parameters["@idExameCliente"].Value = idCliente;
            SqlDataReader oReader = oComm.ExecuteReader();
            if (oReader.Read())
            {
                oExameCliente = new exame_cliente();
                oExameCliente.id_exame_cliente = Convert.ToInt32(oReader["id_exame_cliente"]);
                if (!Convert.IsDBNull(oReader["ds_nome"]))
                    oExameCliente.ds_nome = Convert.ToString(oReader["ds_nome"]);
                if (!Convert.IsDBNull(oReader["dt_nascimento"]))
                    oExameCliente.dt_nascimento = Convert.ToDateTime(oReader["dt_nascimento"]);
                if (!Convert.IsDBNull(oReader["id_identificacao"]))
                    oExameCliente.id_identificacao = Convert.ToInt32(oReader["id_identificacao"]);
            }
            oConn.Close();
        }
        catch
        {
            oExameCliente = null;
        }

        return oExameCliente;
    }




    public List<exame> Exames(int idExame, int idCliente)
    {
        List<exame> oExames = null;
        try
        {
            string sSQL = "spExamesLoad";
            SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
            SqlCommand oComm = new SqlCommand(sSQL, oConn);
            oConn.Open();
            oComm.CommandType = System.Data.CommandType.StoredProcedure;
            oComm.Parameters.Add("@idExameFicha", System.Data.SqlDbType.Int);
            oComm.Parameters["@idExameFicha"].Value = idExame;
            SqlDataReader oReader = oComm.ExecuteReader();
            exame oExame;
            if (oReader.Read()) {
                oExames = new List<exame>();
                do
                {
                    oExame = new exame();
                    oExame.id_exame_ficha = Convert.ToInt32(oReader["id_exame_ficha"]);
                    if (!Convert.IsDBNull(oReader["id_exame_externo"]))
                        oExame.id_exame_externo = Convert.ToInt32(oReader["id_exame_externo"]);
                    if (!Convert.IsDBNull(oReader["id_exame_profissional_saude"]))
                        oExame.id_exame_profissional_saude = Convert.ToInt32(oReader["id_exame_profissional_saude"]);
                    if (!Convert.IsDBNull(oReader["id_exame"]))
                        oExame.id_exames = Convert.ToInt32(oReader["id_exame"]);
                    if (!Convert.IsDBNull(oReader["ds_evolutivo"]))
                        oExame.ds_evolutivo = Convert.ToString(oReader["ds_evolutivo"]);
                    if (!Convert.IsDBNull(oReader["ds_laudo"]))
                        oExame.ds_laudo = Convert.ToString(oReader["ds_laudo"]);
                    if (!Convert.IsDBNull(oReader["ds_sigla_exame"]))
                        oExame.ds_sigla_exame = Convert.ToString(oReader["ds_sigla_exame"]);
                    if (!Convert.IsDBNull(oReader["dt_exame"]))
                        oExame.dt_exame = Convert.ToDateTime(oReader["dt_exame"]);
                    oExames.Add(oExame);
                } while (oReader.Read());
            oConn.Close();
            }
        }
        catch
        {
            oExames = null;
        }

        return oExames;
    }


    private DateTime? GetDate(string sDate)
    {
        DateTime? Date = null;
        try
        {
            string sDateFormated = sDate.Substring(6, 4) + "-" + sDate.Substring(3, 2) + "-" + sDate.Substring(0, 2);
            Date = Convert.ToDateTime(sDateFormated);
        }
        catch
        {
            Date = null;
        }
        return Date;

    }



    public DataTable ListaExames(int idCliente)
    {
        DataTable oTable = null;
        try
        {
            string sSQL = "spExameLista";
            SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
            SqlCommand oComm = new SqlCommand(sSQL, oConn);
            oConn.Open();
            oComm.CommandType = System.Data.CommandType.StoredProcedure;
            oComm.Parameters.Add("@idCliente", System.Data.SqlDbType.Int);
            oComm.Parameters["@idCliente"].Value = idCliente;
            oTable = new DataTable();
            oTable.Load(oComm.ExecuteReader());
            oConn.Close();
        }
        catch
        {
            oTable = null;
        }

        return oTable;
    }
    

    public int ValidaLogin(string Requisicao, string Prontuario)
    {
        int idCliente = -1;
        try
        {
            string sSQL = "spValidaCliente";
            SqlConnection oConn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_hosp_assuncaoConnectionString"].ConnectionString);
            SqlCommand oComm = new SqlCommand(sSQL, oConn);
            oConn.Open();
            oComm.CommandType = System.Data.CommandType.StoredProcedure;
            oComm.Parameters.Add("@id_cliente", System.Data.SqlDbType.Int);
            oComm.Parameters["@id_cliente"].Direction = ParameterDirection.InputOutput;
            oComm.Parameters["@id_cliente"].Value = 0;
            oComm.Parameters.Add("@nu_prontuario", System.Data.SqlDbType.Int);
            oComm.Parameters["@nu_prontuario"].Value = Convert.ToInt32(Prontuario);
            oComm.Parameters.Add("@nu_requisicao", System.Data.SqlDbType.Int);
            oComm.Parameters["@nu_requisicao"].Value = Convert.ToInt32(Requisicao);
            oComm.ExecuteNonQuery();
            idCliente = Convert.ToInt32(oComm.Parameters["@id_cliente"].Value);
            oConn.Close();
        }
        catch
        {
            idCliente = -1;
        }

        return idCliente;
    }
    
}

public class exameBO_Result
{
    public exameBO_Result() { }

    public bool Status { set; get; }
    public string Mensage { set; get; }
    public string ID { get; set; }
    public string IDE { get; set; }

}
