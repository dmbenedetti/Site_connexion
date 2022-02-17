using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("iduser");
        Session.Remove("nomeuser");
        Session.Remove("idioma");
        Session.Remove("idHosp");
    }
    private bool atutenticateUser(string password, string user)
    {
        bool bflag = false;
        db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
        var usuario = cnDor.TB_ADMIN_USER.Where(x => x.ds_login == user && x.ds_password == password).FirstOrDefault();

        if (usuario != null)
        {
            Session["iduser"] = usuario.id_user.ToString();
            Session["nomeuser"] = usuario.nm_user;
            Session["idioma"] = 1;
            //Session["idHosp"] = null;
            bflag = true;
            return bflag;
        }//fim do if usuario != null
        else
        {
            return bflag;
        }//fim do else        
    }
    protected void login_admin_Authenticate(object sender, AuthenticateEventArgs e)
    {
        try
        {
            string usuario = Convert.ToString(login_admin.UserName);//pega o nome do user no login
            string password = Convert.ToString(login_admin.Password.Trim());//pega a senha digitada no login

            bool flag = atutenticateUser(password, usuario);
            if (flag == true)
            {
                e.Authenticated = true;
                login_admin.DestinationPageUrl = "Default.aspx";
            }//fim do if
            else
            {
                login_admin.FailureText = "Usuário ou senha inválido <br />";
                e.Authenticated = false;
            }//fim do else
        }//fim do try
        catch (Exception ex)
        {
            login_admin.FailureText = "Usuário ou senha inválido <br />"+ex.Message;
            e.Authenticated = false;
        }//fim do catch
    }
}