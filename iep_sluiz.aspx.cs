using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class campanhas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        if (id_idioma == null || id_idioma == 0)
        {
            Session["idioma"] = 1;
        }
    }
}