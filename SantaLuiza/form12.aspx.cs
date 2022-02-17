using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net; // importe o namespace .Net
using System.Net.Mail; // importe o namespace .Net.Mail
using System.Text;
using System.IO;

public partial class form12 : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "default.aspx" select a).FirstOrDefault();
        if (metatags != null)
        {
            ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
        }
        metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.id_conteudo == id select a).FirstOrDefault();
        if (metatags != null)
        {
            ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
        }

        var paginas = (from v in cnDor.TB_PORTAL_CONTEUDO where v.id_conteudo == id select v).FirstOrDefault();
        lbl_titulo.Text = paginas.nm_titulo;
        //ltlResumo.Text = paginas.ds_resumo;
        Session["email"] = paginas.ds_email_form;

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string nome = txtDataCesaria.Text;
        string email = txtHora.Text;
        string telefone = "";
        string msg = "";
        string assunto = "";
        string estado, unidade, departamento;
        estado = "";
        unidade = "";
        departamento = "";
        // email_to = "diego@connexion.com.br";
        string email_to = ConfigurationManager.AppSettings["EmailForm1"];

        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";
        string site = "";
        int idHosp = 0;
        int.TryParse(Session["idHosp"].ToString(), out idHosp);
        var sites = (from a in cnDor.TB_HOSPITAL where a.id_hospital == idHosp select a).FirstOrDefault();
        if (sites != null)
        {
            site = sites.nm_hospital;
        }
        string mailbody = "<H2>Agendamento para Cesariana " + site + "</H2>";
        mailbody = mailbody + "<strong>Data: </strong>" + txtDataCesaria.Text + "<br />";
        mailbody = mailbody + "<strong>Hora: </strong>" + txtHora.Text + "<br />";
        mailbody = mailbody + "<strong>Duração: </strong>" + drpDuracao.SelectedValue + "<br />";
        mailbody = mailbody + "<strong>Nome Completo do Pasciente: </strong>" + txtNomePasciente.Text + "<br />";
        mailbody = mailbody + "<strong>Data de Nascimento: </strong>" + txtDataNascimento.Text + "<br />";
        mailbody = mailbody + "<strong>Telefone de contato (celular) : </strong>" + txtTelContato.Text + "<br / ><br />";
        mailbody = mailbody + "<strong>Telefone de contato (fixo) : </strong>" + txtTelContato2.Text + "<br / ><br />";
        mailbody = mailbody + "<strong>Informação do convênio </strong><br />";
        mailbody = mailbody + "<strong>Convênio: </strong>" + txtConvenio.Text + "<br /><br />";
        mailbody = mailbody + "<strong>Informações da equipe médica  </strong><br />";
        mailbody = mailbody + "<strong>Nome do Obstetra: </strong>" + txtNomeObstetra.Text + "<br />";
        mailbody = mailbody + "<strong>CRM: </strong>" + txtCRM.Text + "<br />";
        mailbody = mailbody + "<strong>Telefone celular do Obstetra: </strong>" + txtTelObstreta.Text + "<br />";
        mailbody = mailbody + "<strong>Telefone fixo do Obstetra: </strong>" + txtTelObstreta.Text + "<br />";
        mailbody = mailbody + "<strong>E-mail: </strong>" + txtEmailObtetra.Text + "<br />";
        mailbody = mailbody + "<strong>Nome do auxiliar: </strong>" + txtNomeAuxiliar.Text + "<br /><br />";
        mailbody = mailbody + "<strong>Informações para agendamento</strong><br />";
        mailbody = mailbody + "<strong>Código da cesariana AMB/TUSS (1º e 2º e arquivo): </strong>" + txtAMB.Text + "<br />";
        mailbody = mailbody + "<strong>Quantas semanas de gestação: </strong>" + drpTempoGestacao.SelectedValue + "<br />";
        mailbody = mailbody + "<strong>Gestação única: </strong>" + drpGestacaoUnica.SelectedValue + "<br />";
        mailbody = mailbody + "<strong>Alergia a látex: </strong>" + drpAlergia.SelectedValue + "<br />";
        mailbody = mailbody + "<strong>Reserva de sangue: </strong>" + txtReservaSangue.Text + "<br />";
        mailbody = mailbody + "<strong>Comorbidades Maternas: </strong>" + txtComorbidades.Text + "<br />";
        mailbody = mailbody + "<strong>Medicamentos em uso durante a gestação: </strong>" + txtMedicamentos.Text + "<br />";
        mailbody = mailbody + "<strong>Alterações fetais conhecidas: </strong>" + txtAlteracoesFetais.Text + "<br /><br />";
        mailbody = mailbody + "<strong>Informações para agendamento</strong><br />";
        mailbody = mailbody + "<strong>UTI Neonatal: </strong>" + drpNeonatal.SelectedValue + "<br /><br />";
        mailbody = mailbody + "<strong>Observações (informações complementares): </strong>" + txtObs.Text + "<br />";

        mailbody = mailbody + "<strong>IP do usuário: </strong>" + ip + "<br />";
        mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        mailbody = mailbody + "<p>Este é um email que foi enviado automaticamente após o preenchimento de um formulário presente em seu web site. Em caso de problemas por favor entre em contato conosco via email (suporte@connexion.com.br).";

        SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["stmpServer"]);
        cliente.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSsl"]);
        cliente.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPorta"]);
        MailAddress remetente = new MailAddress(ConfigurationManager.AppSettings["emailRemetente"]);

        MailAddress destinatario;
        try
        {
            destinatario = new MailAddress(Session["email"].ToString());
        }
        catch
        {
            destinatario = new MailAddress(ConfigurationManager.AppSettings["EmailForm12"]);
        }

        var contato = (from a in cnDor.TB_HOSPITAL_DEPT_CONTATO join b in cnDor.TB_HOSPITAL on a.id_hospital equals b.id_hospital where b.nm_hospital == unidade && a.ds_departamento == departamento select a).FirstOrDefault();
        if (contato != null)
        {
            destinatario = new MailAddress(contato.ds_contato);
        }

        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Contato via formulario web";
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        if (fupArquivo1.HasFile)
        {
            mensagem.Attachments.Add(new Attachment(fupArquivo1.PostedFile.InputStream, fupArquivo1.PostedFile.FileName));
        }
        if (fupArquivo2.HasFile)
        {
            mensagem.Attachments.Add(new Attachment(fupArquivo2.PostedFile.InputStream, fupArquivo2.PostedFile.FileName));
        }
        NetworkCredential credenciais = new NetworkCredential(ConfigurationManager.AppSettings["smtpUser"], ConfigurationManager.AppSettings["smtpPassWord"], "");
        cliente.UseDefaultCredentials = true;
        cliente.Credentials = credenciais;



        try
        {
            cliente.Send(mensagem);
            Response.Write(@"<script>alert('Sua mensagem foi enviada com sucesso \n Obrigado.');location.href='default.aspx';</script>");
            //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        }
        catch (Exception ex)
        {
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');location.href='default.aspx';</script>");
        }
    }
}