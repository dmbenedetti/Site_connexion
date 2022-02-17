using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HBrasil.Models;
using HBrasil.Business;
using System.Data;
using AjaxControlToolkit;
using System.Data.SqlClient;
using HBrasil.Util;



public partial class Teste : System.Web.UI.Page
{

    #region Variáveis/Constantes
         private List<Planos> lista = new List<Planos>();
    #endregion

    #region Eventos
     protected void Page_Load(object sender, EventArgs e)
    {
        
         if (!IsPostBack)
        {
            CarregarTela();
        }
    }
  
     protected void Accordion1_ItemDataBound(object sender, AjaxControlToolkit.AccordionItemEventArgs e)
    {

        if (e.ItemType == AjaxControlToolkit.AccordionItemType.Content)
        {

            ////Convênio
            List<Planos> lista = new List<Planos>();
            PlanoBL planoBL = new PlanoBL();
            lista = planoBL.CarregaPlanos(((HiddenField)e.AccordionItem.FindControl("txt_CODCONVENIO")).Value.ToString());


            DataTable dtConvert = Convertions.ToDataTable<Planos>(lista);

            DataSet myDataset = new DataSet();
            myDataset.Tables.Add(dtConvert);



            GridView grd = new GridView();

            grd = (GridView)e.AccordionItem.FindControl("GridView1");
            grd.DataSource = myDataset;
            grd.DataBind();
        }


    }
    #endregion

    #region Métodos
     private void CarregarTela()
    {
        ////Convênio
        List<Planos> lista = new List<Planos>();
        PlanoBL planoBL = new PlanoBL();
        lista = planoBL.CarregaPlanos(string.Empty);
        DataTable dtConvert = Convertions.ToDataTable<Planos>(lista);
        DataSet myDataset = new DataSet();
        myDataset.Tables.Add(dtConvert);
        Accordion1.DataSource = myDataset.Tables[0].DefaultView;
        Accordion1.DataBind();
    }

    #endregion



    

}