<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Fotobb_fotos.aspx.cs" Inherits="admin_Fotobb_texto" Title="Untitled Page" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<p>
        &nbsp;</p>
    <h2 class="style1">
        Fotos de Bebê</h2>
    <p>
        &nbsp;</p>
                                    <p>
    <br />
                                    </p>
<!-- Div Conteudo_pag-->
    <div id="novo_item">
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Inserir 
        Novas Fotos</asp:LinkButton>
        </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" 
        ForeColor="#333333" GridLines="None" Width="600px" AllowPaging="True" 
    PageSize="30" OnPageIndexChanging="GridView_PageIndexChanging">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="20px" />
        <Columns>
            <asp:BoundField DataField="data_entrada" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Data de Inclusão" SortExpression="data_entrada">
                <ControlStyle Width="130px" />
                <HeaderStyle HorizontalAlign="Left" Width="130px" />
                <ItemStyle Width="130px" />
            </asp:BoundField>
            <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="nome_bb" HeaderText="Nome do Bebê" 
                SortExpression="nome_bb">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:HyperLinkField HeaderText="Editar" 
                Text="&lt;img src=&quot;images/bt_editar.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="Fotobb_fotos_editar.aspx?id={0}" >
                <ControlStyle Width="60px" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" 
                    Height="30px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" />
            </asp:HyperLinkField>
            <asp:HyperLinkField HeaderText="Excluir" 
                Text="&lt;img src=&quot;images/bt_excluir.gif&quot;&gt;" 
                DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="Fotobb_fotos_excluir.aspx?id={0}" >
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

<br />
<br />
        <br /><br /><br />
</div>
</asp:Content>

