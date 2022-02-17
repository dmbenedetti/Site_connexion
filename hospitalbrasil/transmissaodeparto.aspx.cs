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
using System.Net; // importe o namespace .Net
using System.Net.Mail; // importe o namespace .Net.Mail
using System.Text;

public partial class fale_conosco : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_titulo.Text = "Transmissão de Parto";


    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string login = txtLogin.Text;
        string senha = txtsenha.Text;

        if (login == "Admin")
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "Redirect", "window.open('http://201.90.107.98:3399?user=Admin','width=500,height=300,_blank');", true);
            Response.Redirect("http://201.90.107.98:3399?user=Admin");
        }
        else {
            lblmsg.Text = "Login ou senha inválidos.";
        }
        
    }
}
