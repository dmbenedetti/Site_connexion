using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class resultadoexames : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ltlMsg.Text = "";
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        int idCliente = -1;
        idCliente = new exameBO().ValidaLogin(txtSenha.Text, txtNic.Text);
        if (idCliente > 0)
        {
            Session["idCliente"] = idCliente;
            Response.Redirect("resultadoexameslista.aspx", true);
        }
        else
        {
            ltlMsg.Text = "Paciente ou senha inválidos ou período de consulta do exame expirado.";
        }
    }
}
