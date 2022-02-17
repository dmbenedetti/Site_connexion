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
        //SERGINEI
        ////string login = txtlogin.Text;
        ////string senha = txtsenha.Text;

        ////simposioTableAdapters.tb_usersTableAdapter users = new simposioTableAdapters.tb_usersTableAdapter();
        ////DataTable tb1 = users.Get_select_login_password(login, senha);
        ////string nome_user;
        ////int id_user;
        ////string senha_user;
        ////string login_user;


        ////if (tb1.Rows.Count > 0)
        ////{
        ////    id_user = (int)tb1.Rows[0]["id_user"];
        ////    nome_user = (string)tb1.Rows[0]["nm_user"];
        ////    senha_user = (string)tb1.Rows[0]["ds_login"];
        ////    login_user = (string)tb1.Rows[0]["ds_password"];

            
        ////        Session["iduser"] = id_user;
        ////        Session["nomeuser"] = nome_user;
        ////        Response.Redirect("home.aspx");
            
        ////}
        ////else
        ////{
        ////    Response.Write(@"<script language='javascript'>alert('Usuário ou senha inválido!');location.href='default.aspx';</script>");
        ////}
    }
}
