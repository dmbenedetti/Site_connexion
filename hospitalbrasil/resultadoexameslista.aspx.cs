using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class resultadoexameslista : System.Web.UI.Page
{
    private int idCliente = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["idCliente"] == null)
            Response.Redirect("resultadoexames.aspx");

        int.TryParse(Session["idCliente"].ToString(), out idCliente);
        if (idCliente > 0)
        {
            BindGrid();
        }

    }

    private void BindGrid()
    {
        rptExames.DataSource = new exameBO().ListaExames(idCliente);
        rptExames.DataBind();
    }
}
