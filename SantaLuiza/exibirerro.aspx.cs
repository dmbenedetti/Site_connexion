using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exibirerro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Exception ex = (Exception)Session["Error"];
        try
        {
            Response.Write("Erro: " + ex.Message);
        }
        catch { }
        try
        {
            Response.Write("<br><br>StakeTrace: " + ex.Message);
        }
        catch { }
    }
}