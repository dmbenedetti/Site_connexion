<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="resultados.aspx.cs" Inherits="quem_somos" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.not a
{
    text-decoration:none;
color:#436DA2;
    }
    .result
    {
        border-bottom:solid 1px #ccc;
        
        }
        .result a
        {
            font:14px "Frutiger LT 57 Cn", Arial, Helvetica, sans-serif;
text-decoration:none;
color:#436DA2;
}
.result a:hover
        {
            text-decoration:underline;
            }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="titulo_pag">
            	<h2>Resultados da Busca</h2>
            </div>
            <br />
    
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <div>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            GroupItemCount="1">
                    <EmptyItemTemplate>
                        <td id="Td1" runat="server" />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <td valign=top>
                            <div class="result">
                            <a href="internas.aspx?id=<%# Eval("id") %>"><strong><%# Eval("titulo") %></strong></a>
                            <div><%# Eval("conteudo") %><a href="internas.aspx?id=<%# Eval("id") %>">Leia mais</a></div>
                            <br />
                                    
                            
                                
                                
                                
                            </div>
                           
                            </td>
                            
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" style="">
                                <tr>
                                    <td>
                                        Nenhum dado encontrado.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div runat="server" ID="groupPlaceholderContainer">
                                <div ID="groupPlaceholder" runat="server">
                                <table>
                                <tr>
                                
                                </tr>
                                </table>
                                </div>
                            </div>
                                       
                                    
                        </LayoutTemplate>
                        <GroupTemplate>
                            
                            <table ID="itemPlaceholderContainer" runat="server">
			                    <tr ID="itemPlaceholder" runat="server">
			                    </tr>
			                </table>
                            
                        </GroupTemplate>
                        
                </asp:ListView>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" 
                        PageSize="16" runat=server>
                        <Fields>
                            <asp:NumericPagerField ButtonCount="2" NextPageText=" &gt;&gt;" 
                                PreviousPageText="&lt;&lt; " />
                        </Fields>
                    </asp:DataPager>
                    <br />
        <br />
        <br />
    </asp:Content>

