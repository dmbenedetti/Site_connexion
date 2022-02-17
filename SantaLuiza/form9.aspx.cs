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


public partial class fale_conosco : System.Web.UI.Page
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
        ltlResumo.Text = paginas.ds_resumo;
        Session["email"] = paginas.ds_email_form;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string nome = txtnome.Text;
        string email = txtemail.Text;
        string telefone = txttelefone.Text;
        string msg = txtmensagem.Text;
        string cpf = txtCPF.Text;
        string rg = txtRG.Text;
        string telefone0 = txttelefone0.Text;
        string telefone1 = txttelefone1.Text;
        string ContatoNome = txtContatoNome.Text;
        string ContatoEmail = txtContatoEmail.Text;
        string ContatoTelefone = txttelefone2.Text;
        string tipoexame = drpModalidade.SelectedValue;
        string exame = drpExame.SelectedValue;
        string dataexame = txtDataExame.Text;
        string horaexame = txtHoraExame.Text;
        string datanascimento = txt_nascimento.Text;
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
        string mailbody = "<H2>Marcação Exame - Site: " + site + "</H2>";
        mailbody = mailbody + "<strong>Nome: </strong>" + nome + "<br />";
        mailbody = mailbody + "<strong>CPF: </strong>" + cpf + "<br />";
        mailbody = mailbody + "<strong>RG: </strong>" + rg + "<br />";
        mailbody = mailbody + "<strong>Telefone residencial: </strong>" + telefone + "<br />";
        mailbody = mailbody + "<strong>Telefone comercial: </strong>" + telefone0 + "<br />";
        mailbody = mailbody + "<strong>Telefone celular: </strong>" + telefone1 + "<br />";
        mailbody = mailbody + "<strong>E-mail: </strong>" + email + "<br />";
        mailbody = mailbody + "<strong>Data Nascimento: </strong>" + datanascimento + "<br />";
        mailbody = mailbody + "<strong>Modalidade da consulta: </strong>" + tipoexame + "<br />";
        mailbody = mailbody + "<strong>Exame: </strong>" + exame + "<br />";
        mailbody = mailbody + "<strong>Data e Hora do Exame: </strong>" + dataexame + " " + horaexame + "<br />";
        mailbody = mailbody + "<strong><br>Contato:<br />";
        mailbody = mailbody + "<strong>Nome do contato: </strong>" + ContatoNome + "<br />";
        mailbody = mailbody + "<strong>Telefone do contato: </strong>" + ContatoTelefone + "<br />";
        mailbody = mailbody + "<strong>Email do contato: </strong>" + ContatoEmail + "<br />";
        mailbody = mailbody + "<strong>Observações: </strong>" + msg + "<br />";
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
            destinatario = new MailAddress(ConfigurationManager.AppSettings["EmailForm1"]);
        }


        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Marcação Exame - Site: " + site;
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

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
