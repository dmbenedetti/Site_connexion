using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HBrasil.Models;
using HBrasil.Business;

public partial class admin_CadPlanos : System.Web.UI.Page
{

    #region Variáveis/Constantes
    private List<Planos> lista = new List<Planos>();
    PlanoBL planoBL = new PlanoBL();
    string Tipo;
    #endregion

    #region Propriedades


    #endregion

    #region Eventos
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CarregarTela();
        }
    }

 
    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        try
        {

                int RetornoBD;
                PlanoBL planoBL = new PlanoBL();

                int optAmb=0;
                int optHosp=0;
                int optMat = 0;
                int optExames = 0;
                int optPS=0;
                int CodTipoAmb=0;
                int CodTipoHosp=0;
                int CodTipoMat = 0;
                int CodTipoExames = 0;
                int CodTipoPS=0;

                for (int i = 0; i < ChkItens.Items.Count; i++)
                {

                    if (ChkItens.Items[i].Selected)
                    {
                        if (ChkItens.Items[i].Text == "Ambulatório")
                        {
                            optAmb = 1;
                            CodTipoAmb =Convert.ToInt32(ChkItens.Items[i].Value);
                        }

                        if (ChkItens.Items[i].Text == "Exames")
                        {
                            optExames = 1;
                            CodTipoExames = Convert.ToInt32(ChkItens.Items[i].Value);
                        }

                        else if (ChkItens.Items[i].Text == "Hospital")
                        {
                            optHosp = 1;
                            CodTipoHosp = Convert.ToInt32(ChkItens.Items[i].Value);
                        }

                        else if (ChkItens.Items[i].Text == "Maternidade")
                        {
                            optMat = 1;
                            CodTipoMat = Convert.ToInt32(ChkItens.Items[i].Value);
                        }

                        else if (ChkItens.Items[i].Text == "Pronto-Socorro")
                        {
                            optPS = 1;
                            CodTipoPS = Convert.ToInt32(ChkItens.Items[i].Value);
                        }
                    }
                    else
                    {
                        if (ChkItens.Items[i].Text == "Ambulatório")
                        {
                            optAmb = 0;
                            CodTipoAmb = Convert.ToInt32(ChkItens.Items[i].Value);
                        }
                        if (ChkItens.Items[i].Text == "Exames")
                        {
                            optExames = 0;
                            CodTipoExames = Convert.ToInt32(ChkItens.Items[i].Value);
                        }
                        else if (ChkItens.Items[i].Text == "Hospital")
                        {
                            optHosp = 0;
                            CodTipoHosp = Convert.ToInt32(ChkItens.Items[i].Value);
                        }
                        else if (ChkItens.Items[i].Text == "Maternidade")
                        {
                            optMat = 0;
                            CodTipoMat = Convert.ToInt32(ChkItens.Items[i].Value);
                        }
                        else if (ChkItens.Items[i].Text == "Pronto-Socorro")
                        {
                            optPS = 0;
                            CodTipoPS = Convert.ToInt32(ChkItens.Items[i].Value);
                        }
                    }

                }

                if (hdnAcao.Value == "Editar")
                {
                    if (ddlConvenio.SelectedValue != ("Selecione um convênio"))
                    {
                        RetornoBD = planoBL.AlterarPlano(Convert.ToInt32(hdnCodPlano.Value),optAmb,optExames, optHosp,optMat, optPS, Convert.ToInt32(ddlConvenio.SelectedValue), CodTipoAmb,CodTipoExames, CodTipoHosp,CodTipoMat, CodTipoPS, txtDescricao.Text);
                        if (RetornoBD > 0)
                        {
                            CarregarTela();
                            txtDescricao.Text = string.Empty;
                            listar.Visible = true;
                            Cadastrar.Visible = false;
                        }
                    }
                    else
                    {

                        Response.Write(@"<script>alert('Favor selecionar um convênio')</script>");
                    }
                }
                else
                {
                if (ddlConvenio.SelectedValue != ("Selecione um convênio"))
                {
                    RetornoBD = planoBL.InserirPlano(optAmb,optExames, optHosp, optMat, optPS, Convert.ToInt32(ddlConvenio.SelectedValue), CodTipoAmb, CodTipoExames,CodTipoHosp, CodTipoMat, CodTipoPS, txtDescricao.Text);
                    if (RetornoBD > 0)
                    {
                        CarregarTela();
                        txtDescricao.Text = string.Empty;
                        listar.Visible = true;
                        Cadastrar.Visible = false;
                    }
                }
                else
                {
                   
                    Response.Write(@"<script>alert('Favor selecionar um convênio')</script>");
                }
            }
                dvFiltro.Visible = true;
        }
        catch (Exception ex)
        {

            Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");


        }
    }
    protected void lvCadPlano_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
            if (e.CommandName.Equals("Delete"))
                Tipo = "Excluir";
            else if (e.CommandName.Equals("Editar"))
            {
                hdnAcao.Value= "Editar";
                Editar(e.Item.DisplayIndex);

            }

    }
    protected void lvCadPlano_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Planos plano = DataBinder.GetDataItem(e.Item) as Planos;
                ListViewDataItem item = e.Item as ListViewDataItem;
                string descAmbulatorio = string.Empty;
                string descExames = string.Empty;
                string descHospital = string.Empty;
                string descMaternidade = string.Empty;
                string descPS = string.Empty;
                
                if (plano.Ambulatorio == 0)
                    descAmbulatorio = "Não Atende";
                else
                    descAmbulatorio = "Atende";

                if (plano.Exames == 0)
                    descExames = "Não Atende";
                else
                    descExames = "Atende";


                if (plano.Hospital == 0)
                    descHospital = "Não Atende";
                else
                    descHospital = "Atende";


                if (plano.Maternidade == 0)
                    descMaternidade = "Não Atende";
                else
                    descMaternidade = "Atende";

                if (plano.PS == 0)
                    descPS = "Não Atende";
                else
                    descPS = "Atende";


                this.CarregarValoCampo(item, "lblDescPlano", plano.DescPlano, null);
                this.CarregarValoCampo(item, "lblDescConvenio", plano.Descricao, null);
                this.CarregarValoCampo(item, "lblAmbulatorio", descAmbulatorio, null);
                this.CarregarValoCampo(item, "lblExames", descExames, null);
                this.CarregarValoCampo(item, "lblHospital", descHospital, null);
                this.CarregarValoCampo(item, "lblMaternidade", descMaternidade, null);
                this.CarregarValoCampo(item, "lblPS", descPS, null);
                this.CarregarValoCampo(item, "lblCodPlano", plano.CodPlano.ToString(), null);
                this.CarregarValoCampo(item, "lblCodConvenio", plano.CodConvenio.ToString(), null);
                this.CarregarValoCampo(item, "lblCodTipo", plano.CodTipo.ToString(), null);

                

                
                
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void lvCadPlano_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        if (Tipo == "Excluir")
            Eliminar(e.ItemIndex);
    }
    protected void LinkAdicionar_Click(object sender, EventArgs e)
    {
        dvFiltro.Visible = false;
        hdnAcao.Value = "Inserir";
        Inserir();
    }
    protected void PagerlvCadCondominio_PreRender(object sender, EventArgs e)
    {
        CarregarTela();
    }
    #endregion

    #region Métodos
    private void CarregarTela()
    {
        

        CarregarCombos();

        int idConvenio = 0;
        int.TryParse(drpPlano.SelectedValue, out idConvenio);
        if (idConvenio == 0)
            idConvenio = -1;
        lista = planoBL.TrocaLinhaColunaFrontEnd(idConvenio);

        List<TiposAtendimentos> listaTipo= CarregaTipoAtendimento();


        if (lista.Count > 10)
            Paginar.Visible = true;
        else
            Paginar.Visible = false;

        CarregarGrid(lista);
    }
    private List<TiposAtendimentos> CarregaTipoAtendimento()
    {
        List<TiposAtendimentos> ListaTipos = new List<TiposAtendimentos>();

        ListaTipos = planoBL.CarregarTipoAtendimento();

        ChkItens.Items.Clear();

        foreach (var item in ListaTipos)
        {
            ChkItens.Items.Add(new ListItem(item.Descricao,item.CodTipo.ToString()));
        }

        return ListaTipos;

    }
    private void CarregarCombos()
    {
           //Convênio
           List<Convenios> lista=new List<Convenios>();
           PlanoBL planoBL = new PlanoBL();
           lista = planoBL.CarregarConvenio();
           ddlConvenio.DataSource = lista;
           ddlConvenio.DataTextField = "Descricao";
           ddlConvenio.DataValueField = "codConvenio";
           ddlConvenio.DataBind();
           ddlConvenio.Items.Insert(0, "Selecione um convênio");
           ddlConvenio.SelectedIndex = 0;
           if (!Page.IsPostBack)
           {
               drpPlano.DataSource = lista;
               drpPlano.DataTextField = "Descricao";
               drpPlano.DataValueField = "CodConvenio";
               drpPlano.DataBind();
               drpPlano.Items.Insert(0, new ListItem() { Value = "-1", Text="Todos", Selected=true });
               //drpPlano.SelectedIndex = -1;
           }
    }
    private void CarregarGrid(List<Planos> lista)
    {
        lvCadPlano.DataSource = lista;
        lvCadPlano.DataBind();

    }
    private void Inserir()
    {
        listar.Visible = false;
        Cadastrar.Visible = true;

    }
    private void Eliminar(int indice)
    {
        try
        {

            Planos plano=new Planos();
            plano.CodPlano = Convert.ToInt32(RecuperarValorCampo("lblCodPlano", indice));
            plano.CodTipo = Convert.ToInt32(RecuperarValorCampo("lblCodTipo", indice));
            plano.CodConvenio= Convert.ToInt32(RecuperarValorCampo("lblCodConvenio", indice));
            PlanoBL planoBL =new PlanoBL();
            if (planoBL.EliminarPlano(plano.CodTipo, plano.CodConvenio, plano.CodPlano) > 0)
                 CarregarTela();

        }
        catch (Exception ex)
        {

            Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
        }

    }
    private void Editar(int indice)
    {
        try
        {
            dvFiltro.Visible = false;
            Planos plano = new Planos();
            plano.CodPlano = Convert.ToInt32(RecuperarValorCampo("lblCodPlano", indice));
            plano.DescPlano = RecuperarValorCampo("lblDescPlano", indice);
            plano.CodConvenio = Convert.ToInt32(RecuperarValorCampo("lblCodConvenio", indice));
            plano.Descricao = RecuperarValorCampo("lblDescConvenio", indice);
            plano.DescAmbulatorio = RecuperarValorCampo("lblAmbulatorio", indice);
            plano.DescExames = RecuperarValorCampo("lblExames", indice);
            plano.DescHospital = RecuperarValorCampo("lblHospital", indice);
            plano.DescMaternidade = RecuperarValorCampo("lblMaternidade", indice);
            plano.DescPS = RecuperarValorCampo("lblPS", indice);
            hdnCodPlano.Value = plano.CodPlano.ToString();
            txtDescricao.Text = plano.DescPlano;
            CarregarCombos();
            ddlConvenio.SelectedValue = plano.CodConvenio.ToString();

            List<TiposAtendimentos> listaTipo = CarregaTipoAtendimento();

            for (int i = 0; i < ChkItens.Items.Count; i++)
			{
                if ((ChkItens.Items[i].Text == "Ambulatório") && (plano.DescAmbulatorio == "Atende"))
                    ChkItens.Items[i].Selected = true;
                else if ((ChkItens.Items[i].Text == "Ambulatório") && (plano.DescAmbulatorio == "Não Atende"))
                    ChkItens.Items[i].Selected = false;
                else if ((ChkItens.Items[i].Text == "Exames") && (plano.DescExames == "Atende"))
                    ChkItens.Items[i].Selected = true;
                else if ((ChkItens.Items[i].Text == "Exames") && (plano.DescExames == "Não Atende"))
                    ChkItens.Items[i].Selected = false;
                else if  ((ChkItens.Items[i].Text == "Hospital") && (plano.DescHospital=="Atende"))
                    ChkItens.Items[i].Selected = true;
                else if ((ChkItens.Items[i].Text == "Hospital") && (plano.DescHospital == "Não Atende"))
                    ChkItens.Items[i].Selected = false;
                else if ((ChkItens.Items[i].Text == "Maternidade") && (plano.DescMaternidade == "Não Atende"))
                    ChkItens.Items[i].Selected = false;
                else if ((ChkItens.Items[i].Text == "Maternidade") && (plano.DescMaternidade == "Atende"))
                    ChkItens.Items[i].Selected = true;
                else if ((ChkItens.Items[i].Text == "Pronto-Socorro") && (plano.DescPS == "Atende"))
                    ChkItens.Items[i].Selected = true;
                else if ((ChkItens.Items[i].Text == "Pronto-Socorro") && (plano.DescPS == "Não Atende"))
                    ChkItens.Items[i].Selected = false;
			}

            //Habilita tela
            Inserir();
        }
        catch (Exception ex)
        {

            Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
        }

    }
    private string RecuperarValorCampo(string nomeCampo, int indiceItem)
    {
        Control controle = this.lvCadPlano.Items[indiceItem].FindControl(nomeCampo) as Control;
        if (controle == null)
            return string.Empty;

        return RecuperarValorCampo(nomeCampo, lvCadPlano.Items[indiceItem]);

    }
    private string RecuperarValorCampo(string nomecampo, ListViewItem item)
    {
        Control controle = item.FindControl(nomecampo) as Control;

        if (controle == null)
            return string.Empty;

        string retorno = string.Empty;
        if (controle is Label)
        {
            Control control = controle;
            retorno = (control as Label).Text;
        }

        if (controle is DropDownList)
        {
            Control control = controle;
            retorno = (control as DropDownList).SelectedValue;
        }

        if (controle is HiddenField)
        {
            Control control = controle;
            retorno = (control as HiddenField).Value;
        }

        return retorno;



    }
    private void CarregarValoCampo(ListViewDataItem linha, string nomecampo, string valor, bool? editavel)
    {
        Control controle = linha.FindControl(nomecampo) as Control;
        if (controle is Label)
        {
            Label label = controle as Label;
            label.Text = valor;
        }
        else if (controle is HiddenField)
        {
            HiddenField hiddenField = controle as HiddenField;
            hiddenField.Value = valor;
        }
        else if (controle is TextBox)
        {
            TextBox textbox = controle as TextBox;
            textbox.Text = valor;
            textbox.Enabled = editavel.Value;
        }
        else if (controle is DropDownList)
        {
            DropDownList combo = controle as DropDownList;
            if (combo != null)
            {
                combo.SelectedIndex = -1;
                if (combo.Items.FindByValue(valor) != null)
                {
                    combo.Items.FindByValue(valor).Selected = true;
                }
                combo.Enabled = editavel.Value;
            }
        }

    }

    #endregion


    protected void drpPlano_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            CarregarTela();
        }
    }
}

