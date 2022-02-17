using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_grupo : System.Web.UI.MasterPage
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            var menu_grupo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 1 && x.id_idioma == 1 && x.ds_visivel == true && x.id_tipo != 4).ToList();
            if (menu_grupo.Count > 0)
            {
                string ogrupo = "";
                for (int i = 0; menu_grupo.Count > i; i++)
                {
                    ogrupo += "<li><a href='ogrupo_page.aspx?id=" + menu_grupo[i].id_conteudo.ToString() + "'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_grupo.Text = ogrupo;
            }//fim do if menu_grupo

            var menu_iep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1 && x.ds_visivel == true && !(x.id_tipo >= 13 && x.id_tipo <= 16)).ToList(); if (menu_iep.Count > 0)
            {
                string iep = "";
                for (int i = 0; menu_iep.Count > i; i++)
                {
                    iep += "<li><a href='iep_page.aspx?id=" + menu_iep[i].id_conteudo.ToString()+ "'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_iep.Text = iep;
            }//fim do if menu_iep

            var menu_es = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 3 && x.id_idioma == 1 && x.ds_visivel == true && x.id_tipo != 12).ToList();
            if (menu_es.Count > 0)
            {
                string es = "";
                for (int i = 0; menu_es.Count > i; i++)
                {
                    es += "<li><a href='espaco_saude_page.aspx?id=" + menu_es[i].id_conteudo.ToString() + "'>" + menu_es[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_es.Text = es;
            }//fim do if menu_ep


            var menu_ep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && x.id_tipo != 5 && x.id_tipo != 6 && x.id_idioma == 1 && x.ds_visivel == true).ToList();
            if (menu_ep.Count > 0)
            {
                string ep = "";
                for (int i = 0; menu_ep.Count > i; i++)
                {
                    ep += "<li><a href='imprensa_page.aspx?id=" + menu_ep[i].id_conteudo.ToString() + "'>" + menu_ep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_ep.Text = ep;
            }//fim do if menu_ep

        }//fim do if postback
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("busca.aspx?wrd=" + TextBox1.Text);
    }
}
