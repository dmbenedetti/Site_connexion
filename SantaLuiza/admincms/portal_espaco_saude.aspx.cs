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
            //tb_pg.Rows.Add("Revista Sua Saúde", "<a href='portal_revista_suaSaude.aspx'>Ver</a>");
            tb_pg.Rows.Add("Saúde com os Hospitais Rede D'Or São Luiz", "<a href='portal_saude_HSL_DOR.aspx'>Ver</a>");
            //tb_pg.Rows.Add("Campanhas Publicitárias", "<a href='portal_campanhas_publicitarias.aspx'>Ver</a>");
            //tb_pg.Rows.Add("Patrocínios", "<a href='#'>Ver</a>");
            tb_pg.Rows.Add("Programetes da Discovery", "<a href='portal_programetes.aspx'>Ver</a>");
            tb_pg.Rows.Add("Sua Saúde", "<a href='portal_saude_sua_saude.aspx'>Ver</a>");

            GridView2.DataSource = tb_pg;
            GridView2.DataBind();
        }//fim do if postback

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("portal_espaco_saude_criar.aspx");
    }
}