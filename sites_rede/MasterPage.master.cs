﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_grupo : System.Web.UI.MasterPage
{
    public string logo = "style=\"background:url(images/logo/sprite.png) 0 0;\"";
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected string GA_Cod, GA_dom;
    protected string icon = "icon";

    protected string URL(int idTipo, string dsLink, int idPagina, string dsNome)
    {
        string sReturn = "";
        if (idTipo == 1)
        {
            sReturn = Server.UrlEncode(dsNome.ToString().Replace(":", "_").Replace("?", "")).Replace("+", "_") + ",d," + idPagina.ToString() + ".aspx";
        }
        else
        {
            sReturn = dsLink;
        }
        return sReturn;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["idioma"] = 1;
        string i = Request.Url.Host;
        string dominio = i;
        

        GA_dom = dominio.Replace("www.", "");
        var hospital = (from v in new db_rede_dorModel.db_rede_dorEntities().TB_HOSPITAL_PORTAL where v.ds_dominio == dominio select v).FirstOrDefault();
        if (ConfigurationManager.AppSettings["copastar"] != null && hospital.id_hospital.ToString() == ConfigurationManager.AppSettings["copastar"])
        {
            bannerfooter.Visible = true;
        }
        string a = ConfigurationManager.AppSettings["selobndes"];

        if ((!string.IsNullOrEmpty(ConfigurationManager.AppSettings["selobndes"])) && ConfigurationManager.AppSettings["selobndes"].IndexOf("," + hospital.id_hospital.ToString() + ",") > -1)
        {
            divBNDES.Visible = true;
        }

        string b = ConfigurationManager.AppSettings["GTM"];

        if ((!string.IsNullOrEmpty(b)) && b.IndexOf("," + hospital.id_hospital.ToString() + ",") > -1)
        {
            ltlGMT.Text = "<!-- Google Tag Manager (noscript) -->\n" +
                          "<noscript><iframe src = \"https://www.googletagmanager.com/ns.html?id=GTM-K5G339G\"" +
                          "height=\"0\" width=\"0\" style=\"display:none;visibility:hidden\"></iframe></noscript>\n" +
                          "<!-- End Google Tag Manager(noscript) --> ";

            ltlGMTTop.Text = "<!-- Google Tag Manager -->\n" +
                             "<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':" +
                             "new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0]," +
                             "j=d.createElement(s),dl=l !='dataLayer'?'&l='+l:'';j.async=true;j.src=" +
                             "'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);" +
                             "})(window,document,'script','dataLayer','GTM-K5G339G');</script>\n" +
                             "<!-- End Google Tag Manager -->";
        }

        ltlTelefone.Text = hospital.ds_telefone;
        ltlHospiatl.Text = hospital.ds_titulo_pagina;
        ltlTitle.Text = hospital.ds_titulo_pagina;
        ltlFooter.Text = hospital.ds_endereco_rodape;
        Literal1.Text = hospital.ds_endereco_rodape;
        if (!string.IsNullOrEmpty(hospital.ds_link_facebook))
        {
            hpkFaceBook.NavigateUrl = hospital.ds_link_facebook;
            hpkFaceBook2.NavigateUrl = hospital.ds_link_facebook;
        }
        else
        {
            hpkFaceBook.Visible = false;
            hpkFaceBook2.Visible = false;
        }
        if (!string.IsNullOrEmpty(hospital.ds_link_twitter))
        {
            hpkTwitter2.NavigateUrl = hospital.ds_link_twitter;
            hpkTwitter.NavigateUrl = hospital.ds_link_twitter;
        }
        else
        {
            hpkTwitter.Visible = false;
            hpkTwitter2.Visible = false;
        }
        if (!string.IsNullOrEmpty(hospital.ds_youtube))
        {
            hpkYouTube.NavigateUrl = hospital.ds_youtube;
            hpkYouTube2.NavigateUrl = hospital.ds_youtube;
        }
        else
        {
            hpkYouTube.Visible = false;
            hpkYouTube2.Visible = false;
        }
        if (!string.IsNullOrEmpty(hospital.ds_linkedin))
        {
            hpkLinkedin.NavigateUrl = hospital.ds_linkedin;
            hpkLinkedin2.NavigateUrl = hospital.ds_linkedin;
        }
        else
        {
            hpkLinkedin.Visible = false;
            hpkLinkedin2.Visible = false;
        }
        if (!string.IsNullOrEmpty(hospital.ds_blog))
        {
            hpkBlog.NavigateUrl = hospital.ds_blog;
            hpkBlog2.NavigateUrl = hospital.ds_blog;
        }
        else
        {
            hpkBlog.Visible = false;
            hpkBlog2.Visible = false;
        }

        logo = "style=\"background:url(images/logo/" + hospital.ds_imagem_logo + ") 0 0;\"";
        imgLogo.ImageUrl = "images/logo/" + hospital.ds_imagem_logo;
        Session["idHosp"] = hospital.id_hospital;
        GA_Cod = hospital.ds_google_analytics;
        if (!String.IsNullOrEmpty(hospital.ds_css))
        {
            ltlCssHosp.Text = "    <link rel='stylesheet' type='text/css' href='css/" + hospital.ds_css + "' />";
        }
        if (!String.IsNullOrEmpty(hospital.ds_icone))
        {
            icon = hospital.ds_icone;
        }
        ltlIcon.Text = "<link type=\"image/ico\" href=\"images/icon/fav" + icon + ".ico\" rel=\"shortcut icon\" />\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"57x57\" href=\"images/icon/apple-" + icon + "-57x57.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"60x60\" href=\"images/icon/apple-" + icon + "-60x60.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"images/icon/apple-" + icon + "-72x72.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"76x76\" href=\"images/icon/apple-" + icon + "-76x76.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"images/icon/apple-" + icon + "-114x114.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"120x120\" href=\"images/icon/apple-" + icon + "-120x120.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"144x144\" href=\"images/icon/apple-" + icon + "-144x144.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"152x152\" href=\"images/icon/apple-" + icon + "-152x152.png\">\n" +
                "<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"images/icon/apple-" + icon + "-180x180.png\">\n" +
                "<link rel=\"icon\" type=\"image/png\" sizes=\"192x192\"  href=\"images/icon/android-" + icon + "-192x192.png\">\n" +
                "<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"images/icon/fav" + icon + "-32x32.png\">\n" +
                "<link rel=\"icon\" type=\"image/png\" sizes=\"96x96\" href=\"images/icon/fav" + icon + "-96x96.png\">\n" +
                "<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"images/icon/fav" + icon + "-16x16.png\">\n" +
                "<link rel=\"manifest\" href=\"manifest.json\">\n" +
                "<meta name=\"msapplication-TileColor\" content=\"#ffffff\">\n" +
                "<meta name=\"msapplication-TileImage\" content=\"images/icon/ms-" + icon + "-144x144.png\">\n" +
                "<meta name=\"theme-color\" content=\"#ffffff\">";


        //if (!Page.IsPostBack)
        //{
        //    var menu_grupo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 1 && x.id_idioma == 1 && x.ds_visivel == true && x.id_tipo != 4).ToList();
        //    if (menu_grupo.Count > 0)
        //    {
        //        string ogrupo = "";
        //        for (int i = 0; menu_grupo.Count > i; i++)
        //        {
        //            ogrupo += "<li><a href='ogrupo_page.aspx?id=" + menu_grupo[i].id_conteudo.ToString() + "'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
        //        }//fim do for
        //        ltr_grupo.Text = ogrupo;
        //    }//fim do if menu_grupo

        //    var menu_iep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1 && x.ds_visivel == true && !(x.id_tipo >= 13 && x.id_tipo <= 16)).ToList(); if (menu_iep.Count > 0)
        //    {
        //        string iep = "";
        //        for (int i = 0; menu_iep.Count > i; i++)
        //        {
        //            iep += "<li><a href='iep_page.aspx?id=" + menu_iep[i].id_conteudo.ToString()+ "'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
        //        }//fim do for
        //        ltr_iep.Text = iep;
        //    }//fim do if menu_iep

        //    var menu_es = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 3 && x.id_idioma == 1 && x.ds_visivel == true && x.id_tipo != 12).ToList();

        //    if (menu_es.Count > 0)
        //    {
        //        string es = "";
        //        for (int i = 0; menu_es.Count > i; i++)
        //        {
        //            es += "<li><a href='espaco_saude_page.aspx?id=" + menu_es[i].id_conteudo.ToString() + "'>" + menu_es[i].nm_titulo.ToUpper() + "</a></li>";
        //        }//fim do for
        //        ltr_es.Text = es;
        //    }//fim do if menu_ep


        //    var menu_ep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo != 5 && x.id_tipo != 6 && x.id_idioma == 1 && x.ds_visivel == true).ToList();
        //    if (menu_ep.Count > 0)
        //    {
        //        string ep = "";
        //        for (int i = 0; menu_ep.Count > i; i++)
        //        {
        //            ep += "<li><a href='imprensa_page.aspx?id=" + menu_ep[i].id_conteudo.ToString() + "'>" + menu_ep[i].nm_titulo.ToUpper() + "</a></li>";
        //        }//fim do for
        //        ltr_ep.Text = ep;
        //    }//fim do if menu_ep



            

        //}//fim do if postback
    }

    //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("busca.aspx?wrd=" + TextBox1.Text);
    //}

    protected string MudarHosp(bool novaJanela, string endereco)
    {
        string sRet = "";
        if (novaJanela)
            sRet = "window.open('http://" + endereco + "');";
        else
            sRet = "window.location = 'http://" + endereco + "';";
        return sRet;
    }

    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        if (!String.IsNullOrWhiteSpace(TextBox1.Value) && TextBox1.Value != "Digite aqui o que você procura?")
            Response.Redirect("busca.aspx?wrd=" + TextBox1.Value);
    }
}
