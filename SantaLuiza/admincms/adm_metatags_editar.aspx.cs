using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{

    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    int id_metatag = 0;
    int id_conteudo = 0;
    string pagina = "";
    int idHosp = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        int.TryParse(Request["id_conteudo"], out id_conteudo);
        if (ViewState["id_metatag"] != null)
        {
            int.TryParse(ViewState["id_metatag"].ToString(), out id_metatag);
        }
        pagina = Request["pagina"];
        if (pagina == null)
            pagina = "";
        idHosp = Convert.ToInt32(Session["idHosp"]);
        if (!Page.IsPostBack)
        {
            int.TryParse(Request["id_metatag"], out id_metatag);
            ViewState["id_metatag"] = id_metatag;

            var metatag = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_metatag == id_metatag || (a.id_conteudo == id_conteudo && a.id_conteudo > 0) || (a.ds_pagina == pagina && a.ds_pagina != "") select a).FirstOrDefault();
            if (metatag != null)
            {
                ViewState["id_metatag"] = metatag.id_metatag;
                id_metatag = metatag.id_metatag;
                txt_descricao.Text = metatag.ds_description;
                txt_keywords.Text = metatag.ds_keywords;
            }
            if (id_conteudo > 0)
            {
                txt_titulo.Text = (from a in cnDor.TB_PORTAL_CONTEUDO where a.id_conteudo == id_conteudo select a).FirstOrDefault().nm_titulo;
            }
            if (!string.IsNullOrEmpty(pagina))
            {
                var Pagina = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.ds_link == pagina select a).FirstOrDefault();
                if (Pagina != null)
                {
                    txt_titulo.Text = Pagina.ds_titulo;
                }
                else
                    txt_titulo.Text = pagina;
            }

        }//fim do if !Page.IsPostBack
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            var metatag = (from n in cnDor.TB_CONTEUDO_METATAGS where n.id_metatag == id_metatag select n).FirstOrDefault();
            if (metatag == null)
            {
                metatag = new db_rede_dorModel.TB_CONTEUDO_METATAGS();
                metatag.ds_pagina = pagina;
                metatag.id_conteudo = id_conteudo;
                metatag.id_hospital = idHosp;
            }
            metatag.ds_description = txt_descricao.Text;
            metatag.ds_keywords = txt_keywords.Text;
            if (metatag.id_metatag == 0)
            {
                cnDor.AddToTB_CONTEUDO_METATAGS(metatag);
            }
            cnDor.SaveChanges();

            //provavelmente o ACT está dando conflito com a linha abaixo, resolvi fazendo o response.write na linha seguinte
            //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Dados Gravados com sucesso');location.href='portal_noticias.aspx'", true);
            int ret = 0;
            int.TryParse(Request["r"], out ret);
            string sret = "";
            switch (ret)
            {
                case 1:
                    sret = "portal_noticias.aspx";
                    break;
                case 2:
                    sret = "portal_releases.aspx";
                    break;
                case 3:
                    sret = "am_revista_meddor.aspx";
                    break;
                case 4:
                    sret = "ohospital.aspx";
                    break;
                case 5:
                    sret = "servico.aspx";
                    break;
                case 6:
                    sret = "portal_imprensa.aspx";
                    break;
                case 7:
                    sret = "area_medica.aspx";
                    break;
            }
            Response.Write(@"<script>alert('Dados Gravados com sucesso');location.href='" + sret + "'</script>");
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
        }
    }

}