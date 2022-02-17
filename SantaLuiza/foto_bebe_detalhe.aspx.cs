using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;

public partial class foto_bebe_detalhe : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        int id;
        int.TryParse(Request["id"], out id);
        if (id > 0)
        {
            var foto_bebe = (from a in cnDor.TB_FOTO_BEBE where a.id_foto == id select a).FirstOrDefault();
            if (foto_bebe != null)
            {
                ltlEstatura.Text = foto_bebe.nu_estatura.ToString() + " cm";
                ltlHorario.Text = foto_bebe.dt_nascimento.ToString("HH:mm");
                ltlHospital.Text = (from f in cnDor.TB_HOSPITAL where f.id_hospital == foto_bebe.id_hospital select f).FirstOrDefault().nm_hospital;
                ltlNascimento.Text = foto_bebe.dt_nascimento.ToString("dd/MM/yyyy");
                ltlNomeBebe.Text = foto_bebe.ds_nome_bebe;
                ltlObstetra.Text = foto_bebe.ds_obstreta;
                ltlPais.Text = foto_bebe.ds_nome_mae + (string.IsNullOrEmpty(foto_bebe.ds_nome_pai) ? "" : " & ") + foto_bebe.ds_nome_pai;
                ltlPediatra.Text = foto_bebe.ds_pediatra;
                ltlPeso.Text = foto_bebe.nu_peso.ToString() + " kg";
                imgBebe.ImageUrl = "images/foto_bebe/" + foto_bebe.ds_foto_bebe;
            }

        }
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        string sBody = "<table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" " +
        "style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; width: 500px; border: 1px solid rgb(232, 232, 232); background-color: rgb(255, 255, 255);\"> " +
        "<tr> " +
            " <td align=\"center\" " +
                "style=\"font-family: arial, sans-serif; margin: 0px; width: 600px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(232, 232, 232);\"> " +
                "<br />" +
        "        <img border=\"0\" class=\"CToWUd\" " +
        "            src=\"http://www.oestedor.com.br/templates/jet_rededor/images/logo.png\" /><br />" +
        "        <br />" +
        "    </td>" +
        "</tr>" +
        "<tr>" +
            "<td style=\"font-family: arial, sans-serif; margin: 0px;\">" +
                "<table border=\"0\" style=\"width: 478px;\">" +
                    "<tr>" +
                        "<td style=\"font-family: arial, sans-serif; margin: 0px;\">" +
                            "<p>" +
                            "    Olá " + txtNomeAmigo.Text + ",<br />" +
                            "    <br />" +
                            "    " + txtNome.Text + " comunica a chegada do bebê abaixo,</p>" +
                            "<p>" +
                            "    " + txtMesnsagem.Text + "</p>" +
                            "<p style=\"color: rgb(232, 232, 232);\">" +
                            "    ______________________________<wbr>________________________</p>" +
                            "<br />" +
                            "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 468px;\">" +
                            "    <tr>" +
                            "        <td style=\"font-family: arial, sans-serif; margin: 0px;\" width=\"250\">" +
                            "            <img border=\"0\" class=\"CToWUd\" height=\"333\" " +
                            "                src=\"http://" + Request.Url.DnsSafeHost + "/" + imgBebe.ImageUrl + "\" " +
                            "                width=\"250\" /></td>" +
                            "        <td style=\"font-family: arial, sans-serif; margin: 0px;\" width=\"30\">" +
                            "        </td>" +
                            "        <td style=\"font-family: arial, sans-serif; margin: 0px;\" valign=\"top\" " +
                            "            width=\"188\">" +
                            "            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 188px;\">" +
                            "                <tr>" +
                            "                    <td height=\"35\" style=\"font-family: arial, sans-serif; margin: 0px;\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 13px; font-weight: bold; color: rgb(76, 76, 76);\">" +
                            "                        " + ltlNomeBebe.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"12\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td background=\"http://www.quintador.com.br/images/html/linha_azul.gif\" " +
                            "                        height=\"1\" style=\"font-family: arial, sans-serif; margin: 0px;\" width=\"188\">" +
                             "                   </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"15\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Data de Nascimento</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlNascimento.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"10\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Horário</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlHorario.Text + "</td>" +
                            "                </tr>" +
                           "                 <tr>" +
                            "                    <td height=\"10\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Peso</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlPeso.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"10\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Estatura</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlEstatura.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"10\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Pais</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlPais.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"10\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Obstetra</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlObstetra.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"10\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Pediatra</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlPediatra.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"10\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: Tahoma; margin: 0px; font-size: 11px; color: black;\" " +
                            "                        width=\"188\">" +
                            "                        <span style=\"color: rgb(153, 153, 153);\">Unidade</span><span " +
                            "                            class=\"Apple-converted-space\">&nbsp;</span>" + ltlHospital.Text + "</td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td height=\"55\" style=\"font-family: arial, sans-serif; margin: 0px;\" " +
                            "                        width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "                <tr>" +
                            "                    <td style=\"font-family: arial, sans-serif; margin: 0px;\" width=\"188\">" +
                            "                    </td>" +
                            "                </tr>" +
                            "            </table>" +
                            "        </td>" +
                            "    </tr>" +
                            "</table>" +
                            "<p style=\"color: rgb(232, 232, 232);\">" +
                            "    ______________________________<wbr>________________________</p>" +
                            "<p>" +
                            "    Oeste D&#39;Or<br />" +
                            "    <a href=\"http://oestedor.com.br/\" style=\"color: rgb(17, 85, 204);\" " +
                            "        target=\"_blank\">http://www.oestedor.com.br</a></p>" +
                        "</td>" +
                    "</tr>" +
                "</table>" +
            "</td>" +
        "</tr>" +
    "</table>";
        string nome = txtNome.Text;
        string email = txtEmail.Text;
        string SeuNome = txtNomeAmigo.Text;
        string email_to = txtEmailAmigo.Text;
        string msg = sBody;

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

        SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["stmpServer"]);
        cliente.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSsl"]);
        cliente.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPorta"]);
        MailAddress remetente = new MailAddress(ConfigurationManager.AppSettings["emailRemetente"]);
        MailAddress destinatario = new MailAddress(email_to);
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = sBody;
        mensagem.Subject = "Contato via formulario web";
        mensagem.IsBodyHtml = true;
        mensagem.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
        mensagem.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

        NetworkCredential credenciais = new NetworkCredential(ConfigurationManager.AppSettings["smtpUser"], ConfigurationManager.AppSettings["smtpPassWord"], "");
        cliente.Credentials = credenciais;

        try
        {
            cliente.Send(mensagem);
            Response.Write(@"<script>alert('Sua mensagem foi enviada com sucesso \n Obrigado.');</script>");
            //lblmsg.Text = "Mensagem Enviada com Sucesso!<br /> Obrigado.";
        }
        catch
        {
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde.');</script>");
        }
    }
}
