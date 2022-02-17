<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="hospitais.aspx.cs" Inherits="admincms_hospitais" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Portal Rede D'or > Hospitais</p>

    <h2>&nbsp;</h2>

    <p>
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/admincms/images/btn_novo_hospital.jpg" 
            PostBackUrl="~/admincms/hospitais_cadastrar.aspx" />
</p>
<p>&nbsp;</p>
<p>Hospitais Cadastrados:</p>
<p>
    <asp:GridView ID="gdv_hospitais" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_hospital" HeaderText="ID">
            <ItemStyle HorizontalAlign="Center" Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="nm_hospital" HeaderText="HOSPITAL">
            <HeaderStyle Height="40px" HorizontalAlign="Left" VerticalAlign="Middle" />
            <ItemStyle Height="30px" Width="300px" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id_hospital" DataNavigateUrlFormatString="hospitais_editar.aspx?id={0}" Text="Editar">
            <ItemStyle HorizontalAlign="Center" Width="50px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="id_hospital" 
                DataNavigateUrlFormatString="hospital_excluir.aspx?id={0}" Text="Excluir" />
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
</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    <input id="btn_voltar" class="btn" onclick="history.back();" type="button" 
        value="« Voltar" /><br />
</p>
</asp:Content>

