using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_formulario_exames_protocolo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    public string logo = "style=\"background:url(images/logo/sprite.png) 0 0;\"";
    protected string GA_Cod, GA_dom;


    protected void Page_Load(object sender, EventArgs e)
    {

        string i = Request.Url.Host;
        string dominio = i;


        GA_dom = dominio.Replace("www.", "");
        var hospital = (from v in new db_rede_dorModel.db_rede_dorEntities().TB_HOSPITAL_PORTAL where v.ds_dominio == dominio select v).FirstOrDefault();
        ltlTitle.Text = hospital.ds_titulo_pagina;

        logo = "style=\"background:url(images/logo/" + hospital.ds_imagem_logo + ") 0 0;\"";
        imgLogo.ImageUrl = "images/logo/" + hospital.ds_imagem_logo;
        Session["idHosp"] = hospital.id_hospital;
        GA_Cod = hospital.ds_google_analytics;


        int idProtocolo = 0;
        int.TryParse(Request["id"], out idProtocolo);
        if (idProtocolo > 0)
        {
            var Protocolo = cnDor.TB_FORMULARIO_EXAMES.Where(a => a.id_exames_imagem == idProtocolo).FirstOrDefault();
            if (Protocolo != null)
            {
                ltlCelular.Text = Protocolo.ds_telefone_celular;
                ltlDataExame.Text = Protocolo.dt_atendimento.ToString("dd/MM/yyyy");
                ltlNome.Text = Protocolo.ds_nome;
                ltlNascimento.Text = Protocolo.ds_data_nascimento;
                ltlProtocolo.Text = idProtocolo.ToString();
                ltlTelefone.Text = Protocolo.ds_telefone_fixo;
                ltlTipoAtendimento.Text = Protocolo.ds_atendimento;
                ltlDataSolicitacao.Text = Protocolo.dt_solicitacao.ToString("dd/MM/yyy HH:mm");
                ltlObs.Text = Protocolo.ds_observacao.Replace("\n", "<br>");
            }
        }
    }
}