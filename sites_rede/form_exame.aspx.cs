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


        if (!Page.IsPostBack)
        {
            dropAno.Items.Add(new ListItem() { Text = "Ano", Value = "", Selected = true });
            for (int i = 2015; i <= DateTime.Now.Year; i++)
            {
                dropAno.Items.Add(new ListItem() { Text = i.ToString(), Value = i.ToString() });
            }
            dropAno.DataBind();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        

        //string email_to = ConfigurationManager.AppSettings["EmailForm1"];

        //var sites = (from a in cnDor.TB_HOSPITAL where a.id_hospital == idHosp select a).FirstOrDefault();
        //if (sites != null)
        //{
        //    site = sites.nm_hospital;
        //}
        //string mailbody = "<H2>MENSAGEM DE CONTATO DO SITE " + site + "</H2>";
        //mailbody = mailbody + "<strong>Nome: </strong>" + nome + "<br />";
        //mailbody = mailbody + "<strong>Telefone: </strong>" + telefone + "<br />";
        //mailbody = mailbody + "<strong>E-mail: </strong>" + email + "<br />";
        //mailbody = mailbody + "<strong>Estado: </strong>" + estado + "<br />";
        //mailbody = mailbody + "<strong>Unidade: </strong>" + unidade + "<br />";
        //mailbody = mailbody + "<strong>Departamento: </strong>" + departamento + "<br />";
        //mailbody = mailbody + "<strong>Assunto: </strong>" + assunto + "<br />";
        //mailbody = mailbody + "<strong>Mensagem: </strong>" + msg + "<br />";
        //mailbody = mailbody + "<strong>IP do usuário: </strong>" + ip + "<br />";
        //mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        //mailbody = mailbody + "<p>Este é um email que foi enviado automaticamente após o preenchimento de um formulário presente em seu web site. Em caso de problemas por favor entre em contato conosco via email (suporte@connexion.com.br).";

        //SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["stmpServer"]);
        //cliente.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSsl"]);
        //cliente.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPorta"]);
        //MailAddress remetente = new MailAddress(ConfigurationManager.AppSettings["emailRemetente"]);

        //MailAddress destinatario;
        //try
        //{
        //    destinatario = new MailAddress(Session["email"].ToString());
        //}
        //catch
        //{
        //    destinatario = new MailAddress(ConfigurationManager.AppSettings["EmailForm1"]);
        //}

        //var contato = (from a in cnDor.TB_HOSPITAL_DEPT_CONTATO join b in cnDor.TB_HOSPITAL on a.id_hospital equals b.id_hospital where b.nm_hospital == unidade && a.ds_departamento == departamento select a).FirstOrDefault();
        //if (contato != null)
        //{
        //    destinatario = new MailAddress(contato.ds_contato);
        //}

        //MailMessage mensagem = new MailMessage(remetente, destinatario);
        //mensagem.Body = mailbody;
        //mensagem.Subject = "Contato via formulario web";
        //mensagem.IsBodyHtml = true;
        //mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        //mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        //NetworkCredential credenciais = new NetworkCredential(ConfigurationManager.AppSettings["smtpUser"], ConfigurationManager.AppSettings["smtpPassWord"], "");
        //cliente.UseDefaultCredentials = true;
        //cliente.Credentials = credenciais;


        //try
        //{
        //    cliente.Send(mensagem);
        //    Response.Write(@"<script>alert('Sua mensagem foi enviada com sucesso \n Obrigado.');location.href='default.aspx';</script>");
        //    //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        //}
        //catch (Exception ex)
        //{
        //    //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
        //    Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');location.href='default.aspx';</script>");
        //}
    }
    
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";
        string site = "";
        int idHosp = 0;
        int.TryParse(Session["idHosp"].ToString(), out idHosp);

        string nome = txtnome.Text;
        string email = txtemail.Text;
        string telefone = txttelefone.Text;
        string celular = txtCelular.Text;
        string msg = txtmensagem.Text;
        string mes = dropMes.SelectedValue;
        string ano = dropAno.SelectedValue;
        string atendimento = rdoTipo.SelectedValue;
        string observacao = txtmensagem.Text;
        var Form = new db_rede_dorModel.TB_FORMULARIO_EXAMES() { ds_atendimento = atendimento, ds_data_nascimento = email, ds_nome = nome, ds_observacao = observacao, ds_telefone_celular = celular, ds_telefone_fixo = telefone, dt_atendimento = Convert.ToDateTime(txtDataAtendimento.Text), dt_solicitacao = DateTime.Now, id_hospital = idHosp };
        cnDor.AddToTB_FORMULARIO_EXAMES(Form);
        int j = cnDor.SaveChanges();

        Form = cnDor.TB_FORMULARIO_EXAMES.ToList().LastOrDefault();
        idForm.Value = Form.id_exames_imagem.ToString();

        txtCelular.ReadOnly = true;

        txtemail.ReadOnly = true;
        txtmensagem.ReadOnly = true;
        txtnome.ReadOnly = true;
        txttelefone.ReadOnly = true;
        trProtocolo.Visible = true;
        idProtocolo.Text = idForm.Value;
        dtSolicitacao.Text = Form.dt_solicitacao.ToString("dd/MM/yyyy HH:mm");
        tr1.Visible = false;
        tr2.Visible = true;
        tr3.Visible = true;

    }

    protected void btnEnviar0_Click(object sender, EventArgs e)
    {



        string nome = txtnome.Text;
        string email = txtemail.Text;
        string telefone = txttelefone.Text;
        string celular = txtCelular.Text;
        string msg = txtmensagem.Text;
        string mes = dropMes.SelectedValue;
        string ano = dropAno.SelectedValue;
        string atendimento = rdoTipo.SelectedValue;
        string observacao = txtmensagem.Text;
        string email_to = txtEmail2.Text;

        string mailbody = "<H2>Solicitação de Exame de Imagem e Analises Clínicas</H2>";
        mailbody = mailbody + "<strong>Protocolo: " + idForm.Value + "</strong><br />";
        mailbody = mailbody + "<strong>Nome: </strong>" + nome + "<br />";
        mailbody = mailbody + "<strong>Data de Nascimento: </strong>" + email + "<br />";
        mailbody = mailbody + "<strong>Data Exame: </strong>" + mes + "/" + ano + "<br />";
        mailbody = mailbody + "<strong>Tipo de Atendimento: </strong>" + atendimento + "<br />";
        mailbody = mailbody + "<strong>Telefone fixo: </strong>" + telefone + "<br />";
        mailbody = mailbody + "<strong>Celular: </strong>" + celular + "<br />";
        mailbody = mailbody + "<strong>Observação: </strong>" + observacao + "<br />";
        mailbody = mailbody + "<strong>Data da Solicitação: </strong>" + dtSolicitacao.Text + "<br />";
        mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        mailbody = mailbody + "Após a solicitação, o prazo é de 3 dias úteis para retirada<br /><br />";

        SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["stmpServer"]);
        cliente.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSsl"]);
        cliente.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPorta"]);
        MailAddress remetente = new MailAddress(ConfigurationManager.AppSettings["emailRemetente"]);

        MailAddress destinatario;
        try
        {
            destinatario = new MailAddress(email_to);
        }
        catch
        {
            destinatario = new MailAddress(ConfigurationManager.AppSettings["EmailForm1"]);
        }

        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Solicitação de Exame de Imagem e Analises Clínicas";
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        NetworkCredential credenciais = new NetworkCredential(ConfigurationManager.AppSettings["smtpUser"], ConfigurationManager.AppSettings["smtpPassWord"], "");
        cliente.UseDefaultCredentials = true;
        cliente.Credentials = credenciais;


        try
        {
            cliente.Send(mensagem);
            Response.Write(@"<script>alert('Sua mensagem foi enviada com sucesso \n Obrigado.');</script>");
            //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        }
        catch (Exception ex)
        {
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');</script>");
            Response.Write(@"<!-- Erro: " + ex.Message + " -->");
        }
    }

    protected void btnEnviar1_Click(object sender, EventArgs e)
    {

    }
}
