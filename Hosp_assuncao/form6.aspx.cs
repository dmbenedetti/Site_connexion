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
        string telefone = txttelefone.Text;
        /*string msg = txtmensagem.Text;*/
        string datanasc = txtNascimento.Text;
        string RG = txtRG.Text;
        string dataexame = txtDataExame.Text;
        string exame = "";
        string numero = txtNumero.Text;

        foreach (ListItem item in ltsExame.Items)
        {
            if (item.Selected)
            {
                if (exame != "")
                {
                    exame += ", ";
                }
                exame += item.Value;
            }
        }

        string email_to = "laudos@hospitalassuncao.com.br";
        //string email_to = "benedetti@gmail.com";

        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";

        string mailbody = "<H2>MENSAGEM DE SOLICITAÇÃO DE RESULTADO DE EXAME</H2>";
        mailbody = mailbody + "<strong>Nome completo do paciente: </strong>" + nome + "<br />";
        mailbody = mailbody + "<strong>Data de Nascimento: </strong>" + datanasc + "<br />";
        mailbody = mailbody + "<strong>RG: </strong>" + RG + "<br />";
        mailbody = mailbody + "<strong>Telefone para contato: </strong>" + telefone + "<br />";
        mailbody = mailbody + "<strong>Data do atendimento/realização do exame: </strong>" + dataexame + "<br />";
        mailbody = mailbody + "<strong>Exame solicitado: </strong>" + exame + "<br />";
        mailbody = mailbody + "<strong>Número do Atendimento / Prescrição: </strong>" + numero + "<br />";
        mailbody = mailbody + "<strong>E-mail: </strong>" + email + "<br />";
      /*  <!--mailbody = mailbody + "<strong>Observação: </strong>" + msg.Replace("\n", "<br>") + "<br />";-->*/
        mailbody = mailbody + "<strong>IP do usuário: </strong>" + ip + "<br />";
        mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        mailbody = mailbody + "<p>Este é um email que foi enviado automaticamente após o preenchimento de um formulário presente em seu web site. Em caso de problemas por favor entre em contato conosco via email (suporte@connexion.com.br).";

        SmtpClient cliente = new SmtpClient("smtp.saoluizhospital.com.br");
        //cliente.EnableSsl = false;
        MailAddress remetente = new MailAddress(email_to);
        MailAddress destinatario = new MailAddress(email_to);
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Contato via formulario web";
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        NetworkCredential credenciais = new NetworkCredential("site@saoluizhospital.com.br", "sa2345al", "");
        cliente.Credentials = credenciais;

        try
        {
            cliente.Send(mensagem);
            //Response.Write(@"<script>alert('Sua mensagem foi enviada com sucesso \n Obrigado.');</script>");
            dvMsg.Visible = true;
            table_contato.Visible = false;
            //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        }
        catch (Exception ex)
        {
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');</script>");
        }
    }
}
