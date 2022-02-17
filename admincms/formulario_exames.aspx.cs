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
            txtDataInicio.Text = DateTime.Now.ToString("01/MM/yyyy");
            txtDataFim.Text = Convert.ToDateTime(DateTime.Now.AddMonths(1).ToString("yyyy-MM-01")).AddDays(-1).ToString("dd/MM/yyyy");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("portal_espaco_saude_criar.aspx");
    }

    
}