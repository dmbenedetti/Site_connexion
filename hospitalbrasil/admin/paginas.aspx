<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="paginas.aspx.cs" Inherits="admin_paginas_portal" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <b>Páginas Fixas:</b><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" 
        ForeColor="#333333" GridLines="None" Width="600px" AllowPaging="True" 
    PageSize="30">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="20px" />
        <Columns>
            <asp:BoundField DataField="titulo" HeaderText="Páginas" SortExpression="titulo">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:HyperLinkField HeaderText="Sub-páginas" 
                Text="&lt;img src=&quot;images/bt_permissao.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="subpaginas.aspx?id={0}" >
                <ControlStyle Width="80px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" 
                    Height="30px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField HeaderText="Editar" 
                Text="&lt;img src=&quot;images/bt_editar.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="editar_pagina.aspx?id={0}" >
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString %>" 
        SelectCommand="SELECT [id], [titulo] FROM [tb_paginas] WHERE ([id] &lt; @id)">
        <SelectParameters>
            <asp:Parameter DefaultValue="7" Name="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
  <br /><br /> <b>Páginas Dinâmicas:</b>
    <div id="novo_item"><a href="inserir_pagina.aspx">Inserir Nova Página</a></div>
    
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Width="600px" AllowPaging="True" 
    PageSize="30">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="20px" />
        <Columns>
            <asp:BoundField DataField="titulo" HeaderText="Página" SortExpression="titulo">
                <HeaderStyle HorizontalAlign="Left" Height="30px" />
            </asp:BoundField>
            <asp:HyperLinkField HeaderText="Sub-páginas" 
                Text="&lt;img src=&quot;images/bt_permissao.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="subpaginas.aspx?id={0}" >
                <ControlStyle Width="80px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" 
                    Height="30px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField HeaderText="Editar" 
                Text="&lt;img src=&quot;images/bt_editar.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="editar_pagina.aspx?id={0}" >
                <ControlStyle Width="60px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" 
                    Height="30px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField HeaderText="Excluir" 
                Text="&lt;img src=&quot;images/bt_excluir.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="excluir_pagina.aspx?id={0}" >
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
        
        SelectCommand="SELECT id, titulo FROM tb_paginas WHERE (subpagina = @subpagina) AND (id &gt; 6)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="subpagina" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

