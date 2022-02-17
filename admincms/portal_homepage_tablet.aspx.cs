using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_portal_homepage : System.Web.UI.Page
{
    public int banner1;
    public int banner2;
    public int banner3;
    public int banner4;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);

            if (id_idioma == 1) {//se o idioma for portugês
                 banner1 = 1001;
                 banner2 = 1002;
            }
            else if (id_idioma == 2)
            { //se o idioma for Inglês
                banner1 = 23;
                banner2 = 24;
            }
            else { //se o idioma for espanhol
                banner1 = 25;
                banner2 = 26;
            }


        }//fim do if !Page.IsPostBack
    }
}