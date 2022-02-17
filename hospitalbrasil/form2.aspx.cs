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
        /*string nome = txtnome.Text;
        string email = txtemail.Text;
        string telefone = txttelefone.Text;
        string empresa = txtempresa.Text;
        string msg = txtmensagem.Text;
        string assunto = txtassunto.Text;
        //string email_to = "diego@connexion.com.br";
        string email_to = "sac@hospitalassuncao.com.br";

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
        string nome = txt_nome.Text;
        string data_nasc = data_dia.Text + "/" + data_mes.Text + "/" + data_ano.Text;
        string sexo = rdo_sexo.Text;
        string peso = txt_peso.Text;
        string email = txt_email.Text;
        string tel_res = "(" + txt_ddd_res.Text + ") " + txt_tel_res.Text;
        string tel_cel = "(" + txt_ddd_cel.Text + ") " + txt_tel_cel.Text;
        string tel_com = "(" + txt_ddd_com.Text + ") " + txt_tel_com.Text;
        string convenio = txt_convenio.Text;
        string plano = txt_plano.Text;
        string exames = txt_exames.Text;
        string data_pretendida = drp_data_dia.Text + "/"+drp_data_mes.Text + "/"+drp_data_ano.Text;
        string periodo = rdo_periodo.Text;
        // string email_to = "diego@connexion.com.br";
        string email_to = "central.reservas@saoluiz.com.br";

        string ip = "";
        IPAddress[] addressList = Dns.GetHostByName(Dns.GetHostName()).AddressList;
        for (int i = 0; i < addressList.Length; i++) ip += addressList[i].ToString() + "\n";


        string mailbody = "<H2>Brasil: Pré Agendamento de Exame / Consulta</H2>";
        mailbody = mailbody + "<strong>Dados Pessoais: </strong><br />";
        mailbody = mailbody + "<strong>Nome: </strong>" + nome + "<br />";
        mailbody = mailbody + "<strong>Data de nascimento: </strong>" + data_nasc + "<br />";
        mailbody = mailbody + "<strong>Sexo: </strong>" + sexo + "<br />";
        mailbody = mailbody + "<strong>Peso: </strong>" + peso + "kg <br />";
        mailbody = mailbody + "<strong>E-mail: </strong>" + email + "<br />";
        mailbody = mailbody + "<strong>Telefone residencial: </strong>" + tel_res + "<br />";
        mailbody = mailbody + "<strong>Telefone celular: </strong>" + tel_cel + "<br />";
        mailbody = mailbody + "<strong>Telefone comercial: </strong>" + tel_com + "<br />";
        mailbody = mailbody + "<br />";
        mailbody = mailbody + "<strong>Dados Assistenciais </strong><br />";
        mailbody = mailbody + "<strong>Convênio Médico: </strong>" + convenio + "<br />";
        mailbody = mailbody + "<strong>Plano/Produto: </strong>" + plano + "<br />";
        mailbody = mailbody + "<br />";
        mailbody = mailbody + "<strong>Dados do Exame / Consulta </strong><br />";
        mailbody = mailbody + "Nome(s) do Exame(s) e/ou Consulta(Especialidade): <br />";
        mailbody = mailbody + exames + "<br />";
        mailbody = mailbody + "<br />";
        mailbody = mailbody + "<strong>Dados do Agendamento </strong><br />";
        mailbody = mailbody + "<strong>Data Pretendida: </strong>" + data_pretendida + "<br />";
        mailbody = mailbody + "<strong>Período: </strong>" + periodo + "<br />";

        mailbody = mailbody + "<strong>IP do usuário: </strong>" + ip + "<br />";
        mailbody = mailbody + "<br /><br />-------------------------------------------------------------------------<br /><br />";
        mailbody = mailbody + "<p>Este é um email que foi enviado automaticamente após o preenchimento de um formulário presente em seu web site. Em caso de problemas por favor entre em contato conosco via email (suporte@connexion.com.br).";

        SmtpClient cliente = new SmtpClient("smtp.connexion.com.br");
        //cliente.EnableSsl = ture;
        MailAddress remetente = new MailAddress(email);
        MailAddress destinatario = new MailAddress(email_to);
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Brasil: Pré Agendamento de Exame / Consulta";
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
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');location.href='default.aspx';</script>");
        }

    }
}
