using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_hospital_excluir : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { 
            int id_hospital = Convert.ToInt32(Request.QueryString["id"]);
            var hospital = cnDor.TB_HOSPITAL.Where(x => x.id_hospital == id_hospital).FirstOrDefault();
            if (hospital != null)
            {
                lbl_hospital.Text = hospital.nm_hospital;
            }//fim do if
            else {
                Response.Redirect("hospitais.aspx");
            }//fim do else
        }
    }
    protected void btn_excluir_hosp_Click(object sender, EventArgs e)
    {
        int id_hospital = Convert.ToInt32(Request.QueryString["id"]);
        var hospital = cnDor.TB_HOSPITAL.Where(x => x.id_hospital == id_hospital).FirstOrDefault();

        if (hospital != null)
        {
            //excluindo as especialidades do hospital
            var especiadidades = cnDor.TB_ESPECIALIDADE_HOSPITAL.Where(x => x.id_hospital == id_hospital).ToList();
            if (especiadidades.Count > 0)
            {
                for (int es = 0; especiadidades.Count > es; es++)
                {
                    int id_especialidade_hospital = Convert.ToInt32(especiadidades[es].id_especialidade_hospital);
                    var esp = cnDor.TB_ESPECIALIDADE_HOSPITAL.Where(x => x.id_especialidade_hospital == id_especialidade_hospital).FirstOrDefault();
                    cnDor.DeleteObject(esp);
                    cnDor.SaveChanges();
                }

            }//fim do if especiadidades.Count > 0

            //excluindo os exames do hospital
            var exames = cnDor.TB_EXAME_HOSPITAL.Where(x => x.id_hospital == id_hospital).ToList();
            if (exames.Count > 0)
            {
                for (int ex = 0; exames.Count > ex; ex++)
                {
                    int id_exame_hospital = Convert.ToInt32(exames[ex].id_exame_hospital);
                    var exa = cnDor.TB_EXAME_HOSPITAL.Where(x => x.id_exame_hospital == id_exame_hospital).FirstOrDefault();
                    cnDor.DeleteObject(exa);
                    cnDor.SaveChanges();
                }
            }//fim do if exames.Count > 0

            //excluindo prontosocorro do hospital
            var ps = cnDor.TB_PRONTOSOCORRO_HOSPITAL.Where(x => x.id_hospital == id_hospital).ToList();
            if (ps.Count > 0)
            {
                for (int psc = 0; ps.Count > psc; psc++)
                {
                    int id_prontosocorro_hospital = Convert.ToInt32(ps[psc].id_prontosocorro_hospital);
                    var psco = cnDor.TB_PRONTOSOCORRO_HOSPITAL.Where(x => x.id_prontosocorro_hospital == id_prontosocorro_hospital).FirstOrDefault();
                    cnDor.DeleteObject(psco);
                    cnDor.SaveChanges();
                }
            }//fim do if ps.Count > 0

            try
            {
                hospital.id_status = 2;
                cnDor.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Hospital removido com sucesso!');location.href='hospitais.aspx';", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel excluir. Erro:" + ex.Message + "')", true);
            }
        }//fim do if

    }
}