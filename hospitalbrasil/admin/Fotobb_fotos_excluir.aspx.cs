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
using System.IO;

public partial class admin_Fotobb_texto : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            int id_foto = Convert.ToInt32(Request.QueryString["id"]);
            DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
            DataTable tb00 = fotos.Get_select_id(id_foto);
            if (tb00.Rows.Count > 0) {
                lbl_codigo.Text = (string)tb00.Rows[0]["codigo"];
                
                
            }//fim do if tb00
        }//fim do if page.ispostback

    }


    
    
    
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id_foto = Convert.ToInt32(Request.QueryString["id"]);
        DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        DataTable tb00 = fotos.Get_select_id(id_foto);
        string foto1 = "";
        string foto2 = "";
        if (tb00.Rows.Count > 0)
        {
            lbl_codigo.Text = (string)tb00.Rows[0]["codigo"];
            foto1 = (string)tb00.Rows[0]["foto1"];
            foto2 = (string)tb00.Rows[0]["foto2"];
        }//fim do if tb00
        if (foto2 == "" || foto2 == null)
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/fotosbb/" + foto1);
            File.Delete(MapPath("../") + "/fotosbb/" + foto1);
        }
        else { 
            FileInfo TheFile = new FileInfo(MapPath("../") + "/fotosbb/" + foto1);
            FileInfo TheFile2 = new FileInfo(MapPath("../") + "/fotosbb/" + foto2);
            File.Delete(MapPath("../") + "/fotosbb/" + foto1);
            File.Delete(MapPath("../") + "/fotosbb/" + foto2);
        }
        fotos.Delete_fotobb(id_foto);
        Response.Write(@"<script>alert('Fotos excluidas com Sucesso');location.href='Fotobb_fotos.aspx'</script>");



    }
}
