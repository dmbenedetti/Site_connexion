<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="admin_user" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin:15px;" id="dados">
   <h2>Gerenciar Usuários</h2>
   <p>&nbsp;</p>
   <p>
   
   </p>
       <p>
   
   <div id="novo_item">
            <a href="inserir_user.aspx">Cadastrar Novo Usuário</a></div>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Width="600px" AllowPaging="True" 
            PageSize="40">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="Nome" 
                SortExpression="nome" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="tipo" HeaderText="Nível" 
                SortExpression="tipo">
                <ControlStyle Width="100px" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
            DataNavigateUrlFormatString="editar_user.aspx?admin_id={0}" 
            HeaderText="Editar" 
            Text="&lt;img src=&quot;images/bt_editar.gif&quot; border=0&gt;">
            <ControlStyle Width="70px" />
            <FooterStyle Width="70px" />
            <HeaderStyle Width="70px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Width="70px" HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:HyperLinkField>
        <asp:HyperLinkField DataNavigateUrlFields="id" 
            DataNavigateUrlFormatString="excluir_user.aspx?admin_id={0}" HeaderText="Excluir" 
            Text="&lt;img src=&quot;images/bt_excluir.gif&quot; border=0&gt;">
            <ControlStyle Width="50px" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
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
           
            SelectCommand="SELECT [id], [nome], [tipo] FROM [tb_users_adm] WHERE ([id] &gt; @id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id" Type="Int32" />
            </SelectParameters>
       </asp:SqlDataSource>
</asp:Content>

