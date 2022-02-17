using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faleconosco : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int idHosp = 1;
            try
            {
                idHosp = Convert.ToInt32(Session["idHosp"]);
            }
            catch { }
            
            var menu_ep = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_status == 1 && x.id_sessao == 6 && x.id_idioma == 1 && x.id_hospital == idHosp).FirstOrDefault();
            if (menu_ep != null)
            {
                //string sUrl = "";
                //int id_form = Convert.ToInt32(menu_ep.ds_url);
                //sUrl = (from v in cnDor.TB_FORMULARIOS where v.id_formulario == id_form select v).FirstOrDefault().ds_arquivo;
                Response.Redirect("dynamic_page.aspx?id=" + menu_ep.id_conteudo);
            }//fim do if menu_ep
        }//fim do if postback
    }
}