using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataTable tb_pg = new DataTable();
            tb_pg.Columns.Add("Pagina", typeof(string));
            tb_pg.Columns.Add("Ver", typeof(string));
            tb_pg.Rows.Add("Campanhas", "<a href='portal_campanhas_publicitarias.aspx'>Ver</a>");
            tb_pg.Rows.Add("Arquivos de Demonstrativo Financeiro", "<a href='portal_ogrupo_df.aspx'>Ver</a>");
            GridView2.DataSource = tb_pg;
            GridView2.DataBind();
        }//fim do if postback
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ogrupo_criar.aspx");
    }
}