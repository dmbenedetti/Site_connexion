<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="subpaginas.aspx.cs" Inherits="admin_paginas_portal" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <h2 class="style1">
        <asp:Label ID="lbl_paginamae" runat="server" Text=""></asp:Label>:  Sub-Páginas</h2>
    <p>
        &nbsp;</p>
    <p>
    
    <br />
    <div id="novo_item">
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Inserir Nova SubPágina</asp:LinkButton></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Width="600px" AllowPaging="True" 
    PageSize="30">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="20px" />
        <Columns>
            <asp:BoundField DataField="titulo" HeaderText="Página" SortExpression="titulo">
                <HeaderStyle HorizontalAlign="Left" Height="30px" />
            </asp:BoundField>
            <asp:HyperLinkField HeaderText="Editar" 
                Text="&lt;img src=&quot;images/bt_editar.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="editar_subpagina.aspx?id={0}" >
                <ControlStyle Width="60px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" 
                    Height="30px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField HeaderText="Excluir" 
                Text="&lt;img src=&quot;images/bt_excluir.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="excluir_subpagina.aspx?id={0}" >
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
        
        SelectCommand="SELECT [id], [titulo] FROM [tb_paginas] WHERE (([subpagina] = @subpagina) AND ([pagina_mae] = @pagina_mae))">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="subpagina" Type="Int32" />
            <asp:QueryStringParameter Name="pagina_mae" QueryStringField="id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

<br />
<br />
<asp:ImageButton ID="ImageButton2" runat="server" 
    ImageUrl="~/admin/images/btn_voltar.jpg" onclick="ImageButton2_Click" />
</asp:Content>

