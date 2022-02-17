using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_formulario_exames_protocolo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        int idProtocolo = 0;
        int.TryParse(Request["id"], out idProtocolo);
        if (idProtocolo > 0)
        {
            var Protocolo = cnDor.TB_FORMULARIO_EXAMES.Where(a => a.id_exames_imagem == idProtocolo).FirstOrDefault();
            if (Protocolo != null)
            {
                ltlCelular.Text = Protocolo.ds_telefone_celular;
                ltlDataExame.Text = Protocolo.dt_atendimento.ToString("MM/yyyy");
                ltlNome.Text = Protocolo.ds_nome;
                ltlProtocolo.Text = idProtocolo.ToString();
                ltlTelefone.Text = Protocolo.ds_telefone_fixo;
                ltlTipoAtendimento.Text = Protocolo.ds_atendimento;
                ltlDataSolicitacao.Text = Protocolo.dt_solicitacao.ToString("dd/MM/yyy HH:mm");
                ltlObs.Text = Protocolo.ds_observacao.Replace("\n", "<br>");
                ltlDataNascimento.Text = Protocolo.ds_data_nascimento;
            }
        }
    }
}