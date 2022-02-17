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
            var menu_grupo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 1 && x.id_idioma == 1).ToList();
            if (menu_grupo.Count > 0)
            {
                string ogrupo = "";
                for (int i = 0; menu_grupo.Count > i; i++)
                {
                    ogrupo += "<li><a href='ogrupo.aspx?id="+menu_grupo[i].id_conteudo.ToString()+"'>" + menu_grupo[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_ogrupo.Text = ogrupo;
            }//fim do if menu_grupo



            var menu_iep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1).ToList();
            if (menu_iep.Count > 0)
            {
                string iep = "";
                for (int i = 0; menu_iep.Count > i; i++)
                {
                    iep += "<li><a href='iep_page.aspx?id=" + menu_iep[i].id_conteudo.ToString()+ "'>" + menu_iep[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_iep.Text = iep;
            }//fim do if menu_iep

            var menu_imprensa = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 5 && (x.id_tipo != 5 && x.id_tipo != 6) && x.id_idioma == 1).ToList();
            if (menu_imprensa.Count > 0)
            {
                string imprensa = "";
                for (int i = 0; menu_imprensa.Count > i; i++)
                {
                    imprensa += "<li><a href='#'>" + menu_imprensa[i].nm_titulo.ToUpper() + "</a></li>";
                }//fim do for
                ltr_imprensa.Text = imprensa;
            }//fim do if menu_imprensa

        }//fim do if postback
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("busca.aspx?wrd=" + TextBox1.Text);
    }
}
