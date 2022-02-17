<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DNA.aspx.cs" Inherits="quem_somos" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.list_revista
{
    width:100px;
    height:230px;
    text-align:center;
    padding:6px 25px;
    
    }
    .list_revista img
    {
        border: solid 2px #999;
        }
    .list_revista a
    {
        font:Tahoma, Arial, Helvetica, sans-serif;
        color:#999999;
        text-decoration:none;
        
        }
        .list_revista a:hover
        {
            text-decoration:underline;
         }
#ctl00_ContentPlaceHolder1_DataPager1 input
{
    font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
    color:#fff;
    background: #57abcd;
    padding:6px 10px;
    }
    #ctl00_ContentPlaceHolder1_DataPager1 span
    {
        width:15px;
        padding:6px 5px;
        color:#57abcd;
        font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
        margin:0 3px;
        }
        #ctl00_ContentPlaceHolder1_DataPager1 a
        {
        width:15px;
        padding:5px 5px;
        color:#fff;
        text-decoration:none;
        background:#57abcd;
        margin:0 3px;
        font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
        border:solid 1px #57abcd;
        }
        #ctl00_ContentPlaceHolder1_DataPager1 a:hover
        {
        
        color:#57abcd;
        background:#fff;
        border:solid 1px #57abcd;
        
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <br />
    <br /><br />
    <br />
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_dna" 
                    GroupItemCount="4" DataSourceID="SqlDataSource_select">
                    <EmptyItemTemplate>
                        <td ID="Td1" runat="server" />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <td valign="top">
                                <div class="list_revista">
                                    <a href='images/dna/<%# Eval("arquivo") %>'>
                                    <img height="113" src='images/dna/<%# Eval("imagem") %>' 
                                        width="86" height="115" /><br />
                                        <strong><%# Eval("titulo") %></strong></a><br />
                                        <a href='images/dna/<%# Eval("arquivo") %>'><i>Baixar</i></a>
                                </div>
                            </td>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table ID="Table1" runat="server" style="">
                                <tr>
                                    <td>
                                        Nenhuma Edição Cadastrada.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div ID="groupPlaceholderContainer" runat="server">
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
                    <br />
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" 
                        PageSize="16">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Primeira" 
                                LastPageText="Última" NextPageText="Proxima" PreviousPageText="Anterior" 
                                ShowFirstPageButton="True" ShowNextPageButton="False" 
                                ShowPreviousPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Primeira" 
                                LastPageText="Última" NextPageText="Próxima" PreviousPageText="Anterior" 
                                ShowLastPageButton="True" ShowNextPageButton="False" 
                                ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource_select" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString %>" 
                        SelectCommand="SELECT [id_dna], [titulo], [edicao], [imagem], [arquivo] FROM [tb_dna] ORDER BY [edicao] DESC">
                    </asp:SqlDataSource>
</asp:Content>

