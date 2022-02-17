using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_hospitais_especialidades : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_gravar_Click(object sender, EventArgs e)
    {
        db_rede_dorModel.TB_EPSECIALIDADE novaEspecialidade = new db_rede_dorModel.TB_EPSECIALIDADE();
        novaEspecialidade.nm_especialidade = txt_Especialidade.Text;
        novaEspecialidade.ds_especialidade = txt_descricao.Text;
        novaEspecialidade.id_status = 1;
        try
        {
            cnDor.AddToTB_EPSECIALIDADE(novaEspecialidade);
            cnDor.SaveChanges();
            lbl_msg.Text = txt_Especialidade.Text +" gravado com sucesso!";
            txt_Especialidade.Text = string.Empty;
            txt_descricao.Text = string.Empty;
            gdv_especialidade.DataBind();
            
            //ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Especialidade gravada com sucesso.')", true);
        }
        catch (Exception ex)
        {
            lbl_msg.Text = "";
            ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possível efetuar o cadastro. \nErro: "+ex.Message+".')", true);            
        }
    }
}