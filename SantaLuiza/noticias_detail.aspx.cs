using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class noticias_detail : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            int idHosp = Convert.ToInt32(Session["idHosp"]);
            var metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "default.aspx" select a).FirstOrDefault();
            if (metatags != null)
            {
                ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
            }
            metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "noticias.aspx" select a).FirstOrDefault();
            if (metatags != null)
            {
                ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
            }
            metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.id_conteudo == id select a).FirstOrDefault();
            if (metatags != null)
            {
                ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
            } var pagina = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.ds_link == "noticias.aspx" && a.id_sessao == 5 && a.id_hospital == idHosp select a).FirstOrDefault();
            ltlTitulo.Text = pagina.ds_titulo;

            var conteudo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id).FirstOrDefault();
            DateTime dt = Convert.ToDateTime(conteudo.dt_conteudo);
            lbl_titulo.Text = dt.ToString("dd/MM/yyyy") + " - <strong>" + conteudo.nm_titulo + "</strong>";
            ltr_conteudo.Text = conteudo.ds_conteudo;
        }//fim do if postback
    }
}