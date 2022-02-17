<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="CadPlanos.aspx.cs" Inherits="admin_CadPlanos" %>

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
        
        .style3
        {
            width: 129px;
        }
        .style4
        {
            width: 313px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="título" style="margin:15px 0px 0px 0px;">
        <h2>Gerenciar Planos</h2>
   <p>&nbsp;</p>
   </div>
    <div id="dvFiltro" runat="server">Convenio: <asp:DropDownList runat="server" AutoPostBack="true" ID="drpPlano" CssClass="txt altura" OnSelectedIndexChanged="drpPlano_SelectedIndexChanged"></asp:DropDownList> </div>

   <div id="listar" runat="server">
    <asp:Panel id="pnlConteudo" runat="server" DefaultButton="btnSalvar">
        <table class="tabela" id="tabela">
        <colgroup>
            <col width="10%" />
            <col width="15%" />
            <col width="10%" />
            <col width="10%" />
            <col width="10%" />
            <col width="10%" />
            <col width="20%" />
            <col width="10%" />
            <col width="10%" />
        </colgroup>
           <thead>
               <tr>
                   <td align="right" colspan="8">
                         <asp:LinkButton ID="LinkAdicionar" runat="server" OnClick="LinkAdicionar_Click">
                           <div align="center">Adicionar Plano
                           </div>
                         </asp:LinkButton>
                    </td>
                </tr>
               <tr class="cabecalho">
                   <td align="left">
                       Plano
                   </td>
                   <td align="left">
                    Convênio
                   </td>
 
                   <td align="center">
                    &nbsp;Ambulatório&nbsp;
                   </td>
                   <td align="center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Exames&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   </td>
                   <td align="center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hospital&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   </td>
                   <!--<td align="center" id="ColMat" runat="server" >
                    &nbsp;Maternidade&nbsp;
                   </td>-->
                   <td align="center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   </td>
                   <td align="center">
                    &nbsp;Editar&nbsp;
                   </td>
                   <td class="Invisivel" >
                       CodPlano
                   </td>
                   <td class="Invisivel" >
                       CodConvenio
                   </td>
                   <td class="Invisivel" >
                       CodTipo
                   </td>
               </tr>
           </thead>
                        
           <asp:ListView ID="lvCadPlano" runat="server"
                OnItemDataBound="lvCadPlano_ItemDataBound"
                OnItemCommand="lvCadPlano_ItemCommand"
                OnItemDeleting="lvCadPlano_ItemDeleting">
                <EmptyDataTemplate>
                    <tfoot>
                        <tr class="altura" >
                            <td colspan="8" align="center">
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
                        <asp:Label ID="lblDescPlano" runat="server"></asp:Label>
                        </td>
                        <td align="left">
                        <asp:Label ID="lblDescConvenio" runat="server"></asp:Label>
                        </td>
                        <td align="center">
                        <asp:Label ID="lblAmbulatorio" runat="server"></asp:Label>
                        </td>
                        <td align="center">
                        <asp:Label ID="lblExames" runat="server"></asp:Label>
                        </td>
                        <td align="center">
                        <asp:Label ID="lblHospital" runat="server"></asp:Label>
                        </td>
                        </td>
                       <!-- <td align="center" id="ColConteudoMat" runat="server">
                        <asp:Label ID="lblMaternidade" runat="server"></asp:Label>
                        </td>-->
                        <td align="center"  >
                        <asp:Label ID="lblPS" runat="server"></asp:Label>
                        </td>

                        <td align="center">
                            <asp:ImageButton Id="imgEditar"  ImageAlign="AbsMiddle" ImageUrl="~/admin/images/bt_Editar.gif" 
                            runat="server" ToolTip="Editar" CommandName="Editar"/>
                            <asp:ImageButton ID="imgExcluir" runat="server"
                            ToolTip="Excluir" ImageUrl="~/admin/images/bt_excluir.gif" CommandName="Delete"
                            OnClientClick="javascript:return confirm('Confirma a exclusão do plano?');" />
                        </td>
                         <td align="left" class="Invisivel">
                            <asp:Label ID="lblCodPlano" runat="server"></asp:Label>
                        </td>
                        <td align="left" class="Invisivel">
                            <asp:Label ID="lblCodConvenio" runat="server"></asp:Label>
                        </td>
                        <td align="left" class="Invisivel">
                            <asp:Label ID="lblCodTipo" runat="server"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
 

               </asp:ListView>
        </table>
        <div id="Paginar" runat="server">
               <asp:DataPager ID="PagerlvCadCondominio" runat="server" PagedControlID="lvCadPlano" 
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
                <td valign="middle" style="width:130px">
                    <strong>Plano</strong>
                </td>

                <td>
                    <asp:TextBox ID="txtDescricao" runat="server" MaxLength="60" CssClass="txt altura" 
                        Width="620px" />
                </td>
            </tr>
            <tr>
                <td valign="middle" style="width:130px">
                <strong>Convênio</strong>
                </td>
                <td>
                    <asp:DropDownList ID="ddlConvenio" CssClass="txt" Width="620px" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
            <table>
            <tr>
                
                <td valign="middle" align="center" class="style3">
                    <strong>Tipo de Atendimento:</strong>
                </td>
                <td class="style4"></td>
                <td></td>
            </tr>
            <tr>
              <td class="style3">
              </td>
              <td class="style4"> 
                <asp:CheckBoxList id="ChkItens" runat="server" Font-Bold="True" Width="177px" 
                      ToolTip="Status &quot;Atender&quot; clique na caixa e status &quot;Não Atender&quot; deixe em branco"></asp:CheckBoxList>
              </td>
       </table>
       <table>
                <tr>
                    <td align="right" style= "padding-left:390px;">
                        <asp:Button ID="btnSalvar" Text="Salvar" runat="server" CssClass="txt" 
                        Visible="true" onclick="btnSalvar_Click" Height="24px" Width="59px"/>
                    </td>
                </tr>
                <tr>
                    <asp:HiddenField ID="hdnAcao" Value=" " runat="server" />
                    <asp:HiddenField ID="hdnCodPlano" Value="0" runat="server" />
                </tr>
       </table>
   </div>
</asp:Content>

