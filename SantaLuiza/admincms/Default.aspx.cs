using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admincms_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            Label1.Text = Convert.ToString(Session["idHosp"]);
        }//fim do if
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("iduser");
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();

    }
}