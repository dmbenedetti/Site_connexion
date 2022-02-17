using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class foto_bebe_portaretrato : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        int id;
        int.TryParse(Request["id"], out id);
        if (id > 0)
        {
            var foto_bebe = (from a in cnDor.TB_FOTO_BEBE where a.id_foto == id select a).FirstOrDefault();
            if (foto_bebe != null)
            {
                imgRetrato.ImageUrl = "images/foto_bebe/" + foto_bebe.ds_foto_bebe;
                ltlNomeTitulo.Text = foto_bebe.ds_nome_bebe;
                lblNascimento.Text = foto_bebe.dt_nascimento.ToString("dd/MM/yyyy");
                ltlBebe.Text = foto_bebe.ds_nome_bebe;
                lblEstatura.Text = foto_bebe.nu_estatura.ToString() + " cm";
                lblHorario.Text = foto_bebe.dt_nascimento.ToString("HH:mm");
                lblMae.Text = foto_bebe.ds_nome_mae;
                lblObstetra.Text = foto_bebe.ds_obstreta;
                lblPai.Text = foto_bebe.ds_nome_pai;
                lblPediatra.Text = foto_bebe.ds_pediatra;
                lblPeso.Text = foto_bebe.nu_peso.ToString() + " Kg";
                lblUnidade.Text = (from a in cnDor.TB_HOSPITAL where a.id_hospital == foto_bebe.id_hospital select a).FirstOrDefault().nm_hospital;
                var fotobebehospital = (from a in cnDor.TB_HOSPTIAL_FOTO_BEBE where a.id_hospital == foto_bebe.id_hospital select a).FirstOrDefault();
                if (!String.IsNullOrEmpty(fotobebehospital.ds_moldura))
                {
                    //modura.Style.Add("background-image", "url(images/" + fotobebehospital.ds_moldura + ")");
                    imgMoldura.ImageUrl = "images/" + fotobebehospital.ds_moldura;
                }
            }
        }
    }
}