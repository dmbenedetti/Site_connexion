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

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnentrar_Click(object sender, EventArgs e)
    {
        string login = txtlogin.Text;
        string senha = txtsenha.Text;


        DataSet1TableAdapters.tb_users_admTableAdapter ta1 = new DataSet1TableAdapters.tb_users_admTableAdapter();
        DataTable tb1 = ta1.Get_select_login_senha(login, senha);
        string nome_user;
        int id_user;
        string senha_user;
        string login_user;
        string grupo;


        if (tb1.Rows.Count > 0)
        {
            id_user = (int)tb1.Rows[0]["id"];
            nome_user = (string)tb1.Rows[0]["nome"];
            senha_user = (string)tb1.Rows[0]["senha"];
            login_user = (string)tb1.Rows[0]["login"];
            grupo = (string)tb1.Rows[0]["tipo"];
            

            if (login_user == login && senha_user == senha)
            {
                Session["iduser"] = id_user;
                Session["nomeuser"] = nome_user;
                Session["grupo"] = grupo;
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Usuário ou senha inválido!');location.href='default.aspx';</script>");
            }
        }
        else
        {
            Response.Write(@"<script language='javascript'>alert('Usuário ou senha inválido!');location.href='default.aspx';</script>");
        }
    }
}
