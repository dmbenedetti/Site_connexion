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
            int id_user = Convert.ToInt32(Request.QueryString["id"]);
            var usuario = cnDor.TB_ADMIN_USER.Where(x => x.id_user == id_user).FirstOrDefault();
            if (usuario != null)
            {
                lbl_usuer.Text = usuario.nm_user;
                lbl_usuario.Text = usuario.nm_user;
            }//fim do if usuario != null
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel encontrar o usuário');location.href='usuarios.aspx';", true);
            }//fim do else usuario != null

        }//fim do if IsPostBack
    }
    protected void btn_gravar_Click(object sender, EventArgs e)
    {
        int id_user = Convert.ToInt32(Request.QueryString["id"]);
            var usuario = cnDor.TB_ADMIN_USER.Where(x => x.id_user == id_user).FirstOrDefault();
            try
            {
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

            var menus = cnDor.TB_ADMIN_USER_MENU.Where(j => j.id_user == id_user);
            foreach (var menu in menus)
            {
                cnDor.DeleteObject(menu);
                cnDor.SaveChanges();
            }

            //salvando todas as opções
            cnDor.DeleteObject(usuario);
                cnDor.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Usuário excluido com sucesso');location.href='usuarios.aspx';", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Não foi possivel realizar a exclusão. \nErro: " + ex.Message + "')", true);
            }
    }
}