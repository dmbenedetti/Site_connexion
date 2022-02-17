using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HAssuncao.Models;
using HAssuncao.Business;



public partial class admin_CadConvenios : System.Web.UI.Page
{
    #region Variáveis/Constantes
        private List<Convenios> lista = new List<Convenios>();
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

            if (hdnAcao.Value == "Editar")
            {

                RetornoBD = ConvenioBL.AlterarConvenio(Convert.ToInt32(hdnCodConvenio.Value), txtDescricao.Text, txtSpot.Text);
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
                RetornoBD = ConvenioBL.InserirConvenio(txtDescricao.Text, txtSpot.Text);
                if (RetornoBD > 0)
                {
                    CarregarTela();
                    txtDescricao.Text = string.Empty;
                    listar.Visible = true;
                    Cadastrar.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {

            Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");


        }
    }
    protected void lvCadConvenio_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
            if (e.CommandName.Equals("Delete"))
                Tipo = "Excluir";
            else if (e.CommandName.Equals("Editar"))
            {
                hdnAcao.Value = "Editar";
                string i= e.Item.DisplayIndex.ToString();
                Editar(e.Item.DisplayIndex);
            }


    }
    protected void lvCadConvenio_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Convenios convenio = DataBinder.GetDataItem(e.Item) as Convenios;
                ListViewDataItem item = e.Item as ListViewDataItem;
                this.CarregarValoCampo(item, "lblDescricao", convenio.Descricao, null);
                this.CarregarValoCampo(item, "lblCodigo",convenio.CodConvenio.ToString(), null);
                this.CarregarValoCampo(item, "lblSpot", convenio.Spot.ToString(), null);

            
            }
        }
        catch (Exception)
        {
            
            throw;
        }
    }
    protected void lvCadConvenio_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        if (Tipo == "Excluir")
            Eliminar(e.ItemIndex);

    }
    protected void LinkAdicionar_Click(object sender, EventArgs e)
    {
        hdnAcao.Value = "Inserir";
        Inserir();
    }
    #endregion

    #region Métodos

        private void CarregarTela()
        {

            lista = ConvenioBL.ListarConvenio();
       

            if (lista.Count > 10)
                Paginar.Visible = true;
            else
                Paginar.Visible = false;

            CarregarGrid(lista);   
        }
        private void CarregarGrid(List<Convenios> lista)
        {
            lvCadConvenio.DataSource=lista;
            lvCadConvenio.DataBind();
   
        }
        protected void PagerlvCadCondominio_PreRender(object sender, EventArgs e)
        {
            CarregarTela();
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

            Convenios convenio = new Convenios();
            convenio.CodConvenio =Convert.ToInt32(RecuperarValorCampo("lblCodigo", indice));
            convenio.Descricao = RecuperarValorCampo("lblDescricao", indice);
            if (ConvenioBL.EliminarConvenio(convenio.CodConvenio) > 0)
                CarregarTela();
            else
                Response.Write(@"<script>alert('" + "Convênio eliminado com sucesso.".Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
            }
            catch (Exception ex)
            {

                Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
            }

        }
        private string RecuperarValorCampo(string nomeCampo, int indiceItem)
        {
            Control controle = this.lvCadConvenio.Items[indiceItem].FindControl(nomeCampo) as Control;
            if (controle == null)
                return string.Empty;

            return RecuperarValorCampo(nomeCampo, lvCadConvenio.Items[indiceItem]);

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
                textbox.Text=valor;
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
        private void Editar(int indice)
        {
            try
            {

                Convenios Convenio = new Convenios();
                Convenio.CodConvenio = Convert.ToInt32(RecuperarValorCampo("lblCodigo", indice));
                Convenio.Descricao = RecuperarValorCampo("lblDescricao", indice);
                Convenio.Spot = RecuperarValorCampo("lblSpot", indice);
                hdnCodConvenio.Value = Convenio.CodConvenio.ToString();

                txtDescricao.Text = Convenio.Descricao;
                txtSpot.Text = Convenio.Spot;
                //Habilita tela
                Inserir();
            }
            catch (Exception ex)
            {

                Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
            }

        }
    #endregion


}