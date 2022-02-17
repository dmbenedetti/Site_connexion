using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class imprensa_page : System.Web.UI.Page
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
            metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.id_conteudo == id select a).FirstOrDefault();
            if (metatags != null)
            {
                ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
            }

            var conteudo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id && x.id_status == 1).FirstOrDefault();
            if (conteudo != null)
            {

                if (conteudo.id_tipo == 1)//pagina interna
                {
                    lbl_titulo.Text = conteudo.nm_titulo;
                    ltr_conteudo.Text = conteudo.ds_conteudo;
                }
                else if (conteudo.id_tipo == 2)//link interna
                {
                    Response.Redirect(conteudo.ds_url);
                }
                else if (conteudo.id_tipo == 3)//link externo
                {
                    Response.Write(@"<script>window.open('" + conteudo.ds_url + "','janela');history.back()</script>");
                }
                else if (conteudo.id_tipo == 10)//formulario
                {
                    string sUrl = "";
                    int id_form = 0;
                    int.TryParse(conteudo.ds_url, out id_form);
                    if (id_form > 0)
                    {
                        sUrl = (from v in cnDor.TB_FORMULARIOS where v.id_formulario == id_form select v).FirstOrDefault().ds_arquivo;

                        Response.Redirect(sUrl + "?id=" + id.ToString());
                    }
                    else
                    {
                        Response.Redirect(conteudo.ds_url + "?id=" + id.ToString());
                    }
                }
                else
                {

                }
            }//fim if conteudo !=null
        }//fim if postback
    }
}