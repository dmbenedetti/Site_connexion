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
        string _cortesia_recepcionistas = cortesia_recepcionistas.Text;
        string _atencao_enfermagem = atencao_enfermagem.Text;
        string _cortesia_atendimento_medico = cortesia_atendimento_medico.Text;
        string _tempo_espera = tempo_espera.Text;
        string _cortesia_colaboradores = cortesia_colaboradores.Text;
        string _espera_documentacao = espera_documentacao.Text;
        string _enfermagem_atencao = enfermagem_atencao.Text;
        string _medicos_atendimento = medicos_atendimento.Text;
        string _temperatura_alimentos = temperatura_alimentos.Text;
        string _atencao_copeiras = atencao_copeiras.Text;
        string _tempo_atendimento = tempo_atendimento.Text;
        string _limpeza_acomodacoes = limpeza_acomodacoes.Text;
        string _espera_alta = espera_alta.Text;
        string _servico_ouvidoria = servico_ouvidoria.Text;
        string _recomenda_hospital = recomenda_hospital.Text;
        string _motivo_nao_recomenda = motivo_nao_recomenda.Text;
        string _auditoria_medica = auditoria_medica.Text;
        string _comentarios = comentarios.Text;
        string _nome_paciente = nome_paciente.Text;
        string _email = email.Text;
        string _telefone = telefone.Text;
        string _loca_atendimento = loca_atendimento.Text;
        string _data_internacao = data_internacao.Text;
        string _data_alta = data_alta.Text;
        string _quarto = quarto.Text;
        string _assunto = "Pesquisa de Opinião";
        // string _email_to = "diego@connexion.com.br";
        string email_to = ConfigurationManager.AppSettings["EmailForm6"];

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

        string mailbody = "<h2>Pesquisa de opinião - " + site + "</h2>";
        mailbody = mailbody + "<p> <strong>1 - Se passou pelo Pronto Atendimento</strong> </p>";
        mailbody = mailbody + "<p> » Cortesia dos Recepcionistas : "+_cortesia_recepcionistas+"</p>";
        mailbody = mailbody + "<p> » Atenção da enfermagem : "+_atencao_enfermagem+"</p>";
        mailbody = mailbody + "<p> » Cortesia no Atendimento Médico : " + _cortesia_atendimento_medico + "</p>";
        mailbody = mailbody + "<p> » Tempo de espera para atendimento : " + _tempo_espera + "</p>";
        mailbody = mailbody + "<p> <strong>2 - Recepção Internação</strong> </p>";
        mailbody = mailbody + "<p> » Cortesia dos Colaboradores : " + _cortesia_colaboradores + "</p>";
        mailbody = mailbody + "<p> » Espera para emissão da documentação :" + _espera_documentacao + "</p>";
        mailbody = mailbody + "<p> <strong>3 - Enfermagem</strong> </p>";
        mailbody = mailbody + "<p> » Atenção : " + _enfermagem_atencao + "</p>";
        mailbody = mailbody + "<p> <strong>4 - Médicos</strong> </p>";
        mailbody = mailbody + "<p> » Atendimento de suas necessidades :" + _medicos_atendimento + "</p>";
        mailbody = mailbody + "<p> <strong>5 - Nutrição</strong> </p>";
        mailbody = mailbody + "<p> » Temperatura dos alimentos : " + _temperatura_alimentos + "</p>";
        mailbody = mailbody + "<p> » Atenção das copeiras : " + _atencao_copeiras + "</p>";
        mailbody = mailbody + "<p> <strong>6 - Manutenção</strong> </p>";
        mailbody = mailbody + "<p> » Tempo de atendimento a solicitação : " + _tempo_atendimento + "</p>";
        mailbody = mailbody + "<p> <strong>7 - Governança</strong> </p>";
        mailbody = mailbody + "<p> » Limpeza das acomodações : " + _limpeza_acomodacoes + "</p>";
        mailbody = mailbody + "<p> <strong>8 - Alta</strong> </p>";
        mailbody = mailbody + "<p> » Espera para alta : " + _espera_alta + "</p>";
        mailbody = mailbody + "<p> <strong>9 - Qualidade</strong> </p>";
        mailbody = mailbody + "<p> » Se utilizou os serviços da Ouvidoria, como avalia os serviços? " + _servico_ouvidoria + "</p>";
        mailbody = mailbody + "<p> <strong>» Você recomendaria o Hospital?</strong> " + _recomenda_hospital + "</p>";
        mailbody = mailbody + "<p> Em caso de não recomendar o Hospital, qual o motivo? " + _motivo_nao_recomenda + "</p>";
        mailbody = mailbody + "<p> <strong>10 - </strong><strong>Auditoria Médica</strong> </p>";
        mailbody = mailbody + "<p> » Se utilizou os serviços da Auditoria Médica, como avalia os serviços prestados : " + _auditoria_medica + "</p>";
        mailbody = mailbody + "<p> <strong>11 - Comentários</strong> </p>";
        mailbody = mailbody + "<p>" + _comentarios + "</p>";
        mailbody = mailbody + "<p> <strong>Dados do Paciente</strong> </p>";
        mailbody = mailbody + "<p> Nome do Paciente:" + _nome_paciente + "</p>";
        mailbody = mailbody + "<p> Email:" + _email + "</p>";
        mailbody = mailbody + "<p> Telefone:" + _telefone + "</p>";
        mailbody = mailbody + "<p> Local de Atendimento:" + _loca_atendimento + "</p>";
        mailbody = mailbody + "<p> Data Internação: " + _data_internacao + "</p>";
        mailbody = mailbody + "<p> Data Alta: " + _data_alta + "</p>";
        mailbody = mailbody + "<p> Quarto:" + _quarto + "</p>";



        SmtpClient cliente = new SmtpClient(ConfigurationManager.AppSettings["stmpServer"]);
        cliente.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpSsl"]);
        cliente.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPorta"]);
        MailAddress remetente = new MailAddress(ConfigurationManager.AppSettings["emailRemetente"]);
        MailAddress destinatario = new MailAddress("diego@connexion.com.br");
        MailMessage mensagem = new MailMessage(remetente, destinatario);
        mensagem.Body = mailbody;
        mensagem.Subject = "Pesquisa de Opinião";
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
        catch (Exception ex)
        {
            string erro = ex.Message;
            //lblmsg.Text = "Ocorreu um erro no envio da mensagem. Tente mais tarde.";
            Response.Write(@"<script>alert('Ocorreu um erro ao enviar a mensagem. \n Tente novamente mais tarde. \n " + erro + "');location.href='default.aspx';</script>");
        }
    }
}
