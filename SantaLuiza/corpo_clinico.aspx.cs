using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class noticias : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var pagina = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.ds_link == "corpo_clinico.aspx" && a.id_sessao == 8 && a.id_hospital == idHosp select a).FirstOrDefault();
        ltlTitulo.Text = pagina.ds_titulo;

    }
    protected void drpEspecialidade_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}