<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="CadTipoAtendimento.aspx.cs" Inherits="TipoAtendimento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style type="text/css">
        .auto-style1 {
            width: 38px;
        }
        
         
        .Invisivel
        {
            visibility:hidden;    
        }
        
        .alt
        {
         background-color:#F7F6F3; 
           
        }
        
        .Normal
        {
         background-color: White;   
        }
        
        .tabela
        {
         border-style:inset;
         border:1;
         border-bottom-style:solid; 
         text-align:left;
         height:20px; 
          
        }
        .cabecalho
        {
         background-color:#5D7B9D;
         font-style:inherit;
         color:White;
         height:20px;
        }
        
        .altura
        {
           height:20px; 
        }
        
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div id="título" style="margin:15px 0px 0px 0px;">
   <h2>Gerenciar Atendimentos</h2>
   <p>&nbsp;</p>
   </div>
   <div id="listar" runat="server">
    <asp:Panel id="pnlConteudo" runat="server" DefaultButton="btnSalvar">
        <table class="tabela">
        <colgroup>
            <col width="55%" />
            <col width="15%" />
            <col width="30%" />
        </colgroup>
           <thead>
                          <tr>
                   <td align="right" colspan="2">
                         <asp:LinkButton ID="LinkAdicionar" runat="server" OnClick="LinkAdicionar_Click">Adicionar atendimento</asp:LinkButton>
                    </td>
                </tr>
               <tr class="cabecalho">
                   <td align="left">
                  <%-- Como é gravado na tela, não foi colocado dinâmico
                      <asp:ImageButton Id="imgAdicionar"  ImageAlign="AbsMiddle" ImageUrl="~/admin/images/Adicionar.ico" 
                       runat="server" ToolTip="Novo" OnClick="imgAdicionar_click" CommandName="Editar"/>--%>
                       Descrição
                   </td>
                   <td align="center">
                    Processos
                   </td>
                   <td class="Invisivel" >
                       CodTipoAtendimento
                   </td>
               </tr>
           </thead>
                        
           <asp:ListView ID="lvCadTipoAtendimento" runat="server"
                OnItemDataBound="lvCadTipoAtendimento_ItemDataBound"
                OnItemCommand="lvCadTipoAtendimento_ItemCommand"
                OnItemDeleting="lvCadTipoAtendimento_ItemDeleting">

              
                <EmptyDataTemplate>
                    <tfoot>
                        <tr class="altura" >
                            <td  align="center" colspan="2">
                                Nenhum registro encontrado
                            </td>
                        </tr>
                    </tfoot>
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <tbody>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </tbody>

                </LayoutTemplate>
                <ItemTemplate>
                       <tr class='<%# Container.DisplayIndex % 2 == 0  ? "Normal" : "alt" %>'>
                        <td align="left">
                        <asp:Label ID="lblDescricao" runat="server"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:ImageButton Id="imgEditar"  ImageAlign="AbsMiddle" ImageUrl="~/admin/images/bt_Editar.gif" 
                            runat="server" ToolTip="Editar" CommandName="Editar"/>
                            <asp:ImageButton ID="imgExcluir" runat="server"
                            ToolTip="Excluir" ImageUrl="~/admin/images/bt_excluir.gif" CommandName="Delete"
                            OnClientClick="javascript:return confirm('Confirma a exclusão do Tipo de Atendimento?');" />
                        </td>
                         <td align="left" class="Invisivel">
                            <asp:Label ID="lblCodigo" runat="server"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
 

               </asp:ListView>
        </table>
        <div id="Paginar" runat="server">
               <asp:DataPager ID="PagerlvCadCondominio" runat="server" PagedControlID="lvCadTipoAtendimento" 
                PageSize="10" OnPreRender="PagerlvCadCondominio_PreRender">
                <Fields>
                   <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="<<" 
                                LastPageText=">>" NextPageText="Proxima" PreviousPageText="Anterior" 
                                ShowFirstPageButton="True" ShowNextPageButton="False" 
                                ShowPreviousPageButton="False" />
                   <asp:NumericPagerField />
                   <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="<<" 
                                LastPageText=">>" NextPageText="Próxima" PreviousPageText="Anterior" 
                                ShowLastPageButton="True" ShowNextPageButton="False" 
                                ShowPreviousPageButton="False" />
                   </Fields>
                </asp:DataPager>

        </div>

   </asp:Panel>
   </div>
   <div id="Cadastrar" runat="server" visible="false">
       <table>
            <tr>
                <td valign="middle">
                    <asp:Label ID="lblDescricao" Text="Descrição" runat="server"/>
                </td>
                <td>
                    <asp:DropDownList ID="ddlTipo" CssClass="txt" Width="320px" runat="server">
                        <asp:ListItem Value="0" Text="Selecione um tipo de atendimento" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Ambulatório"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Exames"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Hospital"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Pronto-Socorro"></asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
            </tr>
                <tr>
                <td colspan="2" align="right">
                    <asp:Button ID="btnSalvar" Text="Salvar" runat="server" CssClass="txt" 
                        Visible="true" onclick="btnSalvar_Click"/>
                </td>
            </tr>
            <tr>
                    <asp:HiddenField ID="hdnAcao" Value=" " runat="server" />
                    <asp:HiddenField ID="hdnCodTipoAtendimento" Value="0" runat="server" />
            </tr>
       </table>
   </div>
</asp:Content>

