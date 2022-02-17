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
        
    }

    protected void drpMenu_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnGravar_Click(object sender, EventArgs e)
    {
        int idSessao = 0;
        int.TryParse(drpMenu.SelectedValue, out idSessao);
        foreach (var menuordem in cnDor.TB_PORTAL_MENU_ORDEM.Where(a => a.id_sessao == idSessao && a.id_hospital == 1))
        {
            cnDor.TB_PORTAL_MENU_ORDEM.DeleteObject(menuordem);
        }
        cnDor.SaveChanges();
        HiddenField oHidem;
        int idPagina, idTipo, nuOrdem;
        TextBox oText;

        foreach (System.Web.UI.WebControls.GridViewRow iTem in gdv_especialidade.Rows)
        {
            oHidem = (HiddenField)iTem.FindControl("idPagina");
            idPagina = Convert.ToInt32(oHidem.Value);
            oHidem = (HiddenField)iTem.FindControl("idTipo");
            idTipo = Convert.ToInt32(oHidem.Value);
            oText = (TextBox)iTem.FindControl("txtOrdem");
            nuOrdem = Convert.ToInt32(oText.Text);
            cnDor.AddToTB_PORTAL_MENU_ORDEM(new db_rede_dorModel.TB_PORTAL_MENU_ORDEM() { id_pagina = idPagina, id_sessao = idSessao, id_tipo = idTipo, nu_ordem = nuOrdem, id_hospital = 1 });
        }
        cnDor.SaveChanges();
    }

    protected string Tipo(object a)
    {
        return Convert.ToInt32(a) == 1 ? "Dinâmica:&nbsp;" : "Fixa:&nbsp;";
    }
}