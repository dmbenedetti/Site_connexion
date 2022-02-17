using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ResultadoExame : System.Web.UI.Page
{
    int idCliente = 0;
    int idExame = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int.TryParse(Request["d"], out idExame);
            int.TryParse(Session["idCliente"].ToString(), out idCliente);
        }
        catch
        {
            idExame = 0;
            idCliente = 0;
        }
        if (idCliente > 0 && idExame > 0)
            BindExame();

    }

    private void BindExame()
    {
        exameBO oExameBO = new exameBO();
        exame_ficha oExameFicha = oExameBO.ExameFicha(idExame, idCliente);
        if (oExameFicha != null)
        {
            exame_cliente oExameCliente = oExameBO.ExameCliente(idCliente);
            Cliente.Text = oExameCliente.ds_nome.ToString();
            exame_profissional_saude oProfissionalSaude = null;
            List<exame> oExames = oExameBO.Exames(idExame, idCliente);
            if (oExames != null && oExames.Count > 0)
            {
                if (oExames[0].id_exame_profissional_saude != null && oExames[0].id_exame_profissional_saude > 0)
                {
                    int idProfissionalSaude = Convert.ToInt32(oExames[0].id_exame_profissional_saude);
                    oProfissionalSaude = oExameBO.ExameProfissionalSaude(idProfissionalSaude);
                    if (oProfissionalSaude.ds_nome != null)
                        ltlMedico.Text = oProfissionalSaude.ds_nome.ToString() + " - " + oProfissionalSaude.nu_registro.ToString();
                }
                if (oExames[0].dt_exame != null)
                {
                    ltlData.Text = Convert.ToDateTime(oExames[0].dt_exame).ToString("dd/MM/yyyy");
                }
                foreach (exame oExame in oExames)
                {
                    ltlResultado.Text += oExame.ds_laudo; 
                }
                ltlResultado.Text += "\n\n";
                foreach (exame oExame in oExames)
                {
                    ltlResultado.Text += oExame.ds_evolutivo;
                }

            }
        }
    }
}
