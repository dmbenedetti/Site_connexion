using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_ohospital : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable tb_pg = new DataTable();
        tb_pg.Columns.Add("Pagina", typeof(string));
        tb_pg.Columns.Add("Ver", typeof(string));
        tb_pg.Rows.Add("Corpo Clínico", "<a href='corpo_clinico.aspx'>Ver</a>");
        GridView2.DataSource = tb_pg;
        GridView2.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ohospital_criar.aspx");
    }
}