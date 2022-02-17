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

public partial class admin_portal_excluir_pagina : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id=Convert.ToInt32(Request.QueryString["id"]);
        if (!Page.IsPostBack) {
            DataSet1TableAdapters.tb_noticiasTableAdapter select_pagina = new DataSet1TableAdapters.tb_noticiasTableAdapter();
            DataTable tb01 = select_pagina.Get_select_id(id);
            lbl_pagina.Text = (string)tb01.Rows[0]["titulo"];
        }//fim do if Page.IsPotBack
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet1TableAdapters.tb_noticiasTableAdapter paginas = new DataSet1TableAdapters.tb_noticiasTableAdapter();

        
            paginas.Delete_noticia(id);
            Response.Write(@"<script>alert('Notícia Excluída com Sucesso!');location.href='noticias.aspx'</script>");
               
    }
}
