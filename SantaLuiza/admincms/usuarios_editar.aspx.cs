using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_usuarios_editar : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            chb_hospitais.DataSource = cnDor.TB_HOSPITAL.ToList();
            chb_hospitais.DataTextField = "nm_hospital";
            chb_hospitais.DataValueField = "id_hospital";
            chb_hospitais.DataBind();


            int id_user = Convert.ToInt32(Request.QueryString["id"]);
            var usuario = cnDor.TB_ADMIN_USER.Where(x => x.id_user == id_user).FirstOrDefault();
            if (usuario != null)
            {
                txt_nome.Text = usuario.nm_user;
                lbl_usuario.Text = usuario.nm_user;
                txt_email.Text = usuario.ds_email;
                txt_login.Text = usuario.ds_login;

                var permissoes = cnDor.TB_PERMISSAO_ADMIN.Where(x => x.id_user == id_user).ToList();
                if (permissoes.Count > 0) {
                    for (int p = 0; permissoes.Count > p; p++) {
                        for (int c = 0; chb_hospitais.Items.Count > c; c++) {
                            if (chb_hospitais.Items[c].Value == permissoes[p].id_hospital.ToString()) {
                                chb_hospitais.Items[c].Selected = true;
                            }//fim do for
                        }//fim do for
                    }//fim do for
                }//fim do if

            }//fim do if usuario != null
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel encontrar o usuário');location.href='usuarios.aspx';", true);
            }//fim do else usuario != null

        }//fim do if IsPostBack
    }
    protected Boolean valida_login(string login_user)
    {
        int id_user = Convert.ToInt32(Request.QueryString["id"]);
        var usuario = (from u in cnDor.TB_ADMIN_USER
                       where u.ds_login == login_user && u.id_status == 1 && u.id_user !=id_user
                       select u).ToList();
        if (usuario.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void txt_login_TextChanged(object sender, EventArgs e)
    {
        string login = txt_login.Text;
        Boolean valida = valida_login(txt_login.Text);
        if (valida == false)
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
    protected void inserePermissao(int id_user, int id_hospital)
    {
        db_rede_dorModel.TB_PERMISSAO_ADMIN novaPermissao = new db_rede_dorModel.TB_PERMISSAO_ADMIN();
        novaPermissao.id_user = id_user;
        novaPermissao.id_hospital = id_hospital;
        cnDor.AddToTB_PERMISSAO_ADMIN(novaPermissao);
        cnDor.SaveChanges();
    }
    protected void btn_gravar_Click(object sender, EventArgs e)
    {
        int id_user = Convert.ToInt32(Request.QueryString["id"]);
        if (valida_login(txt_login.Text) == false)
        {
            var usuario = cnDor.TB_ADMIN_USER.Where(x => x.id_user == id_user).FirstOrDefault();
            usuario.nm_user = txt_nome.Text;
            usuario.ds_email = txt_email.Text;
            usuario.ds_login = txt_login.Text;
            if (txt_senha.Text != "")
            {
                usuario.ds_password = txt_senha.Text;
            }
            try
            {
                cnDor.SaveChanges();

                //excluir as permissões existentes
                var permissoes = cnDor.TB_PERMISSAO_ADMIN.Where(x => x.id_user == id_user).ToList();
                if (permissoes.Count > 0) {
                    for (int i = 0; permissoes.Count > i; i++) {
                        int id_permissao = permissoes[i].id_permissao;
                        var permissao = cnDor.TB_PERMISSAO_ADMIN.Where(x=>x.id_permissao == id_permissao).FirstOrDefault();
                        cnDor.DeleteObject(permissao);
                        cnDor.SaveChanges();
                    }//fim do for
                }//fim do if

                //inserir as novas permissões
                for (int i = 0; chb_hospitais.Items.Count > i; i++)
                {
                    if (chb_hospitais.Items[i].Selected == true)
                    {
                        int id_hosp = Convert.ToInt32(chb_hospitais.Items[i].Value);
                        inserePermissao(id_user, id_hosp);
                    }//fim do if
                }//fim do for

                //salvando todas as opções
                cnDor.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Usuário editado com sucesso');location.href='usuarios.aspx';", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Não foi possivel realizar a alteração. \nErro: " + ex.Message + "')", true);
            }
        }

    }
}