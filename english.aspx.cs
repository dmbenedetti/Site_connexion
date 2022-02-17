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
        if (!Page.IsPostBack) { 
        
            int id= 6;
            var conteudo = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id).FirstOrDefault();
            DateTime dt =Convert.ToDateTime(conteudo.dt_conteudo);
            lbl_titulo.Text = "<strong>" + conteudo.nm_titulo+"</strong>";
            ltr_conteudo.Text = conteudo.ds_conteudo;
        }//fim do if postback
    }
}