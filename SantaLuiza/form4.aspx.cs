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
        var paginas = (from v in cnDor.TB_PORTAL_CONTEUDO where v.id_conteudo == id select v).FirstOrDefault();
        lbl_titulo.Text = paginas.nm_titulo;
        ltlResumo.Text = paginas.ds_resumo;
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


    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        /*string nome = txtnome.Text;
        string email = txtemail.Text;
        string telefone = txttelefone.Text;
        string empresa = txtempresa.Text;
        string msg = txtmensagem.Text;
        string assunto = txtassunto.Text;
        string email_to = "diego@connexion.com.br";
        //string email_to = "sac@hospitalassuncao.com.br";

        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";

        string mailbody = "<H2>MENSAGEM DE CONTATO DO SITE</H2>";
        mailbody = mailbody + "<strong>Nome: </strong>" + nome + "<br />";
        mailbody = mailbody + "<strong>Empresa: </strong>" + empresa + "<br />";
        mailbody = mailbody + "<strong>Telefone: </strong>" + telefone + "<br />";
        mailbody = mailbody + "<strong>E-mail: </strong>" + email + "<br />";
        mailbody = mailbody + "<strong>Assunto: </strong>" + assunto + "<br />";
        mailbody = mailbody + "<strong>Mensagem: </strong>" + msg + "<br />";
        mailbody = mailbody + "<strong>IP do usuário: </strong>" + ip + "<br />";
        mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        mailbody = mailbody + "<p>Este é um email que foi enviado automaticamente após o preenchimento de um formulário presente em seu web site. Em caso de problemas por favor entre em contato conosco via email (suporte@connexion.com.br).";

        SmtpClient cliente = new SmtpClient("smtp.connexion.com.br");
        //cliente.EnableSsl = ture;
        MailAddress remetente = new MailAddress(email);
        MailAddress destinatario = new MailAddress(email_to);
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Contato via formulario web";
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        NetworkCredential credenciais = new NetworkCredential("siterapido@connexion.com.br", "conn001", "");
        cliente.Credentials = credenciais;

        try
        {
            cliente.Send(mensagem);
            Response.Write(@"<script>alert('Sua mensagem foi enviada com sucesso \n Obrigado.');location.href='default.aspx';</script>");
            //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        }
        catch
        {
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');location.href='contato.aspx';</script>");
        }*/
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string area_atuacao = drp_area_atuacao.SelectedValue;
        string cargo = txt_cargo.Text;
        string salario = txt_salario.Text;
        string nome = txt_nome.Text;
        string nascimento = txt_nascimento.Text;
        string endereco = txt_endereco.Text;
        string cep = txt_cep.Text;
        string bairro = txt_bairro.Text;
        string cidade = txt_cidade.Text;
        string estado = drp_estado.SelectedValue;
        string telefone = txt_telefone.Text;
        string email = txt_email.Text;
        string estado_civil = drp_estado_civil.SelectedValue;
        string sexo = rdo_sexo.SelectedValue;
        string empresa1 = txt_empresa1.Text;
        string admissao1 = txt_admissao1.Text;
        string cargo1 = txt_cargo1.Text;
        string desligamento1 = txt_desligamento1.Text;
        string atividades1 = txt_atividades1.Text;
        string empresa2 = txt_empresa2.Text;
        string admissao2 = txt_admissao2.Text;
        string cargo2 = txt_cargo2.Text;
        string desligametno2 = txt_desligamento2.Text;
        string atividades2 = txt_atividades2.Text;
        string empresa3 = txt_empresa3.Text;
        string admissao3 = txt_admissao3.Text;
        string cargo3 = txt_cargo3.Text;
        string desligamento3 = txt_desligamento3.Text;
        string atividades3 = txt_atividades3.Text;
        string formacao = txt_formacao.Text;
        string cursos = txt_cursos.Text;
        string informacoes = txt_informacoes.Text;

        string email_to = ConfigurationManager.AppSettings["EmailForm4"];
        //string email_to = "rhselecao@hospitalassuncao.com.br";

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
        string mailbody = "<H2>Trabalhe Aqui - " + site + "</H2>";
        mailbody = mailbody + "<strong>Área desejada: </strong>"+area_atuacao+"<br />";
        mailbody = mailbody + "<strong>Cargo de interesse: </strong>"+cargo+"<br />";
        mailbody = mailbody + "<strong>Salário pretendido: </strong>"+salario+"<br />";
        mailbody = mailbody + "<br /><strong>Dados Pessoais </strong><br />";
        mailbody = mailbody + "<strong>Nome: </strong>"+nome+"<br />";
        mailbody = mailbody + "<strong>Nascimento: </strong>"+nascimento+"<br />";
        mailbody = mailbody + "<strong>Endereço: </strong>"+endereco+"<br />";
        mailbody = mailbody + "<strong>CEP: </strong>"+cep+"<br />";
        mailbody = mailbody + "<strong>Bairro: </strong>"+bairro+"<br />";
        mailbody = mailbody + "<strong>Cidade: </strong>"+cidade+"<br />";
        mailbody = mailbody + "<strong>Estado: </strong>"+estado+"<br />";
        mailbody = mailbody + "<strong>Telefone: </strong>"+telefone+"<br />";
        mailbody = mailbody + "<strong>E-mail: </strong>"+email+"<br />";
        mailbody = mailbody + "<strong>Estado Civil: </strong>"+estado_civil+"<br />";
        mailbody = mailbody + "<strong>Sexo: </strong>"+sexo+"<br />";
        mailbody = mailbody + "<br /><strong>Dados Profissionais </strong><br />";
        mailbody = mailbody + "<strong><u>Último Trabalho</u></strong><br />";
        mailbody = mailbody + "<strong>Empresa: </strong>"+empresa1+"<br />";
        mailbody = mailbody + "<strong>Admissão: </strong>"+admissao1+"<br />";
        mailbody = mailbody + "<strong>Desligamento: </strong>"+desligamento1+"<br />";
        mailbody = mailbody + "<strong>Cargo: </strong>"+cargo1+"<br />";
        mailbody = mailbody + "<strong>Atividades desenvolvidas: </strong>"+atividades1+"<br />";
        mailbody = mailbody + "<strong><u>Penúltimo Trabalho</u></strong><br />";
        mailbody = mailbody + "<strong>Empresa: </strong>"+empresa2+"<br />";
        mailbody = mailbody + "<strong>Admissão: </strong>"+admissao2+"<br />";
        mailbody = mailbody + "<strong>Desligamento: </strong>"+desligametno2+"<br />";
        mailbody = mailbody + "<strong>Cargo: </strong>"+cargo2+"<br />";
        mailbody = mailbody + "<strong>Atividades desenvolvidas: </strong>"+atividades2+"<br />";
        mailbody = mailbody + "<strong><u>Antepenúltimo Trabalho</u></strong><br />";
        mailbody = mailbody + "<strong>Empresa: </strong>"+empresa3+"<br />";
        mailbody = mailbody + "<strong>Admissão: </strong>"+admissao3+"<br />";
        mailbody = mailbody + "<strong>Desligamento: </strong>"+desligamento3+"<br />";
        mailbody = mailbody + "<strong>Cargo: </strong>"+cargo3+"<br />";
        mailbody = mailbody + "<strong>Atividades desenvolvidas: </strong>"+atividades3+"<br />";
        mailbody = mailbody + "<strong><br />Formação acadêmica: </strong>"+formacao+"<br />";
        mailbody = mailbody + "<strong><br />Cursos / Palestras: </strong>"+cursos+"<br />";
        mailbody = mailbody + "<strong><br />Informações Adicionais: </strong>"+informacoes+"<br />";

        mailbody = mailbody + "<strong>IP do usuário: </strong>" + ip + "<br />";
        mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        mailbody = mailbody + "<p>Este é um email que foi enviado automaticamente após o preenchimento de um formulário presente em seu web site. Em caso de problemas por favor entre em contato conosco via email (suporte@connexion.com.br).";

        SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["stmpServer"]);
        cliente.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSsl"]);
        cliente.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPorta"]);
        MailAddress remetente = new MailAddress(ConfigurationManager.AppSettings["emailRemetente"]);
        MailAddress destinatario = new MailAddress(email_to);
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Trabalhe Aqui";
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        NetworkCredential credenciais = new NetworkCredential(ConfigurationManager.AppSettings["smtpUser"], ConfigurationManager.AppSettings["smtpPassWord"], "");
        cliente.Credentials = credenciais;

        try
        {
            cliente.Send(mensagem);
            Response.Write(@"<script>alert('Sua mensagem foi enviada com sucesso \n Obrigado.');location.href='default.aspx';</script>");
            //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        }
        catch
        {
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');location.href='default.aspx';</script>");
        }

    }
}
