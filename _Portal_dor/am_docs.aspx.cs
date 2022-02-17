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
        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        if (id_idioma == null || id_idioma == 0)
        {
        }
        Session["idioma"] = 1;
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var pagina = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.ds_link == "am_docs.aspx" && a.id_sessao == 7 && a.id_hospital == idHosp select a).FirstOrDefault();
        ltlTitulo.Text = "DOCUMENTOS PARA DOWNLOAD";
    }
}