using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HBrasil.Models;
using HBrasil.Business;


public partial class TipoAtendimento : System.Web.UI.Page
{
    #region Variáveis/Constantes
    private List<TiposAtendimentos> lista = new List<TiposAtendimentos>();
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
                TipoAtendimentoBL tipoAtendimento = new TipoAtendimentoBL();

                if (hdnAcao.Value == "Editar")
                {
                    if (ddlTipo.SelectedIndex != 0)
                    {
                        RetornoBD = tipoAtendimento.AlterarTipoAtendimento(ddlTipo.Items[ddlTipo.SelectedIndex].Text, Convert.ToInt32(hdnCodTipoAtendimento.Value));
                        if (RetornoBD > 0)
                        {
                            CarregarTela();
                            ddlTipo.SelectedIndex = 0;
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
                    if (ddlTipo.SelectedIndex != 0)
                    {
                        RetornoBD = tipoAtendimento.SelecionarTipoAtendimento(ddlTipo.Items[ddlTipo.SelectedIndex].Text);
                            if (RetornoBD == 0)
                                {
                                    RetornoBD = tipoAtendimento.InserirTipoAtendimento(ddlTipo.Items[ddlTipo.SelectedIndex].Text);
                                    if (RetornoBD > 0)
                                    {
                                        CarregarTela();
                                        listar.Visible = true;
                                        Cadastrar.Visible = false;
                                    }   
                                }
                                else
                                {
                                    listar.Visible = true;
                                    Cadastrar.Visible = false;

                                }
                    }
                    else
                    {

                        Response.Write(@"<script>alert('Favor selecionar um Tipo de atendimento')</script>");
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");


            }
        }
            protected void lvCadTipoAtendimento_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            

                if (e.CommandName.Equals("Delete"))
                    Tipo = "Excluir";
                else if (e.CommandName.Equals("Editar"))
                {
                    hdnAcao.Value = "Editar";
                    Editar(e.Item.DisplayIndex);

                }
    
        }
            protected void lvCadTipoAtendimento_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    TiposAtendimentos tipoAtendimento = DataBinder.GetDataItem(e.Item) as TiposAtendimentos;
                    ListViewDataItem item = e.Item as ListViewDataItem;
                    this.CarregarValoCampo(item, "lblDescricao", tipoAtendimento.Descricao, null);
                    this.CarregarValoCampo(item, "lblCodigo", tipoAtendimento.CodTipo.ToString(), null);


                }
            }
            catch (Exception)
            {

                throw;
            }
        }
            protected void lvCadTipoAtendimento_ItemDeleting(object sender, ListViewDeleteEventArgs e)
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

            TipoAtendimentoBL tipoAtendimentoBL = new TipoAtendimentoBL();
            lista = tipoAtendimentoBL.ListarTipoAtendimento();


            if (lista.Count > 10)
                Paginar.Visible = true;
            else
                Paginar.Visible = false;

            CarregarGrid(lista);
        }
        private void CarregarGrid(List<TiposAtendimentos> lista)
        {
            lvCadTipoAtendimento.DataSource = lista;
            lvCadTipoAtendimento.DataBind();

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

                TiposAtendimentos tipoAtendimento = new TiposAtendimentos();
                TipoAtendimentoBL tipoAtendimentoBL = new TipoAtendimentoBL();
                tipoAtendimento.CodTipo = Convert.ToInt32(RecuperarValorCampo("lblCodigo", indice));
                tipoAtendimento.Descricao = RecuperarValorCampo("lblDescricao", indice);
                if (tipoAtendimentoBL.EliminarTipoAtendimento(tipoAtendimento.CodTipo) > 0)
                    CarregarTela();
                else
                    Response.Write(@"<script>alert('" + "Tipo de Atendimento eliminado com sucesso.".Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
            }
            catch (Exception ex)
            {

                Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
            }

        }
        private string RecuperarValorCampo(string nomeCampo, int indiceItem)
        {
            Control controle = this.lvCadTipoAtendimento.Items[indiceItem].FindControl(nomeCampo) as Control;
            if (controle == null)
                return string.Empty;

            return RecuperarValorCampo(nomeCampo, lvCadTipoAtendimento.Items[indiceItem]);

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
        private void Editar(int indice)
        {
            try
            {

                TiposAtendimentos tipo = new TiposAtendimentos();
                tipo.CodTipo = Convert.ToInt32(RecuperarValorCampo("lblCodigo", indice));
                tipo.Descricao = RecuperarValorCampo("lblDescricao", indice);
                ddlTipo.SelectedValue = tipo.CodTipo.ToString();
                hdnCodTipoAtendimento.Value = tipo.CodTipo.ToString();
                Inserir();

            }
            catch (Exception ex)
            {

                Response.Write(@"<script>alert('" + ex.Message.Replace("'", "").Replace("\r\n", "").Replace(")", "") + "')</script>");
            }

        }
   #endregion
       
}