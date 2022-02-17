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
            
        }//fim do if postback

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("portal_iep_saude_publica_criar.aspx");
    }


    
}