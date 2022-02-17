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
            DataSet1TableAdapters.tb_paginasTableAdapter select_pagina = new DataSet1TableAdapters.tb_paginasTableAdapter();
            DataTable tb01 = select_pagina.Get_select_id(id);
            lbl_pagina.Text = (string)tb01.Rows[0]["titulo"];
        }//fim do if Page.IsPotBack
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();

        DataTable tb02 = paginas.Get_select_subpgina_id_pagina_mae(id);
        if (tb02.Rows.Count > 0)
        {
            lblmsg.Text = "<strong>Atenção!</strong><br />Esta página não pode ser excluída pois existem subpáginas vinculadas a ela.<br / >";
            lblmsg.Text += "Por Favor, exclua primeiro as subpáginas antes de tentar excluir está página.<br / >";
            ImageButton2.Visible = false;
        }//fim do if tb02.Rows.Count
        else {
            paginas.Delete_pagina(id);
            Response.Write(@"<script>alert('Página Excluída com Sucesso!');location.href='paginas.aspx'</script>");
        }//fim do else tb02.Rows.Count        
    }
}
