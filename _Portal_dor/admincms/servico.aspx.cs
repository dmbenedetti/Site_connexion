using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_servico : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        int idHosp = 0;
        int.TryParse(Session["idHosp"].ToString(), out idHosp);
        if (cnDor.TB_HOSPITAL_CONSULTORIOS.Where(h => h.idHospital == idHosp).Count() > 0)
        {
            DataTable tb_pg = new DataTable();
            tb_pg.Columns.Add("Pagina", typeof(string));
            tb_pg.Columns.Add("Ver", typeof(string));
            tb_pg.Rows.Add("Consultórios Especializados", "<a href='servicos_consultorios.aspx'>Ver</a>");
            GridView2.DataSource = tb_pg;
            GridView2.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("servico_criar.aspx");
    }
}