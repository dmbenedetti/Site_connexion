<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="noticias.aspx.cs" Inherits="admin_noticias" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.style1{
color: #666666;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>&nbsp;</p>
<h2 class="style1">Notícias do Portal</h2>
<p>&nbsp;</p>

<div id="novo_item"><a href="inserir_noticia.aspx">Inserir Nova Notícia</a></div>
    
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Width="600px" AllowPaging="True" 
    PageSize="30">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="20px" />
        <Columns>
            <asp:BoundField DataField="titulo" HeaderText="Notícia" SortExpression="titulo">
                <HeaderStyle HorizontalAlign="Left" Height="30px" />
            </asp:BoundField>
            <asp:HyperLinkField HeaderText="Editar" 
                Text="&lt;img src=&quot;images/bt_editar.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="editar_noticia.aspx?id={0}" >
                <ControlStyle Width="60px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" 
                    Height="30px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField HeaderText="Excluir" 
                Text="&lt;img src=&quot;images/bt_excluir.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="excluir_noticia.aspx?id={0}" >
                <ControlStyle Width="60px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" 
                    Height="30px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString %>" 
        
        
        SelectCommand="SELECT [id], [titulo], [data] FROM [tb_noticias] ORDER BY [data] DESC">
    </asp:SqlDataSource>

</asp:Content>

