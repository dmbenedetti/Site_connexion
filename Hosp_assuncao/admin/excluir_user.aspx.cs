using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_excluir_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id_user = Convert.ToInt32(Request.QueryString["admin_id"]);
        if (!Page.IsPostBack)
        {
            DataSet1TableAdapters.tb_users_admTableAdapter select_user = new DataSet1TableAdapters.tb_users_admTableAdapter();
            DataTable tb00 = select_user.Get_select_id(id_user);
            if (tb00.Rows.Count > 0)
            {
                lbldados_user.Text = "<strong>Nome: </strong>" + (string)tb00.Rows[0]["nome"] + "<br />";
                lbldados_user.Text += "<strong>Login: </strong>" + (string)tb00.Rows[0]["login"] + "<br />";
                lbldados_user.Text += "<strong>Nível: </strong>" + (string)tb00.Rows[0]["tipo"];
            }//fim do if
            
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_user = Convert.ToInt32(Request.QueryString["admin_id"]);
        DataSet1TableAdapters.tb_users_admTableAdapter delete_user = new DataSet1TableAdapters.tb_users_admTableAdapter();
        delete_user.Delete_user(id_user);
        Response.Write(@"<script>alert('Usuário excluído com sucesso!');location.href='user.aspx'</script>");


    }
}
