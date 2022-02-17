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
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb00 = paginas.Get_select_id(id);
        string titulo = (string)tb00.Rows[0]["titulo"];
        lbl_titulo.Text = titulo;


    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string nome = txtnome.Text;
        string email = txtemail.Text;
        string seunome = txtseunome.Text;
        string quarto = txtquarto.Text;
        string msg = txtmensagem.Text;
        //string email_to = "diego@connexion.com.br";
        string email_to = "ouvidoria@hospitalbrasil.com.br";

        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";

        string mailbody = "<H2>Mensagem para Paciente</H2>";
        mailbody = mailbody + "<strong>Nome do paciente: </strong>" + nome + "<br />";
        mailbody = mailbody + "<strong>N° do quarto-leito: </strong>" + quarto + "<br />";
        mailbody = mailbody + "<strong>Remetente da mensagem: </strong>" + seunome + "<br />";
        mailbody = mailbody + "<strong>E-mail do remetente: </strong>" + email + "<br />";
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
        mensagem.Subject = "Mensagem para Paciente";
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
        }
    }
}
