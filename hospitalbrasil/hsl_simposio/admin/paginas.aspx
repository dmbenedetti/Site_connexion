<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="paginas.aspx.cs" Inherits="admin_paginas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2>Gerenciar Páginas</h2>

<br />
    <a href="newPage.aspx">&raquo; Criar Página</a><br />
    <br />
<p>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id_pagina" DataSourceID="dsPaginas" 
        ForeColor="#333333" GridLines="None" Width="443px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="id_pagina" 
                DataNavigateUrlFormatString="editPage.aspx?id={0}" 
                DataTextField="nm_pagina" HeaderText="Páginas" >
            <HeaderStyle Height="30px" HorizontalAlign="Left" />
            <ItemStyle Height="30px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id_pagina" 
                DataNavigateUrlFormatString="deletePage.aspx?id={0}" 
                Text="&lt;img src='images/bt_excluir.gif'&gt;">
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:HyperLinkField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
<%--        SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" /--%>
    </asp:GridView>
    <asp:SqlDataSource ID="dsPaginas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbSimposioConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:dbSimposioConnectionString.ProviderName %>" 
        SelectCommand="SELECT [nm_pagina], [id_pagina] FROM [tb_paginas]">
    </asp:SqlDataSource>

</p>
</asp:Content>

