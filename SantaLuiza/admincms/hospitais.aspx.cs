using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_hospitais : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
            gdv_hospitais.DataSource = cnDor.TB_HOSPITAL.Where(x => x.id_status == 1 && x.id_hospital !=1).ToList(); 
            gdv_hospitais.DataBind();
        }//fim do if !Page.IsPostBack
    }
}