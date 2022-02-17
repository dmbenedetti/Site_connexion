using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page
{

    protected string banner1 = "";
    protected string banner1_link = "";
    protected string banner1_desc = "";
    protected string banner2 = "";
    protected string banner2_link = "";
    protected string banner2_desc = "";
    protected string banner3 = "";
    protected string banner3_link = "";
    protected string banner3_desc = "";
    protected string banner4 = "";
    protected string banner4_link = "";
    protected string banner4_desc = "";
    protected string banner1_css = "";
    protected string banner2_css = "";
    protected string banner3_css = "";
    protected string banner4_css = "";

    protected string banner5 = "";
    protected string banner5_link = "";
    protected string banner5_desc = "";
    protected string banner6 = "";
    protected string banner6_link = "";
    protected string banner6_desc = "";
    protected string banner7 = "";
    protected string banner7_link = "";
    protected string banner7_desc = "";
    protected string banner8 = "";
    protected string banner8_link = "";
    protected string banner8_desc = "";
    protected string banner5_css = "";
    protected string banner6_css = "";
    protected string banner7_css = "";
    protected string banner8_css = "";


    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    public string dominio;
    protected void Page_Load(object sender, EventArgs e)
    {
        dominio = Request.Url.Host;
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "default.aspx" select a).FirstOrDefault();
        if (metatags != null)
        {
            ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
        }

        var banner = from b in cnDor.TB_PORTAL_BANNER where b.id_hospital == idHosp select b;

        foreach (var c in banner)
        {
            if (c.id_posicao == 1)
            {
                banner1 = "images/baners_home/" + c.ds_imagem;
                banner1_link = c.ds_link;
                banner1_desc = c.ds_descrição;
                banner1_css = c.css_type;
            }
            if (c.id_posicao == 2)
            {
                banner2 = "images/baners_home/" + c.ds_imagem;
                banner2_link = c.ds_link;
                banner2_desc = c.ds_descrição;
                banner2_css = c.css_type;
            }
            if (c.id_posicao == 3)
            {
                banner3 = "images/baners_home/" + c.ds_imagem;
                banner3_link = c.ds_link;
                banner3_desc = c.ds_descrição;
                banner3_css = c.css_type;
            }
            if (c.id_posicao == 4)
            {
                banner4 = "images/baners_home/" + c.ds_imagem;
                banner4_link = c.ds_link;
                banner4_desc = c.ds_descrição;
                banner4_css = c.css_type;
            }
            if (c.id_posicao == 5)
            {
                banner5 = "images/baners_home/" + c.ds_imagem;
                banner5_link = c.ds_link;
                banner5_desc = c.ds_descrição;
                banner5_css = c.css_type;
            }
            if (c.id_posicao == 6)
            {
                banner6 = "images/baners_home/" + c.ds_imagem;
                banner6_link = c.ds_link;
                banner6_desc = c.ds_descrição;
                banner6_css = c.css_type;
            }
            if (c.id_posicao == 7)
            {
                banner7 = "images/baners_home/" + c.ds_imagem;
                banner7_link = c.ds_link;
                banner7_desc = c.ds_descrição;
                banner7_css = c.css_type;
            }
            if (c.id_posicao == 8)
            {
                banner8 = "images/baners_home/" + c.ds_imagem;
                banner8_link = c.ds_link;
                banner8_desc = c.ds_descrição;
                banner8_css = c.css_type;
            }
        }
        var slider = cnDor.TB_PORTAL_SLIDER.Where(x => x.id_status == 1 && x.id_idioma == 1 && x.id_hospital == idHosp).OrderBy(h => h.nu_ordem).ToList();
        if (slider.Count > 0)
        {
            ltl_slider.Text = "";
            for (int i = 0; slider.Count > i; i++)
            {
                ltl_slider.Text += "<li><a " + (slider[i].ds_link.IndexOf("http") > -1 && slider[i].ds_link.IndexOf(dominio) == -1 ? "target='_blank'" : "") + " href='" + slider[i].ds_link + "'><img src='images/slider_home/" + slider[i].ds_imagem + "' /></a></li>";
            }//fim do for slider
        }//fim do if slider

    }

    protected void ImageButton1_Click1(object sender, EventArgs e)
    {
        string newsletter = txt_newsletter.Text;
        Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
        Match match = regex.Match(newsletter);
        if (match.Success)
        {
            try
            {
                db_rede_dorModel.TB_NEWSLETTER oNewsLetter = new db_rede_dorModel.TB_NEWSLETTER();
                oNewsLetter.ds_email = newsletter;
                oNewsLetter.dt_data = System.DateTime.Now;
                oNewsLetter.id_hospital = Convert.ToInt32(Session["idHosp"]);
                cnDor.AddToTB_NEWSLETTER(oNewsLetter);
                cnDor.SaveChanges();
            }
            catch { }
        }
        txt_newsletter.Text = "";
        Response.Write("<script>alert('e-mail cadastrado.')</script>");
    }
}