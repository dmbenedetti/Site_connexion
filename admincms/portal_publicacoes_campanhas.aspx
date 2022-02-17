<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_publicacoes_campanhas.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D&#39;or &gt; Publicações e Campanhas </strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Publicações e Campanhas</h2>
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
        &nbsp;</p>
</asp:Content>

