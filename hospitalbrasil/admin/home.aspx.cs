using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_Home_portal : System.Web.UI.Page
{
    public string mostrar = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string tipo_user = Convert.ToString(Session.Contents["grupo"]);
         if (tipo_user == "Foto bebê")
        {
            mostrar = "style='display:none'";
            
        }
        else
        {
            mostrar = "style='display:block'";
        }
    }
}
