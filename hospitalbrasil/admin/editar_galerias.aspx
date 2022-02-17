<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editar_galerias.aspx.cs" Inherits="admin_editar_galerias" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.cat_produtos{
display:block;
width:160px; 
height:auto;
margin:10px 18px;
padding:5px;
float:left;
border:solid 1px #ccc;
text-align:center;}
.nome_cat{
display:block;
font:bold 11px verdana, Helvetica, sans-serif;
color:#0B44AC;
text-decoration:none;
text-align:center;
padding:10px 0;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>
        &nbsp;</p>
    <h2 class="style1">
        Editar Galerias de Fotos</h2>
    <p></p><p><br /></p>
    <table align="left" cellpadding="0" cellspacing="0" class="style2">
            <tr>
                <td>
                    <asp:Label ID="lbl_inserir_foto" runat="server" Text="Inserir Foto:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="fupfoto" runat="server" Width="275px" CssClass="txt" />
                    <br />
                    Título:<br />
                    <asp:TextBox ID="txt_titulo" runat="server" Width="403px" CssClass="txt"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Enviar" 
                        CssClass="txt" />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmsg" runat="server" style="color: #FF0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
                    DataSourceID="SqlDataSource1" GroupItemCount="4">
                    <EmptyItemTemplate>
                        <td id="Td1" runat="server" />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <td valign=top>
                            <div class="cat_produtos">
			                    
			                    <img src='../images/galeria/<%# Eval("nome_arquivo") %>' height="113" width="150" /><br />
			                    <p><strong><%# Eval("titulo") %></strong></p>
			                    <br />
			                    <a href='galeria_excluir_foto.aspx?id=<%# Eval("id") %>'>
                                Excluir</a> | <a href='galeria_editar_foto.aspx?id=<%# Eval("id") %>'>
                                Editar</a>
			                </div>
                            </td>
                            
                        </ItemTemplate>
                        
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" style="">
                                <tr>
                                    <td>
                                        Nenhuma Foto Cadastrada.</td>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString %>" 
                            SelectCommand="SELECT [id], [id_pg], [nome_arquivo], [titulo] FROM [tb_galeria] WHERE ([id_pg] = @id_pg)" 
                            ProviderName="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString.ProviderName %>">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id_pg" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    <br />
                        <asp:Button ID="Button5" runat="server" Height="35px" onclick="Button5_Click" 
                            Text="Voltar" Width="86px" />
                        &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>

