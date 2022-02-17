using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            btnFiltro_Click(null, null);
        }//fim do if postback

    }


    protected void btnFiltro_Click(object sender, ImageClickEventArgs e)
    {
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        DataTable oTable = new DataTable();
        oTable.Columns.Add("pagina");
        oTable.Columns.Add("id_metatag");
        oTable.Columns.Add("id_conteudo");
        oTable.Columns.Add("ds_pagina");
        DataRow oRow;
        if ((drpSessao.SelectedValue == "" || drpSessao.SelectedValue == "0"))
        {
            oRow = oTable.NewRow();
            oRow["pagina"] = "Home";
            oRow["id_metatag"] = 0;
            oRow["id_conteudo"] = 0;
            oRow["ds_pagina"] = "default.aspx";
            oTable.Rows.Add(oRow);
            oRow = oTable.NewRow();
            oRow["pagina"] = "Foto Bebê";
            oRow["id_metatag"] = 0;
            oRow["id_conteudo"] = 0;
            oRow["ds_pagina"] = "foto_bebe.aspx";
            oTable.Rows.Add(oRow);
            foreach (var pagina in (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.id_hospital == idHosp select a))
            {

                oRow = oTable.NewRow();
                oRow["pagina"] = pagina.ds_titulo;
                oRow["id_metatag"] = 0;
                oRow["id_conteudo"] = 0;
                oRow["ds_pagina"] = pagina.ds_link;
                oTable.Rows.Add(oRow);
            }
        }
        else
        {
            int idSessao = Convert.ToInt32(drpSessao.SelectedValue);
            foreach (var pagina in (from a in cnDor.TB_PORTAL_CONTEUDO where a.id_hospital == idHosp && a.id_sessao == idSessao select a))
            {
                oRow = oTable.NewRow();
                oRow["pagina"] = pagina.nm_titulo;
                oRow["id_metatag"] = 0;
                oRow["id_conteudo"] = pagina.id_conteudo;
                oRow["ds_pagina"] = "";
                oTable.Rows.Add(oRow);
            }
        }
        ListView1.DataSource = oTable;
        ListView1.DataBind();
    }
}