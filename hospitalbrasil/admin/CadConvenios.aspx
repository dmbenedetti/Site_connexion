<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="CadConvenios.aspx.cs" Inherits="admin_CadConvenios" %>

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
   <h2>Gerenciar Convênios</h2>
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
                         <asp:LinkButton ID="LinkAdicionar" runat="server" OnClick="LinkAdicionar_Click">Adicionar Convênio</asp:LinkButton>
                  </td>
               </tr>
               <tr class="cabecalho">
                   <td align="left">
                       Descrição
                   </td>
                   <td align="center">
                    Processos
                   </td>
                   <td class="Invisivel" >
                       CodConvenio
                   </td>
               </tr>
           </thead>
                        
           <asp:ListView ID="lvCadConvenio" runat="server"
                OnItemDataBound="lvCadConvenio_ItemDataBound"
                OnItemCommand="lvCadConvenio_ItemCommand"
                OnItemDeleting="lvCadConvenio_ItemDeleting">

              
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
                    <asp:Label ID="lblSpot" runat="server" Visible="false"></asp:Label>
                       <tr class='<%# Container.DisplayIndex % 2 == 0  ? "Normal" : "alt" %>'>
                        <td align="left">
                        <asp:Label ID="lblDescricao" runat="server"></asp:Label>
                        </td>
                        <td align="center">
                            <asp:ImageButton Id="imgEditar"  ImageAlign="AbsMiddle" ImageUrl="~/admin/images/bt_Editar.gif" 
                            runat="server" ToolTip="Editar" CommandName="Editar"/>
                            <asp:ImageButton ID="imgExcluir" runat="server"
                            ToolTip="Excluir" ImageUrl="~/admin/images/bt_excluir.gif" CommandName="Delete"
                            OnClientClick="javascript:return confirm('Confirma a exclusão do convênio?');" />
                        </td>
                         <td align="left" class="Invisivel">
                            <asp:Label ID="lblCodigo" runat="server"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
 

               </asp:ListView>
        </table>
        <div id="Paginar" runat="server">
               <asp:DataPager ID="PagerlvCadCondominio" runat="server" PagedControlID="lvCadConvenio" 
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
                    <asp:TextBox ID="txtDescricao" runat="server" MaxLength="30" CssClass="txt altura" 
                        Width="321px" />
                </td>
            </tr>
             <tr>
                <td valign="middle">
                    <asp:Label ID="lblSpot" Text="Spot" runat="server"/>
                </td>
                <td>
                    <asp:TextBox ID="txtSpot" runat="server" MaxLength="2000" TextMode="MultiLine" Rows="5" Style="height: 80px;" Columns="100" CssClass="txt altura" 
                        Width="321px" />
                </td>
            </tr>       </table>
       <table>
                <tr>
                <td align="right" style= "padding-left:320px;">
                    <asp:Button ID="btnSalvar" Text="Salvar" runat="server" CssClass="txt" 
                        Visible="true" onclick="btnSalvar_Click" Height="24px" Width="59px"/>
                </td>
            </tr>
            <tr>
                <asp:HiddenField ID="hdnAcao" Value=" " runat="server" />
                <asp:HiddenField ID="hdnCodConvenio" Value="0" runat="server" />
            </tr>
       </table>
   </div>
</asp:Content>

