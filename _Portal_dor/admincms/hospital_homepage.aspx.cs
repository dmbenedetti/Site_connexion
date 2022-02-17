using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_portal_homepage : System.Web.UI.Page
{
    public int banner1 = 0;
    public int banner2 = 0;
    public int banner3 = 0;
    public int banner4 = 0;
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
            int idHosp = Convert.ToInt32(Session["idHosp"]);

            var banner = from b in cnDor.TB_PORTAL_BANNER where b.id_hospital == idHosp select b;

            if (id_idioma == 1) {//se o idioma for portugês
                foreach (var c in banner)
                {
                    if (c.id_posicao == 1) 
                        banner1 = c.id_banner;
                    if (c.id_posicao == 2) 
                        banner2 = c.id_banner;
                    if (c.id_posicao == 3) 
                        banner3 = c.id_banner;
                    if (c.id_posicao == 4)
                        banner4 = c.id_banner;
                }
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