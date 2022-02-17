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

public partial class admin_editar_user : System.Web.UI.Page
{
    //funcção para verificar se há algum outro usuário com o mesmo login
    public string verifica_login(string login, int id_user)
    {
        DataSet1TableAdapters.tb_users_admTableAdapter select_login = new DataSet1TableAdapters.tb_users_admTableAdapter();
        DataTable tb00 = select_login.Get_select_login_igual(login, id_user);

        int qtde_linhas = tb00.Rows.Count;
        //verifica se encontrou algum outro usuário com o mesmo login digitado
        if (qtde_linhas > 0)
        { //se encontrou um login igual faz as intruções abaixo
            return "falso";
        }//fim do if
        else
        { //se não encontrou login igual
            return "ok";
        }//fim do else

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int id_user = Convert.ToInt32(Request.QueryString["admin_id"]);
        if (!Page.IsPostBack)
        {
            DataSet1TableAdapters.tb_users_admTableAdapter select_user = new DataSet1TableAdapters.tb_users_admTableAdapter();
            DataTable tb00 = select_user.Get_select_id(id_user);
            if (tb00.Rows.Count > 0)
            {
                txtnome.Text = (string)tb00.Rows[0]["nome"];
                txtlogin.Text = (string)tb00.Rows[0]["login"];
                drpnivel.Text = (string)tb00.Rows[0]["tipo"];
                txtemail.Text = (string)tb00.Rows[0]["email"];
            }//fim do if

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_user = Convert.ToInt32(Request.QueryString["admin_id"]);
        string nome = txtnome.Text;
        string login = txtlogin.Text;
        string senha = txtsenha.Text;
        string senha_confirm = txtsenha_confirmar.Text;
        string nivel = drpnivel.Text;
        string email = txtemail.Text;

        //verifica se o login digitado não está sendo usado por outro usuário
        string verifica_login_digitado = verifica_login(login, id_user);
        if (verifica_login_digitado == "ok")
        {//se o login estiber liberado para cadastro faz as instruções abaixo.

            //verifica se foi digitado alguma senha
            if (senha != "")
            {
                //verifica se as senhas digitadas são iguais
                if (senha == senha_confirm)
                { //faz as instruções abaixo se as senhas forem iguais
                    DataSet1TableAdapters.tb_users_admTableAdapter update_user = new DataSet1TableAdapters.tb_users_admTableAdapter();
                    update_user.Update_user(nome, email, login, senha, nivel, id_user);
                    Response.Write(@"<script>alert('Dados alterado com sucesso!');location.href='user.aspx'</script>");
                }//fim do if
                else
                { //faz as instruções abaixo se as senhas forem diferentes
                    txtnome.Text = nome;
                    txtlogin.Text = login;
                    drpnivel.Text = nivel;
                    lblmsg.Text = "<strong>Atenção:</strong><br /> As senha digitadas não são iguais. Por favor digite corretametne.";

                }//fim do else

            }//fim do if
            else
            { //se não foi digitado uma nova senha faz as instruções abaixo.
                DataSet1TableAdapters.tb_users_admTableAdapter update_user = new DataSet1TableAdapters.tb_users_admTableAdapter();
                update_user.Update_user_sem_senha(nome, email, login, nivel, id_user);
                Response.Write(@"<script>alert('Dados alterado com sucesso!');location.href='user.aspx'</script>");
            }//fim do else

        }//fim do if
        else
        {//se o login já estiver sendo usado por outro usuário faz as instruções abaixo
            txtnome.Text = nome;
            txtlogin.Text = login;
            drpnivel.Text = nivel;
            lblmsg.Text = "<strong>Atenção:</strong><br /> O login digitado já está sendo usado por outro usuário. Por favor escolha outro login.";
        }//fim do else





    }
}
