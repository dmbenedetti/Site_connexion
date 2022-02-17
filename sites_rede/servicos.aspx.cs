using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class servicos : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!Page.IsPostBack)
            {
                int idHosp = 0;
                int.TryParse(Session["idHosp"].ToString(), out idHosp);

                var menu_ep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 9 && x.id_idioma == 1 && x.id_hospital == idHosp && x.ds_visivel == true && !(x.id_tipo >= 5 && x.id_tipo <= 6)).OrderBy(x => x.nm_titulo).FirstOrDefault();
                if (menu_ep != null)
                {
                    string id_page = menu_ep.id_conteudo.ToString();
                    Response.Redirect("dynamic_page.aspx?id=" + id_page);
                }//fim do if menu_ep
            }//fim do if postback
        }//fim do if postback
    }
}