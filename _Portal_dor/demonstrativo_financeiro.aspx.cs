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
        //int id = Convert.ToInt32(Request.QueryString["id"]);
        //var paginas = (from v in cnDor.TB_PORTAL_CONTEUDO where v.id_conteudo == id select v).FirstOrDefault();
        lbl_titulo.Text = "Demonstrativo Financeiro";
        ltlResumo.Text = "";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string nome = txtnome.Text;
        string email = txtemail.Text;
        string telefone = txttelefone.Text;
        string empresa = txtEmpresa.Text;
        string Sobrenome = txtSobrenome.Text;
        string rg = txtRG.Text;
        string cpf = txtCPF.Text;
        string passaport = txtPassaport.Text;
        // email_to = "diego@connexion.com.br";
        string email_to = ConfigurationManager.AppSettings["EmailDemostrativoFinanceiro"];

        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";

        string mailbody = "<H2>Consulta de Demonstrativo Financeiro</H2>";
        mailbody = mailbody + "<strong>Nome: </strong>" + nome + "<br />";
        mailbody = mailbody + "<strong>Sobrenome: </strong>" + Sobrenome + "<br />";
        mailbody = mailbody + "<strong>Empresa: </strong>" + empresa + "<br />";
        mailbody = mailbody + "<strong>Telefone: </strong>" + telefone + "<br />";
        mailbody = mailbody + "<strong>E-mail: </strong>" + email + "<br />";
        mailbody = mailbody + "<strong>RG: </strong>" + rg + "<br />";
        mailbody = mailbody + "<strong>cpf: </strong>" + cpf + "<br />";
        mailbody = mailbody + "<strong>passaport: </strong>" + passaport + "<br />";
        mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        mailbody = mailbody + "<p>Este é um email que foi enviado automaticamente após o preenchimento de um formulário presente em seu web site. Em caso de problemas por favor entre em contato conosco via email (suporte@connexion.com.br).";

        SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["stmpServer"]);
        cliente.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSsl"]);
        cliente.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPorta"]);
        MailAddress remetente = new MailAddress(ConfigurationManager.AppSettings["emailRemetente"]);
        MailAddress destinatario = new MailAddress(email_to);
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Consulta de Demonstrativo Financeiro";
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        NetworkCredential credenciais = new NetworkCredential(ConfigurationManager.AppSettings["smtpUser"], ConfigurationManager.AppSettings["smtpPassWord"], "");
        cliente.Credentials = credenciais;

        try
        {
            cliente.Send(mensagem);
            //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        }
        catch
        {
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
        }
        Response.Redirect("demostrativo_finaceiro_lista.aspx");
    }
}
