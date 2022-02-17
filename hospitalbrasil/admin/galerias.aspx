<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="galerias.aspx.cs" Inherits="admin_galeria" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>
        &nbsp;</p>
    <h2 class="style1">
        Gerenciar Galerias de Fotos</h2>
    <p>
        &nbsp;</p>
                                    <p>
    <br />
                                    </p>
                                    <p>
                                        &nbsp;</p>
                                        
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
    DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
    Width="379px" PageSize="20">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:BoundField DataField="titulo" HeaderText="Páginas" 
            SortExpression="titulo" />
        <asp:HyperLinkField DataNavigateUrlFields="id" 
            DataNavigateUrlFormatString="editar_galerias.aspx?id={0}" 
            HeaderText="Editar" 
            Text="&lt;img src=&quot;images/bt_editar.gif&quot; border=0&gt;">
            <ControlStyle Width="70px" />
            <FooterStyle Width="70px" />
            <HeaderStyle Width="70px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Width="70px" HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:HyperLinkField>
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>

 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString %>" 
        
            SelectCommand="SELECT [id], [titulo], [galeria] FROM [tb_paginas] WHERE ([galeria] = @galeria)" 
            
            
        ProviderName="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString.ProviderName %>">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="galeria" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

