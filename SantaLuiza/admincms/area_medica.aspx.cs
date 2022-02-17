using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_iep : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataTable tb_pg = new DataTable();
            tb_pg.Columns.Add("Pagina", typeof(string));
            tb_pg.Columns.Add("Ver", typeof(string));
            tb_pg.Columns.Add("metatag", typeof(string));
            tb_pg.Rows.Add("Cursos e Palestras", "<a href='am_cursos.aspx'>Ver</a>", "<a href='adm_metatags_editar.aspx?r=7&pagina=am_cursos.aspx'>Meta Tags</a>");
            tb_pg.Rows.Add("Artigos Cientificos", "<a href='am_revista_meddor.aspx'>Ver</a>", "<a href='adm_metatags_editar.aspx?r=7&pagina=am_revistas.aspx'>Meta Tags</a>");
            tb_pg.Rows.Add("Documentos", "<a href='am_docs.aspx'>Ver</a>", "<a href='adm_metatags_editar.aspx?r=7&pagina=am_docs.aspx'>Meta Tags</a>");
            GridView2.DataSource = tb_pg;
            GridView2.DataBind();
        }//fim do if postback
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("am_criar.aspx");
    }
}