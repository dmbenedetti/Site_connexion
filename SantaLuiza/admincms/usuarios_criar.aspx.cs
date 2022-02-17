using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class admincms_usuarios_criar : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            chb_hospitais.DataSource = cnDor.TB_HOSPITAL.ToList();
            chb_hospitais.DataTextField = "nm_hospital";
            chb_hospitais.DataValueField = "id_hospital";
            chb_hospitais.DataBind();

        }//fim do if !Page.IsPostBack
    }
    protected Boolean valida_login(string login_user)
    {
        var usuario = (from u in cnDor.TB_ADMIN_USER
                          where u.ds_login == login_user && u.id_status==1
                          select u).ToList();
        if (usuario.Count > 0)
        {
            return true;
        }
        else {
            return false;
        }
    }
    protected void txt_login_TextChanged(object sender, EventArgs e)
    {
        string login = txt_login.Text;
        Boolean valida = valida_login(txt_login.Text);
        if ( valida == false)
        {//se não existir um login ativo no banco de dados
            lbl_valida_login.Text = string.Empty;
            btn_gravar.Enabled = true;
            txt_senha.Focus();
        }
        else
        {//se já existir um login ativo no banco de dados
            lbl_valida_login.Text = "Login Indisponivel ";
            btn_gravar.Enabled = false;
            txt_login.Focus();
        }
    }
    protected void inserePermissao(int id_user, int id_hospital){
        db_rede_dorModel.TB_PERMISSAO_ADMIN novaPermissao = new db_rede_dorModel.TB_PERMISSAO_ADMIN();
        novaPermissao.id_user = id_user;
        novaPermissao.id_hospital = id_hospital;
        cnDor.AddToTB_PERMISSAO_ADMIN(novaPermissao);
        cnDor.SaveChanges();
    }
    protected void btn_gravar_Click(object sender, EventArgs e)
    {
        string nome = txt_nome.Text;
        string email = txt_email.Text;
        string login = txt_login.Text;
        string senha = txt_senha.Text;
        if (valida_login(login) == false) {
            db_rede_dorModel.TB_ADMIN_USER novoUser = new db_rede_dorModel.TB_ADMIN_USER();
            novoUser.id_status = 1;
            novoUser.nm_user = nome;
            novoUser.ds_email = email;
            novoUser.ds_login = login;
            novoUser.ds_password = senha;

            try
            {
                cnDor.AddToTB_ADMIN_USER(novoUser);
                cnDor.SaveChanges();
                int id_user = cnDor.TB_ADMIN_USER.OrderByDescending(x=>x.id_user).Select(x=>x.id_user).FirstOrDefault();


                for (int i = 0; chb_hospitais.Items.Count > i; i++) {
                if (chb_hospitais.Items[i].Selected == true) {
                    int id_hosp = Convert.ToInt32(chb_hospitais.Items[i].Value);
                    inserePermissao(id_user, id_hosp);
                }//fim do if
            }//fim do for


                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Usuário cadastrado com sucesso');location.href='usuarios.aspx';", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Não foi possivel realizar o cadastro. \nErro: "+ex.Message+"')", true);
            }
            
        }//fim do if
    }
}