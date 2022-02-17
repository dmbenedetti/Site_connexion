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
                 banner1 = 1003;
                 banner2 = 1004;
            }
            else if (id_idioma == 2)
            { //se o idioma for Inglês
                banner1 = 33;
                banner2 = 34;
            }
            else { //se o idioma for espanhol
                banner1 = 35;
                banner2 = 36;
            }


        }//fim do if !Page.IsPostBack
    }
}