<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_espaco_saude.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D&#39;or &gt; Espaço Saúde </strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2><strong>Espaço Saúde</strong></h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="pagina" HeaderText="Páginas Fixas">
                <HeaderStyle Height="30px" HorizontalAlign="Left" Width="400px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:HyperLinkField DataTextField="ver" />
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
<p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Nova Página" Width="110px" 
        onclick="Button1_Click" />
    </p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_conteudo" DataSourceID="ds_paginas" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="nm_titulo" HeaderText="Página" 
                    SortExpression="nm_titulo">
                <HeaderStyle Height="30px" HorizontalAlign="Left" Width="400px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="id_conteudo" 
                    DataNavigateUrlFormatString="portal_espaco_saude_editar.aspx?id={0}" Text="Editar">
                <ItemStyle HorizontalAlign="Center" Width="70px" />
                </asp:HyperLinkField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            onclientclick="return confirm('Você tem certeza que deseja excluir este registro?')" 
                            Text="Excluir"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            SelectCommand="SELECT [id_conteudo], [nm_titulo] FROM [TB_PORTAL_CONTEUDO] WHERE (([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND ([id_sessao] = @id_sessao))" 
            DeleteCommand="UPDATE [TB_PORTAL_CONTEUDO] SET [id_status] = 2 WHERE [id_conteudo] = @id_conteudo" 
            InsertCommand="INSERT INTO [TB_PORTAL_CONTEUDO] ([nm_titulo]) VALUES (@nm_titulo)" 
            UpdateCommand="UPDATE [TB_PORTAL_CONTEUDO] SET [nm_titulo] = @nm_titulo WHERE [id_conteudo] = @id_conteudo">
            <DeleteParameters>
                <asp:Parameter Name="id_conteudo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nm_titulo" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
                <asp:Parameter DefaultValue="3" Name="id_sessao" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nm_titulo" Type="String" />
                <asp:Parameter Name="id_conteudo" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

