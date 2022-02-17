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
                 banner1 = 1;
                 banner2 = 2;
                 banner3 = 3;
                 banner4 = 4;
            }
            else if (id_idioma == 2)
            { //se o idioma for Inglês
                banner1 = 5;
                banner2 = 6;
                banner3 = 7;
                banner4 = 8;
            }
            else { //se o idioma for espanhol
                banner1 = 9;
                banner2 = 10;
                banner3 = 11;
                banner4 = 12;
            }


        }//fim do if !Page.IsPostBack
    }
}