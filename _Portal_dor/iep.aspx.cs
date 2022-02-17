using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class campanhas : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!Page.IsPostBack)
            {

                var menu_ep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 4 && x.id_idioma == 1 && x.ds_visivel == true && !(x.id_tipo >= 13 && x.id_tipo <= 16)).FirstOrDefault();
                if (menu_ep != null)
                {
                    string id_page = menu_ep.id_conteudo.ToString();
                    Response.Redirect("iep_page.aspx?id=" + id_page);
                }//fim do if menu_ep
            }//fim do if postback
        }//fim do if postback
    }
}