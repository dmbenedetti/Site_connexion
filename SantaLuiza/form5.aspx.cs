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
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string nome_paciente = txt_nome_paciente.Text;
        string telefone = txt_telefone.Text;
        string nascimento = txt_nascimento.Text;
        string sexo = rdo_sexo.SelectedValue;
        string peso = txt_peso.Text;
        string convenio = txt_convenio.Text;
        string plano = txt_plano.Text;
        string acomodacao = rdo_acomodacao.SelectedValue;
        string produto = txt_produto.Text;
        string nome_medico = txt_nome_medico.Text;
        string crm = txt_crm.Text;
        string telefone_medico = txt_telefone_medico.Text;
        
        string email_medico = txt_email.Text;
        string data_internacao = txt_data_internacao.Text;
        string hora_internacao = txt_hora_internacao.Text;
        string cod_procedimento1 = txt_cod_procedimento1.Text;
        string cirurgia_exame1 = txt_cirugia_exame1.Text;
        string cod_procedimento2 = txt_cod_procedimento2.Text;
        string cirurgia_exame2 = txt_cirugia_exame2.Text;
        string cod_procedimento3 = txt_cod_procedimento3.Text;
        string cirurgia_exame3 = txt_cirugia_exame3.Text;
        string data_cirurgia = txt_data_cirurgia.Text;
        string hora_cirurgia = txt_hora_cirurgia.Text;
        string tempo_cirurgia = txt_tempo_cirurgia.Text;
        string diagnotico = txt_diagnostico.Text;
        string cid = txt_CID.Text;
        string origem_anestesista = rdo_origem_anestesista.SelectedValue;
        string tipo_anestesista = txt_tipo_anestesia.Text;
        string nome_anestesista = txt_nome_anestesista.Text;
        string reserva = rdo_reserva.SelectedValue;
        string congelacao ="";
        if (chk_congelacao.Checked == true)
        {
            congelacao = "sim";
        }
        else {
            congelacao = "não";
        }
        string anatomia ="";
        if(chk_anatomia.Checked ==true){
        anatomia = "sim";
        }
        else
        {
            anatomia = "não";
        }
        string sangue ="";
        if(chk_sangue.Checked ==true){
        sangue = "sim";
        }
        else
        {
            sangue = "não";
        }
        string tipo_sangue = txt_tipo_sangue.Text;
        string protese ="";
        if(chk_protese.Checked ==true){
        protese = "sim";
        }
        else
        {
            protese = "não";
        }
        string microscopio ="";
        if(chk_microscopio.Checked ==true){
        microscopio = "sim";
        }
        else
        {
            microscopio = "não";
        }
        string rx="";
        if(chk_rx.Checked ==true){
        rx = "sim";
        }
        else
        {
            rx = "não";
        }
        string outros="";
        if(chk_outros.Checked ==true){
        outros = "sim";
        }
        else
        {
            outros = "não";
        }
        string outros_texto = txt_outros.Text;
        string protese_texto = txt_protese.Text;

        string email = "acirurgico@hospitalbrasil.com.br";
        string email_to = ConfigurationManager.AppSettings["EmailForm5"];
        //string email_to = "rhselecao@hospitalassuncao.com.br";
        string email_from = "acirurgico@hospitalbrasil.com.br";

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

        string mailbody = "<H2>Aviso de Cirurgia " + site + "</H2>";
        mailbody = mailbody + "<strong>Nome completo do paciente: </strong>" + nome_paciente + "<br />";
        mailbody = mailbody + "<strong>Telefone: </strong>" + telefone + "<br />";
        mailbody = mailbody + "<strong>Data de nascimento: </strong>" + nascimento + "<br />";
        mailbody = mailbody + "<strong>Sexo: </strong>" + sexo + "<br />";
        mailbody = mailbody + "<strong>Peso (Cirurgia infantial): </strong>" + peso + "<br />";
        mailbody = mailbody + "<strong>Convênio: </strong>" + convenio + "<br />";
        mailbody = mailbody + "<strong>Plano: </strong>" + plano + "<br />";
        mailbody = mailbody + "<strong>Acomodação: </strong>" + acomodacao + "<br />";
        mailbody = mailbody + "<strong>Produto: </strong>" + produto + "<br />";
        mailbody = mailbody + "<strong>Nome do médico: </strong>" + nome_medico + "<br />";
        mailbody = mailbody + "<strong>CRM: </strong>" + crm + "<br />";
        mailbody = mailbody + "<strong>Telefone do médico: </strong>" + telefone_medico + "<br />";
        mailbody = mailbody + "<strong>Email: </strong>" + email_medico + "<br />";
        mailbody = mailbody + "<strong>Data de internação: </strong>" + data_internacao + "<br />";
        mailbody = mailbody + "<strong>Hora: </strong>" + hora_internacao + "<br />";
        mailbody = mailbody + "<strong>Código Procedimento1: </strong>" + cod_procedimento1 + " - <strong>Cirurgia / Exame1: </strong>" + cirurgia_exame1 + "<br />";
        mailbody = mailbody + "<strong>Código Procedimento2: </strong>" + cod_procedimento2 + " - <strong>Cirurgia / Exame2: </strong>" + cirurgia_exame2 + "<br />";
        mailbody = mailbody + "<strong>Código Procedimento3: </strong>" + cod_procedimento3 + " - <strong>Cirurgia / Exame3: </strong>" + cirurgia_exame3 + "<br />";
        mailbody = mailbody + "<strong>Data da Cirurgia / Exame: </strong>" + data_cirurgia + "<br />";
        mailbody = mailbody + "<strong>Hora: </strong>" + hora_cirurgia + "<br />";
        mailbody = mailbody + "<strong>Tempo previsto: </strong>" + tempo_cirurgia + "<br />";
        mailbody = mailbody + "<strong>Diagnóstico: </strong>" + diagnotico + "<br />";
        mailbody = mailbody + "<strong>CID: </strong>" + cid + "<br />";
        mailbody = mailbody + "<strong>Origem do Anestesista: </strong>" + origem_anestesista + "<br />";
        mailbody = mailbody + "<strong>Tipo de Anestesista: </strong>" + tipo_anestesista + "<br />";
        mailbody = mailbody + "<strong>Nome do Anestesista: </strong>" + nome_anestesista + "<br />";
        mailbody = mailbody + "<strong>Reserva: </strong>" + reserva + "<br />";
        mailbody = mailbody + "<strong>Congelação: </strong>" + congelacao + "<br />";
        mailbody = mailbody + "<strong>Anatomia Patológica: </strong>" + anatomia + "<br />";
        mailbody = mailbody + "<strong>Sangue: </strong>" + sangue + " - <strong>Tipo:</strong> " + tipo_sangue + "<br />";
        mailbody = mailbody + "<strong>Prótese / Órtese / Síntese: </strong>" + protese + " : " + protese_texto + "<br />";
        mailbody = mailbody + "<strong>Microscópio: </strong>" + microscopio + "<br />";
        mailbody = mailbody + "<strong>RX: </strong>" + rx + "<br />";
        mailbody = mailbody + "<strong>Outros: </strong>" + outros + " : " + outros_texto + "<br />";

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
        mensagem.Subject = "Aviso de Cirurgia";
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
