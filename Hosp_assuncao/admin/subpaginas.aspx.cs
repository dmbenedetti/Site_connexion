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

public partial class admin_paginas_portal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb01 = paginas.Get_select_id(id);
        if (tb01.Rows.Count > 0)
        {
            lbl_paginamae.Text = (string)tb01.Rows[0]["Titulo"];
        }//fim do if tb01.rows.count
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string id_pagina_mae = Request.QueryString["id"];
        Response.Redirect("inserir_subpagina.aspx?id="+id_pagina_mae);
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("paginas.aspx");
    }
}
