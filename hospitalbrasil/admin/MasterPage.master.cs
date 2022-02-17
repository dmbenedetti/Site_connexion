using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    public string user_adm = "";
    public string fotosbb = "";
    public string paginas = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string id_sessao = Convert.ToString(Session.Contents["iduser"]);
        string tipo_user = Convert.ToString(Session.Contents["grupo"]);
        if (id_sessao == null || id_sessao == "")
        {
            Response.Redirect("default.aspx");
        }
        else
        {
            lbl_nome.Text = Session.Contents["nomeuser"].ToString();
        }

        if (tipo_user == "Administrador")
        {
            user_adm="style='display:block'";
            fotosbb = "style='display:block'";
            paginas = "style='display:block'";
        }
        else if (tipo_user == "Foto bebê")
        {
            user_adm = "style='display:none'";
            fotosbb = "style='display:block'";
            paginas = "style='display:none'";
        }
        else
        {
            user_adm = "style='display:none'";
            fotosbb = "style='display:block'";
            paginas = "style='display:block'";
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session.Remove("iduser");
        Response.Redirect("default.aspx");
    }
}
