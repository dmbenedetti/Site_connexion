<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="usuarios.aspx.cs" Inherits="admincms_usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Portal Rede D'or > Usuários Área Restrita</p>
 <br />
  <br />
<h2>Usuários da Área Restrita</h2>
   
    <br />
    <br />
<p>
    <asp:Button ID="btn_novoUser" runat="server" BackColor="#666666" 
        Font-Bold="True" ForeColor="White" Height="33px" onclick="btn_novoUser_Click" 
        PostBackUrl="~/admincms/usuarios_criar.aspx" Text="Novo Usuário" 
        Width="118px" />
    </p>
    <br />
    <br />
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_user" DataSourceID="ds_usuarios" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="nm_user" HeaderText="Usuário" 
                    SortExpression="nm_user">
                <HeaderStyle Height="30px" HorizontalAlign="Left" />
                <ItemStyle Height="30px" Width="250px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="id_user" 
                    DataNavigateUrlFormatString="usuarios_editar.aspx?id={0}" Text="Editar">
                <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="id_user" 
                    DataNavigateUrlFormatString="usuarios_excluir.aspx?id={0}" Text="Excluir">
                <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:HyperLinkField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="ds_usuarios" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            SelectCommand="SELECT [id_user], [nm_user] FROM [TB_ADMIN_USER] WHERE ([id_status] = @id_status)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        <input id="btn_voltar" class="btn" onclick="history.back();" type="button" 
            value="« Voltar" /><br />
    </p>
</asp:Content>

