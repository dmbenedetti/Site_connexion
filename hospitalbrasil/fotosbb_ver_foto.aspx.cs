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

public partial class fotosbb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_bb = Convert.ToInt32(Request.QueryString["id_bb"]);
            string foto = "foto"+Convert.ToString(Request.QueryString["foto"]);
            DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
            DataTable tb00 = fotos.Get_select_id(id_bb);
            if (tb00.Rows.Count > 0)
            {
                string foto1 = (string)tb00.Rows[0][foto];

                string foto_samall_1 = (string)tb00.Rows[0]["foto1"];
                string foto_samall_2 = (string)tb00.Rows[0]["foto2"];
                Image1.ImageUrl = "fotosbb/" + foto1;
                lbl_foto1.Text = "<a href='fotosbb_ver_foto.aspx?id_bb=" + id_bb + "&foto=1'><img src='fotosbb/" + foto_samall_1 + "' width=50 height=34></a>";
                if (foto_samall_2 == "" || foto_samall_2 == null)
                {
                    lbl_foto2.Text = "";
                }
                else {
                    lbl_foto2.Text = "<a href='fotosbb_ver_foto.aspx?id_bb=" + id_bb + "&foto=2'><img src='fotosbb/" + foto_samall_2 + "' width=50 height=34></a>"; 
                }

            }
        }//fim do if page.ispostback
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int id_bb = Convert.ToInt32(Request.QueryString["id_bb"]);
        Response.Redirect("fotosbb_ver.aspx?id_bb=" + id_bb);
    }
}
