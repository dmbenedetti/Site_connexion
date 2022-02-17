using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net; // importe o namespace .Net
using System.Net.Mail; // importe o namespace .Net.Mail
using System.Text;


using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.xml;
using System.IO;
using System.Data;
//using System.Collections.Generic;

public partial class form8 : System.Web.UI.Page
{
    public class procadimento
    {
        string cod;
        string descricao;
        int id;

    }

    public class equipamento
    {
        string cod;
        string descricao;
        int id;
    }

    public class material
    {
        string cod;
        string fornecedor;
        int quantidade;
        int id;
    }

    private DataTable procedimentos;
    private DataTable equipamentos;
    private DataTable materiais;

    private void DownloadAsPDF(MemoryStream ms)
    {
        string arquivo = "agendamento_" + DateTime.Now.ToString("dd-MM-yyyy");
        Response.Clear();
        Response.ClearContent();
        Response.ClearHeaders();
        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + arquivo + ".pdf");
        Response.OutputStream.Write(ms.GetBuffer(), 0, ms.GetBuffer().Length);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();
        Response.End();
        ms.Close();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            procedimentos = (DataTable)Session["procedimentos"];
            equipamentos = (DataTable)Session["equipamentos"];
            materiais = (DataTable)Session["materiais"];

        }
        else
        {
            DataRow oRow;
            procedimentos = new DataTable();
            procedimentos.Columns.Add("id", System.Type.GetType("System.Int32"));
            procedimentos.Columns.Add("cod", System.Type.GetType("System.String"));
            procedimentos.Columns.Add("descricao", System.Type.GetType("System.String"));
            oRow = procedimentos.NewRow();
            oRow["id"] = 1;
            procedimentos.Rows.Add(oRow);
            oRow = procedimentos.NewRow();
            oRow["id"] = 2;
            procedimentos.Rows.Add(oRow);
            Session["procedimentos"] = procedimentos;
            equipamentos = new DataTable();
            equipamentos.Columns.Add("id", System.Type.GetType("System.Int32"));
            equipamentos.Columns.Add("cod", System.Type.GetType("System.String"));
            equipamentos.Columns.Add("descricao", System.Type.GetType("System.String"));
            oRow = equipamentos.NewRow();
            oRow["id"] = 1;
            equipamentos.Rows.Add(oRow);
            oRow = equipamentos.NewRow();
            oRow["id"] = 2;
            equipamentos.Rows.Add(oRow);
            Session["equipamentos"] = equipamentos;
            materiais = new DataTable();
            materiais.Columns.Add("id", System.Type.GetType("System.Int32"));
            materiais.Columns.Add("cod", System.Type.GetType("System.String"));
            materiais.Columns.Add("fornecedor", System.Type.GetType("System.String"));
            materiais.Columns.Add("quantidade", System.Type.GetType("System.Int32"));
            oRow = materiais.NewRow();
            oRow["id"] = 1;
            materiais.Rows.Add(oRow);
            oRow = materiais.NewRow();
            oRow["id"] = 2;
            materiais.Rows.Add(oRow);
            Session["materiais"] = materiais;

            rptProcedimentos.DataSource = procedimentos;
            rptProcedimentos.DataBind();
            rptMateriais.DataSource = materiais;
            rptMateriais.DataBind();
        }

        //int id = Convert.ToInt32(Request.QueryString["id"]);
        //DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
        //DataTable tb00 = paginas.Get_select_id(id);
        //string titulo = (string)tb00.Rows[0]["titulo"];
        lbl_titulo.Text = ConfigurationManager.AppSettings["Titulo"];
    }

    private void geraPDF(string html)
    {
        //(1)using PDFWriter
        Document doc = new Document();
        MemoryStream memoryStream = new MemoryStream();
        PdfWriter writer = PdfWriter.GetInstance(doc, memoryStream);
        doc.Open();
        iTextSharp.text.html.simpleparser.StyleSheet styles = new iTextSharp.text.html.simpleparser.StyleSheet();
        iTextSharp.text.html.simpleparser.HTMLWorker hw = new iTextSharp.text.html.simpleparser.HTMLWorker(doc);
        hw.Parse(new StringReader(html));
        writer.CloseStream = false;

        doc.Close();
        //Get the pointer to the beginning of the stream. 
        memoryStream.Position = 0;
        //You may use this PDF in memorystream to send as an attachment in an email
        //OR download as a PDF
        //SendEmail(memoryStream);
        DownloadAsPDF(memoryStream);

    }

    private void PreencheProcedimento()
    {
        int i = 0;
        TextBox oTB;
        foreach (RepeaterItem oItem in rptProcedimentos.Items)
        {
            oTB = (TextBox)oItem.FindControl("txt_codProcedimentoMasTuss");
            if (!string.IsNullOrEmpty(oTB.Text))
            {
                procedimentos.Rows[i]["cod"] = oTB.Text;
            }
            procedimentos.Rows[i]["descricao"] = "";
            i++;
        }
    }

    private void PreencheEquipamento()
    {
    }

    private void PreencheMaterial()
    {
        int i = 0;
        TextBox oTB;
        foreach (RepeaterItem oItem in rptMateriais.Items)
        {
            oTB = (TextBox)oItem.FindControl("txt_MateriaisEspeciais");
            if (!string.IsNullOrEmpty(oTB.Text))
            {
                materiais.Rows[i]["cod"] = oTB.Text;
            }
            oTB = (TextBox)oItem.FindControl("txt_Fornecedor");
            if (!string.IsNullOrEmpty(oTB.Text))
            {
                materiais.Rows[i]["fornecedor"] = oTB.Text;
            }
            oTB = (TextBox)oItem.FindControl("txt_materiaisQtde");
            if (!string.IsNullOrEmpty(oTB.Text))
            {
                materiais.Rows[i]["quantidade"] = oTB.Text;
            }
            i++;
        }
    }

    protected void btnInserirEquipamento_Click(object sender, EventArgs e)
    {
    }


    protected void btnInserirProcedimento_Click(object sender, EventArgs e)
    {
        PreencheEquipamento();
        PreencheProcedimento();
        PreencheMaterial();
        DataRow oRow;
        oRow = procedimentos.NewRow();
        oRow["id"] = ((Int32)procedimentos.Rows[procedimentos.Rows.Count - 1]["id"]) + 1;
        procedimentos.Rows.Add(oRow);
        rptProcedimentos.DataSource = procedimentos;
        rptProcedimentos.DataBind();
        Session["procedimentos"] = procedimentos;
    }

    protected void btnInserirMaterial_Click(object sender, EventArgs e)
    {
        PreencheEquipamento();
        PreencheProcedimento();
        PreencheMaterial();
        DataRow oRow;
        oRow = materiais.NewRow();
        oRow["id"] = ((Int32)materiais.Rows[materiais.Rows.Count - 1]["id"]) + 1;
        materiais.Rows.Add(oRow);
        rptMateriais.DataSource = materiais;
        rptMateriais.DataBind();
        Session["materiais"] = materiais;
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        PreencheEquipamento();
        PreencheProcedimento();
        PreencheMaterial();

        /*string email = "acirurgico@hospitalbrasil.com.br";
        string email_to = "acirurgico@hospitalbrasil.com.br";
        //string email_to = "rhselecao@hospitalassuncao.com.br";
        string email_from = "acirurgico@hospitalbrasil.com.br";*/

        string email = ConfigurationManager.AppSettings["mail_to"];
        string email_to = ConfigurationManager.AppSettings["mail_to"];
        //string email_to = "rhselecao@hospitalassuncao.com.br";
        string email_from = ConfigurationManager.AppSettings["mail_from"];

        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";

        string bodyhtml = "<table width=100% border=1 bordercolor=#000099 cellspacing=0 cellpadding=5><tr><td width=30%><img src='" + ConfigurationManager.AppSettings["logo"] + "' width=80% /></td><td valign=baseline align='center'><H2><strong><font color=#000099>Pré Agendamento Cirúrgico</font></strong></H2></td></tr></table><br><br>";
        bodyhtml += "<strong>Tipo de cirurgia: </strong>" + rdo_tipoCirurgia.SelectedValue + "<br />";
        bodyhtml += "<strong>Nome completo do paciente: </strong>" + txt_nome_paciente.Text + "<br />";
        bodyhtml += "<strong>Telefone:</strong> " + txt_telefone.Text + "<br />";
        bodyhtml += "<strong>Telefone celular:</strong> " + txt_telefoneCelular.Text + "<br />";
        bodyhtml += "<strong>Data de nascimento: </strong>" + txt_nascimento.Text + "<br />";
        bodyhtml += "<strong>Sexo: </strong>" + rdo_sexo.SelectedValue + "<br />";
        bodyhtml += "<font size='4'><strong>Informações do Convênio</strong></font><br /><br />";
        bodyhtml += "<strong>Convênio:</strong> " + txt_convenio.Text + "<br />";
        bodyhtml += "<strong>Plano:</strong> " + txt_plano.Text + "<br />";
        bodyhtml += "<strong>Tipo do plano: </strong>" + rdo_tipoplano.SelectedValue + "<br />";
        bodyhtml += "<strong>Acomodação: </strong>" + rdo_acomodacao.SelectedValue + "<br />";
        bodyhtml += "<strong>Produto: </strong>" + txt_produto.Text + "<br />";
        bodyhtml += "<strong>Código da Carteirinha: </strong>" + txt_codigoCarteirinha.Text + "<br />";
        bodyhtml += "<font size='4'><strong>Informações da equipe médica</strong></font> <br /><br/>";
        bodyhtml += "<strong>Nome do médico: </strong>" + txt_nome_medico.Text + "&nbsp;&nbsp;&nbsp; <strong>CRM:</strong> " + txt_crm.Text + "<br />";
        bodyhtml += "<strong>Telefone do médico:</strong> " + txt_telefone_medico.Text + "<br />";
        bodyhtml += "<strong>E-mail: </strong>" + txt_email.Text + "<br />";
        bodyhtml += "<strong>1º auxiliar: </strong>" + txt_auxiliar_nome1.Text + " - CRM: " + txt_auxiliar_crm1.Text + "<br />";
        bodyhtml += "<strong>2º auxiliar: </strong>" + txt_auxiliar_nome2.Text + " - CRM: " + txt_auxiliar_crm2.Text + "<br /><br />";
        bodyhtml += "<font size='4'><strong>Informações para agendamento</strong></font><br /><br />";
        bodyhtml += "<strong>Data da Cirurgia / Exame: </strong>" + txt_data_cirurgia.Text + "&nbsp;&nbsp;&nbsp; <strong>Hora:</strong> " + txt_hora_cirurgia.Text + "<br />";
        bodyhtml += "<strong>Tempo Previsto:</strong> " + txt_tempo_cirurgia.Text + "<br />";
        bodyhtml += "<strong>CID:</strong> " + txt_CID.Text + "&nbsp;&nbsp;&nbsp; <strong>Diagnóstico:</strong> " + txt_diagnostico.Text + "<br />";
        bodyhtml += "<strong>Lateralidade:</strong> " + rdo_Lateralidade.SelectedValue + "<br />";
        bodyhtml += "<strong>Paciente Alérgico a Latex:</strong> " + rdo_alergia_latex.SelectedValue + "<br />";
        bodyhtml += "<br />";
        bodyhtml += "<strong>Cod. Procedimento MAS/TUSS</strong> | <strong>Descrição da Cirurgia / do Exame</strong><br />";
        foreach (DataRow oRow in procedimentos.Rows)
        {
            if (!string.IsNullOrEmpty(oRow["cod"].ToString()))
            {
                bodyhtml += oRow["id"].ToString() + "° " + oRow["cod"].ToString() + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + oRow["descricao"].ToString() + "<br />";
            }
        }
        //if (txt_codProcedimentoMasTuss1.Text == "" || txt_codProcedimentoMasTuss1.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "1° " + txt_codProcedimentoMasTuss1.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame1.Text + "<br />";
        //}
        //if (txt_codProcedimentoMasTuss2.Text == "" || txt_codProcedimentoMasTuss2.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "2° " + txt_codProcedimentoMasTuss2.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame2.Text + "<br />";
        //}
        //if (txt_codProcedimentoMasTuss3.Text == "" || txt_codProcedimentoMasTuss3.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "3° " + txt_codProcedimentoMasTuss3.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame3.Text + "<br />";
        //}
        //if (txt_codProcedimentoMasTuss4.Text == "" || txt_codProcedimentoMasTuss4.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "4° " + txt_codProcedimentoMasTuss4.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame4.Text + "<br />";
        //}
        //if (txt_codProcedimentoMasTuss5.Text == "" || txt_codProcedimentoMasTuss5.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "5° " + txt_codProcedimentoMasTuss5.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame5.Text + "<br />";
        //}
        //if (txt_codProcedimentoMasTuss6.Text == "" || txt_codProcedimentoMasTuss6.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "6° " + txt_codProcedimentoMasTuss6.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame6.Text + "<br />";
        //}
        //if (txt_codProcedimentoMasTuss7.Text == "" || txt_codProcedimentoMasTuss7.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "7° " + txt_codProcedimentoMasTuss7.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame7.Text + "<br />";
        //}
        //if (txt_codProcedimentoMasTuss8.Text == "" || txt_codProcedimentoMasTuss8.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "8° " + txt_codProcedimentoMasTuss8.Text + "&nbsp;&nbsp;&nbsp;-<strong>Descrição:</strong> " + txt_DescricaoCirugiaExame8.Text + "<br />";
        //}


        if (txt_JustificativaProcedimento.Text != "") { }
        else
        {
            bodyhtml += "Justificativa para o procedimento: " + txt_JustificativaProcedimento.Text + "<br />";
        }


        bodyhtml += "<br />";
        //if (txt_equipamentosCaixas1.Text == "" || txt_equipamentosCaixas1.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "1° " + txt_equipamentosCaixas1.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade1.Text + "<br />";
        //}
        //if (txt_equipamentosCaixas2.Text == "" || txt_equipamentosCaixas2.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "2° " + txt_equipamentosCaixas2.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade2.Text + "<br />";
        //}
        //if (txt_equipamentosCaixas3.Text == "" || txt_equipamentosCaixas3.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "3° " + txt_equipamentosCaixas3.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade3.Text + "<br />";
        //}
        //if (txt_equipamentosCaixas4.Text == "" || txt_equipamentosCaixas4.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "4° " + txt_equipamentosCaixas4.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade4.Text + "<br />";
        //}
        //if (txt_equipamentosCaixas5.Text == "" || txt_equipamentosCaixas5.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "5° " + txt_equipamentosCaixas5.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade5.Text + "<br />";
        //}
        //if (txt_equipamentosCaixas6.Text == "" || txt_equipamentosCaixas6.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "6° " + txt_equipamentosCaixas6.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade6.Text + "<br />";
        //}
        //if (txt_equipamentosCaixas7.Text == "" || txt_equipamentosCaixas7.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "7° " + txt_equipamentosCaixas7.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade7.Text + "<br />";
        //}
        //if (txt_equipamentosCaixas8.Text == "" || txt_equipamentosCaixas8.Text == null)
        //{

        //}
        //else {
        //    bodyhtml += "8° " + txt_equipamentosCaixas8.Text + "&nbsp;&nbsp;&nbsp;-<strong>Quantidade:</strong> " + txt_quantidade8.Text + "<br />";
        //}
        bodyhtml += "<br />";
        if (materiais.Rows.Count > 0)
        {
            //if (txt_MateriaisEspeciais1.Text != "")

            bodyhtml += "<table cellspacing=5>";
            bodyhtml += "<tr>";
            bodyhtml += "<td width=300><strong>Materiais especiais / OPME</strong></td>";
            bodyhtml += "<td width=300><strong>Fornecedor</strong></td>";
            bodyhtml += "<td width=200><strong>Quantidade</strong></td>";
            bodyhtml += "</tr>";
            foreach (DataRow oRow in materiais.Rows)
            {
                if (!string.IsNullOrEmpty(oRow["cod"].ToString()))
                {
                    bodyhtml += "<tr>";
                    bodyhtml += "<td width=300>" + oRow["id"].ToString() + "° " + oRow["cod"].ToString() + "</td>";
                    bodyhtml += "<td width=300>" + oRow["fornecedor"].ToString() + "</td>";
                    bodyhtml += "<td width=200>" + oRow["quantidade"].ToString() + "</td>";
                    bodyhtml += "</tr>";
                }
            }

            //    if (txt_MateriaisEspeciais1.Text == "" || txt_MateriaisEspeciais1.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>1° " + txt_MateriaisEspeciais1.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor1.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde1.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais2.Text == "" || txt_MateriaisEspeciais2.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>2° " + txt_MateriaisEspeciais2.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor2.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde2.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais3.Text == "" || txt_MateriaisEspeciais3.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>3° " + txt_MateriaisEspeciais3.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor3.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde3.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais4.Text == "" || txt_MateriaisEspeciais4.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>4° " + txt_MateriaisEspeciais4.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor4.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde4.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais5.Text == "" || txt_MateriaisEspeciais5.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>5° " + txt_MateriaisEspeciais5.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor5.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde5.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais6.Text == "" || txt_MateriaisEspeciais6.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>6° " + txt_MateriaisEspeciais6.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor6.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde6.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais7.Text == "" || txt_MateriaisEspeciais7.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>7° " + txt_MateriaisEspeciais7.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor7.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde7.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais8.Text == "" || txt_MateriaisEspeciais8.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>8° " + txt_MateriaisEspeciais8.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor8.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde8.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais9.Text == "" || txt_MateriaisEspeciais9.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>9° " + txt_MateriaisEspeciais9.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor9.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde9.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            //    if (txt_MateriaisEspeciais10.Text == "" || txt_MateriaisEspeciais10.Text == null)
            //    {

            //    }
            //    else
            //    {
            //        bodyhtml += "<tr>";
            //        bodyhtml += "<td width=300>10° " + txt_MateriaisEspeciais10.Text + "</td>";
            //        bodyhtml += "<td width=300>" + txt_Fornecedor10.Text + "</<td>";
            //        bodyhtml += "<td width=200>" + txt_materiaisQtde10.Text + "</<td>";
            //        bodyhtml += "</tr>";
            //    }
            bodyhtml += "</table>";
        }//fim do if txt_MateriaisEspeciais1.Text !=""

        bodyhtml += "<br />";
        bodyhtml += "<h2><strong>Reservas</strong></h2>";
        bodyhtml += rdo_reserva.SelectedValue + "<br />";
        if (txt_biopsiaCongelacao.Text != "")
        {
            bodyhtml += "<strong>Biópsia de Congelação – Laboratório:</strong> " + txt_biopsiaCongelacao.Text;
        }
        bodyhtml += "<br />";
        if (txt_video.Text != "")
        {
            bodyhtml += "<strong>Video: </strong>" + txt_video.Text;
        }
        bodyhtml += "<br />";
        if (txt_escopia.Text != "")
        {
            bodyhtml += "<strong>Escopia: </strong>" + txt_escopia.Text;
            bodyhtml += "<br />";
        }
        if (txt_microscopio.Text != "")
        {
            bodyhtml += "<strong>Microscopio: </strong>" + txt_microscopio.Text;
            bodyhtml += "<br />";
        }
        if (txt_tipo_sangue.Text != "")
        {
            bodyhtml += "<strong>Reserva de Sangue tipo: </strong>" + txt_tipo_sangue.Text;
        }
        bodyhtml += "<br />";
        if (txt_outros.Text != "")
        {
            bodyhtml += "<strong>Outros:</strong> " + txt_outros.Text;
        }
        bodyhtml += "<br /><br /><br /><table width=100% border=1 bordercolor=#000099 cellspacing=0 cellpadding=5><tr><td width=20%><img src='" + ConfigurationManager.AppSettings["logo"] + "' width=80% /></td><td valign='middle' align='right'><font color=#000099>&nbsp;</font></td></tr></table>";

        int iport = 25;
        try
        {
            iport = Convert.ToInt32(ConfigurationManager.AppSettings["port"]);
        }
        catch
        {
            iport = 25;
        }

        SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["smtp"], iport);
        //cliente.EnableSsl = ture;

        MailAddress remetente = new MailAddress(email_from);
        MailAddress destinatario = new MailAddress(email_to);
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = bodyhtml;
        mensagem.Subject = ConfigurationManager.AppSettings["mail_subject"];
        bool enableSsl = true;
        enableSsl = ConfigurationManager.AppSettings["enableSsl"].ToLower() =="true";
        cliente.EnableSsl = enableSsl;
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        NetworkCredential credenciais = new NetworkCredential(ConfigurationManager.AppSettings["smpt_usuario"], ConfigurationManager.AppSettings["smpt_senha"], "");
        //            NetworkCredential credenciais = new 
        cliente.Credentials = credenciais;
        bool ok = false;
        try
        {
            cliente.Send(mensagem);
            Session["html"] = bodyhtml;
            ok = true;
        }
        catch (Exception ex)
        {
            Session["Error"] = ex;
            if (Request["debug"] != null)
            {
                Response.Write(@"<script>alert('" + ex.Message + ". \n " + ex.StackTrace + ".');//location.href='formSL.aspx';</script>");
            }
            else
            {
                Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');//location.href='formSL.aspx';</script>");
            }
            Response.Write(ex.Message);
        }
        if (ok)
            Response.Redirect("Confirmar.aspx");

    }

}