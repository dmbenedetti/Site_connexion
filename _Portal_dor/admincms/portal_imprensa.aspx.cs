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
        if (!Page.IsPostBack) {
            DataTable tb_pg = new DataTable();
            tb_pg.Columns.Add("Pagina",typeof(string));
            tb_pg.Columns.Add("Ver", typeof(string));
            tb_pg.Columns.Add("metatag", typeof(string));
            tb_pg.Rows.Add("Notícias", "<a href='portal_noticias.aspx'>Ver</a>", "<a href='adm_metatags_editar.aspx?r=6&pagina=noticias.aspx'>Meta Tags</a>");
            tb_pg.Rows.Add("Releases  ", "<a href='portal_releases.aspx'>Ver</a>", "<a href='adm_metatags_editar.aspx?r=6&pagina=releases.aspx'>Meta Tags</a>");

            GridView2.DataSource = tb_pg;
            GridView2.DataBind();
        }//fim do if postback

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("portal_imprensa_criar.aspx");
    }
}