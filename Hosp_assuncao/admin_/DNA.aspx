<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="DNA.aspx.cs" Inherits="admin_noticias" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
.style1{
color: #666666;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>&nbsp;</p>
<h2 class="style1">Revista DNA</h2>
<p>&nbsp;</p>

<div id="novo_item"><a href="inserir_dna.aspx">Inserir Nova Edição</a></div>
    
    <table align="left" cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Título:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txt_titulo" ErrorMessage="Digite um título"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" Width="403px"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_texto" runat="server" Text="Edição:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txt_edicao" ErrorMessage="Digite um número de edição"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txt_edicao" runat="server" CssClass="txt" Width="88px"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_inserir_foto" runat="server" Text="Inserir imagem:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="fupfoto" ErrorMessage="Escolha uma imagem para a revista"></asp:RequiredFieldValidator>
                <br />
                <asp:FileUpload ID="fupfoto" runat="server" CssClass="txt" Width="275px" />
                <br />
                <asp:Label ID="lbl_inserir_foto0" runat="server" Text="Inserir arquivo pdf:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="fuparquivo" ErrorMessage="escolha um arquivo pdf"></asp:RequiredFieldValidator>
                <br />
                <asp:FileUpload ID="fuparquivo" runat="server" CssClass="txt" Width="275px" />
                <br />
                <br />
                <asp:Button ID="Button4" runat="server" CssClass="txt" onclick="Button4_Click" 
                    Text="Enviar" />
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
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_dna" 
                    GroupItemCount="4" DataSourceID="SqlDataSource_select">
                    <EmptyItemTemplate>
                        <td ID="Td1" runat="server" />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <td valign="top">
                                <div class="cat_produtos">
                                    <p>
                                        <strong><%# Eval("titulo") %></strong></p>
                                    <img height="113" src='../images/dna/<%# Eval("imagem") %>' 
                                        width="86" height="115" /><br />
			                        <br />
                                    <a href='dna_excluir.aspx?id=<%# Eval("id_dna") %>'>Excluir</a> |
                                    <a href='dna_editar.aspx?id=<%# Eval("id_dna") %>'>Editar</a>
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
                        SelectCommand="SELECT [id_dna], [titulo], [edicao], [imagem] FROM [tb_dna] ORDER BY [edicao] DESC">
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

