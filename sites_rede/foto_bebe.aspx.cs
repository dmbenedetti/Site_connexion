using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

public partial class foto_bebe : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    private int idHosp = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        RangeValidator1.MinimumValue = DateTime.MinValue.ToString("yyyy-MM-dd");
        RangeValidator1.MaximumValue = DateTime.Now.AddYears(200).ToString("yyyy-MM-dd");
        idHosp = Convert.ToInt32(Session["idHosp"]);
        hpkBanner.Visible = false;
        var metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "default.aspx" select a).FirstOrDefault();
        if (metatags != null)
        {
            ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
        }
        metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "foto_bebe.aspx" select a).FirstOrDefault();
        if (metatags != null)
        {
            ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
        }



        var fotobebehosp = (from a in cnDor.TB_HOSPTIAL_FOTO_BEBE where a.id_hospital == idHosp select a).FirstOrDefault();
        if (!string.IsNullOrEmpty(fotobebehosp.ds_banner))
        {
            hpkBanner.NavigateUrl = fotobebehosp.ds_linkbanner;
            hpkBanner.ImageUrl = "http://www.rededor.com.br/images/foto_bebe/" + fotobebehosp.ds_banner;
            hpkBanner.Visible = true;
        }

    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        if (txtDataNascimento.Text == "" && txtNomeBebe.Text == "" && txtNomePais.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), Guid.NewGuid().ToString(), "alert('Precisamos que você preencha ao menos um dos campos para exibir o resultado da busca.');", true);
            return;
        }

        System.Data.SqlClient.SqlConnection oConn = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_rede_dorConnectionString"].ConnectionString);
        System.Data.SqlClient.SqlCommand oCmd = new System.Data.SqlClient.SqlCommand();
        oCmd.CommandType = System.Data.CommandType.StoredProcedure;
        oConn.Open();
        oCmd.Connection = oConn;
        oCmd.CommandText = "spFotoBebeBusca";
        oCmd.Parameters.Add("@dtNascimento", System.Data.SqlDbType.VarChar, 200);
        try
        {
            oCmd.Parameters["@dtNascimento"].Value = Convert.ToDateTime(txtDataNascimento.Text).ToString("yyyy-MM-dd");
        }
        catch
        {
            oCmd.Parameters["@dtNascimento"].Value = "";
        }
        oCmd.Parameters.Add("@NomePais", System.Data.SqlDbType.VarChar, 200);
        oCmd.Parameters["@NomePais"].Value = txtNomePais.Text;
        oCmd.Parameters.Add("@NomeBebe", System.Data.SqlDbType.VarChar, 200);
        oCmd.Parameters["@NomeBebe"].Value = txtNomeBebe.Text;
        oCmd.Parameters.Add("@idHosp", System.Data.SqlDbType.Int);
        oCmd.Parameters["@idHosp"].Value = Convert.ToInt32(Session["idHosp"]);
        DataTable oSet = new DataTable();
        oSet.Load(oCmd.ExecuteReader());
        ListView1.DataSource = oSet;
        ListView1.DataBind();
        oConn.Close();
        oCmd.Dispose();
        oConn.Dispose();

    }

    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //set current page startindex, max rows and rebind to false
        ItemDataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //rebind List View
        BindListView();
    }

    private void BindListView()
    {

        System.Data.SqlClient.SqlConnection oConn = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["db_rede_dorConnectionString"].ConnectionString);
        oConn.Open();
        System.Data.SqlClient.SqlCommand ocmd = new System.Data.SqlClient.SqlCommand("spFotoBebeBusca", oConn);
        ocmd.CommandType = CommandType.StoredProcedure;
        ocmd.Parameters.Add("@dtNascimento", SqlDbType.VarChar, 50);
        ocmd.Parameters["@dtNascimento"].Value = txtDataNascimento.Text;
        ocmd.Parameters.Add("@NomePais", SqlDbType.VarChar, 50);
        ocmd.Parameters["@NomePais"].Value = txtNomePais.Text;
        ocmd.Parameters.Add("@NomeBebe", SqlDbType.VarChar, 50);
        ocmd.Parameters["@NomeBebe"].Value = txtNomeBebe.Text;
        ocmd.Parameters.Add("@idHosp", SqlDbType.Int);
        ocmd.Parameters["@idHosp"].Value = idHosp;
        //DataSet1TableAdapters.tb_paginasTableAdapter lista_produtos = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb01 = new DataTable();
        tb01.Load(ocmd.ExecuteReader());


        ListView1.DataSource = tb01;
        ListView1.DataBind();
        oConn.Close();
        ocmd.Dispose();
        oConn.Dispose();
    }



}