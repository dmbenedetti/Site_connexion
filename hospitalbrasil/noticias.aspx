<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="noticias.aspx.cs" Inherits="quem_somos" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.not a
{
    text-decoration:none;
color:#436DA2;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="titulo_pag">
            	<h2>Notícias</h2>
            </div>
            <div class="not">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="6" 
        CellSpacing="5" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        GridLines="Vertical" HorizontalAlign="Center" 
         PageSize="20" Width="665px">
        <RowStyle BackColor="White" ForeColor="Black" Height="25px" />
        <Columns>
            <asp:BoundField DataField="data" DataFormatString="{0:dd/MM/yyy}" 
                HeaderText="Data" SortExpression="data">
                <ControlStyle Height="20px" Width="80px" />
                <FooterStyle BackColor="#CDCDCD" />
                <HeaderStyle BackColor="#6EB8E7" ForeColor="White" Height="20px" 
                    HorizontalAlign="Center" Width="80px" />
                <ItemStyle Height="20px" Width="80px" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="noticias_detalhes.aspx?id={0}" 
                DataTextField="titulo" HeaderText="Titulo">
                <ControlStyle Height="20px" />
                <FooterStyle BackColor="#CDCDCD" />
                <HeaderStyle BackColor="#6EB8E7" ForeColor="White" Height="20px" 
                    HorizontalAlign="Left" />
                <ItemStyle CssClass="link" ForeColor="#333333" Height="20px" />
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#CDCDCD" ForeColor="White" HorizontalAlign="Right" 
            VerticalAlign="Middle" />
        <PagerStyle BackColor="#999999" CssClass="pager_align" Font-Size="12px" 
            ForeColor="White" HorizontalAlign="Right" VerticalAlign="Middle" Width="30px" 
            Wrap="False" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#F2F2F2" Height="25px" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString %>" 
        SelectCommand="SELECT [id], [titulo], [data] FROM [tb_noticias] ORDER BY [data] DESC">
    </asp:SqlDataSource>
  </div>
</asp:Content>

