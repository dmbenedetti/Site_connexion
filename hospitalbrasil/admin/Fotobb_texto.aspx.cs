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

public partial class admin_Fotobb_texto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            DataSet1TableAdapters.tb_fotosbb_textoTableAdapter texto = new DataSet1TableAdapters.tb_fotosbb_textoTableAdapter();
            DataTable tb00 = texto.Get_select_id();
            if (tb00.Rows.Count > 0)
            {
                FCKeditor1.Value = (string)tb00.Rows[0]["conteudo"];
            }
        }//fim do if page.ispostback

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string conteudo = FCKeditor1.Value;
        DataSet1TableAdapters.tb_fotosbb_textoTableAdapter texto = new DataSet1TableAdapters.tb_fotosbb_textoTableAdapter();
        texto.Update_texto(conteudo);
        Response.Write(@"<script>alert('Dados alterados com sucesso');location.href='Fotobb_texto.aspx'</script>");
    }
}
