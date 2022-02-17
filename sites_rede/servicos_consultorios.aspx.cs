using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class servicos_consultorios : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int idHosp = 0;
            int.TryParse(Session["idHosp"].ToString(), out idHosp);
            var oHosp = cnDor.TB_HOSPITAL_CONSULTORIOS.Where(a => a.idHospital == idHosp).FirstOrDefault();
            if (oHosp != null)
            {
                imgConsultorios.ImageUrl = "~/images/" + oHosp.dsImagem;
                rptEspecialidades.DataSource = cnDor.TB_ESPECIALIDADE_CONSULTORIOS.Where(a => a.idHosp == idHosp).OrderBy(h => h.dsNome).ToList();
                rptEspecialidades.DataBind();
                drpEsp.Items.Add(new ListItem() { Text = "Todos", Value = "-1", Selected = true });
                foreach (var item in cnDor.TB_ESPECIALIDADE_CONSULTORIOS.OrderBy(i => i.dsNome))
                {
                    drpEsp.Items.Add(new ListItem() { Text = item.dsNome, Value = item.idEspecialidade_Consutorios.ToString()});
                }
                drpEsp.DataBind();
            }
        }
    }

    protected void rptEspecialidades_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var oEsp = (HiddenField)e.Item.FindControl("idEspecialidade");
        int idEsp = Convert.ToInt32(oEsp.Value);
        var rpr = (Repeater)e.Item.FindControl("rptMedicos");
        rpr.DataSource = cnDor.TB_MEDICO_CONSULTORIOS.Where(j => j.idEspecialidade_Consutorios == idEsp && (txtMedico.Text == "" || j.dsNome.ToLower().IndexOf(txtMedico.Text.ToLower()) > -1)).OrderBy(j => j.dsNome).ToList();
        rpr.DataBind();
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        int idHosp = 0;
        int.TryParse(Session["idHosp"].ToString(), out idHosp);
        var oHosp = cnDor.TB_HOSPITAL_CONSULTORIOS.Where(a => a.idHospital == idHosp).FirstOrDefault();
        if (oHosp != null)
        {
            int idEsp = Convert.ToInt32(drpEsp.SelectedValue);
            var oRet = (from a in cnDor.TB_ESPECIALIDADE_CONSULTORIOS join b in cnDor.TB_MEDICO_CONSULTORIOS on a.idEspecialidade_Consutorios equals b.idEspecialidade_Consutorios where ((drpEsp.SelectedValue == "-1" || a.idEspecialidade_Consutorios == idEsp ) && (txtMedico.Text == "" || b.dsNome.ToLower().IndexOf(txtMedico.Text.ToLower()) > -1)) select a).ToList();
            imgConsultorios.ImageUrl = "~/images/" + oHosp.dsImagem;
            rptEspecialidades.DataSource = oRet.OrderBy(h => h.dsNome).Distinct().ToList();
            rptEspecialidades.DataBind();
        }

    }
}