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
        db_rede_dorModel.TB_EXAME novaExame = new db_rede_dorModel.TB_EXAME();
        novaExame.nm_exame = txt_exame.Text;
        novaExame.ds_exame = txt_descricao.Text;
        novaExame.id_status = 1;
        try
        {
            cnDor.AddToTB_EXAME(novaExame);
            cnDor.SaveChanges();
            lbl_msg.Text = txt_exame.Text +" gravado com sucesso!";
            txt_exame.Text = string.Empty;
            txt_descricao.Text = string.Empty;
            gdv_exame.DataBind();
        }
        catch (Exception ex)
        {
            lbl_msg.Text = "";
            ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possível efetuar o cadastro. \nErro: "+ex.Message+".')", true);            
        }
    }
}