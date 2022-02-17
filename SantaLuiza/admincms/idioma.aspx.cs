using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_idioma : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        int id_idioma = Convert.ToInt32(rdo_idioma.SelectedValue);
        Session["idioma"] = id_idioma;
        Response.Redirect("default.aspx");
    }
}