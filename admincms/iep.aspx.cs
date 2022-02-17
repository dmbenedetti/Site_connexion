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
            tb_pg.Rows.Add("Instituto D'Or", "<a href='portal_iep_dor.aspx'>Ver</a>");
            tb_pg.Rows.Add("Instituto IEP", "<a href='portal_iep_iep.aspx'>Ver</a>");
            tb_pg.Rows.Add("Instituto D'Or Gestão de Saúde Pública", "<a href='portal_iep_saude_publica.aspx'>Ver</a>");
            tb_pg.Rows.Add("Centro de Estudos São Luiz", "<a href='portal_iep_sluiz.aspx'>Ver</a>");
            GridView2.DataSource = tb_pg;
            GridView2.DataBind();
        }//fim do if postback
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("iep_criar.aspx");
    }
}