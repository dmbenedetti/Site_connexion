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
        db_rede_dorModel.TB_PRONTOSOCORRO novoPS = new db_rede_dorModel.TB_PRONTOSOCORRO();
        novoPS.nm_prontosocorro = txt_emergencia.Text;
        novoPS.ds_prontosocorro = txt_descricao.Text;
        novoPS.id_status = 1;
        try
        {
            cnDor.AddToTB_PRONTOSOCORRO(novoPS);
            cnDor.SaveChanges();
            lbl_msg.Text = txt_emergencia.Text +" gravado com sucesso!";
            txt_emergencia.Text = string.Empty;
            txt_descricao.Text = string.Empty;
            gdv_emergencia.DataBind();
        }
        catch (Exception ex)
        {
            lbl_msg.Text = "";
            ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possível efetuar o cadastro. \nErro: "+ex.Message+".')", true);            
        }
    }
}