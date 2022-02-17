using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
            int idHosp = Convert.ToInt32(Session["idHosp"]);
            var optMenu = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.id_sessao == 7 && a.id_hospital == idHosp && a.ds_link == "am_docs.aspx" select a).FirstOrDefault();
            if (optMenu != null)
            {
                txtMenu.Text = optMenu.ds_desc_menu;
                txtTitulo.Text = optMenu.ds_titulo;
                chkVisivel.Checked = optMenu.ds_visivel;
            }   
            
        }//fim do if postback

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("am_docs_criar.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var optMenu = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.id_sessao == 7 && a.id_hospital == idHosp && a.ds_link == "am_docs.aspx" select a).FirstOrDefault();
        if (optMenu == null)
        {
            optMenu = new db_rede_dorModel.TB_CONTEUDO_PAGINA_FIXA();
        }
        optMenu.ds_desc_menu = txtMenu.Text;
        optMenu.ds_titulo = txtTitulo.Text;
        optMenu.ds_visivel = chkVisivel.Checked;
        if (string.IsNullOrEmpty(optMenu.ds_link))
        {
            optMenu.ds_link = "am_docs.aspx";
            optMenu.id_hospital = idHosp;
            optMenu.id_sessao = 7;
            cnDor.AddToTB_CONTEUDO_PAGINA_FIXA(optMenu);
        }
        cnDor.SaveChanges();
    }

    
}