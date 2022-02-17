<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_home_banner.aspx.cs" Inherits="admincms_portal_home_banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Gerenciar Home Page > Banner 
    <asp:Label ID="lbl_banner" runat="server" Text=""></asp:Label></strong></p>
<h2>&nbsp;</h2>
    <h2>Editar Banner</h2>
<p>
    &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
Link do banner:<br />
<asp:TextBox ID="txt_link" runat="server" CssClass="txt" width="300px"></asp:TextBox>
</p>
    <p>
        &nbsp;</p>
    <p>
        Descrição do Banner</p>
    <p>
<asp:TextBox ID="txt_descricao" runat="server" CssClass="txt" width="300px"></asp:TextBox>
</p>
<p>&nbsp;</p>
    <p>Imagem Chamada:</p>
<p><asp:Image ID="Image1" runat="server" />
</p>
    <p>
        <asp:Label ID="lblerro" runat="server"></asp:Label>
<br />
        <span class="style2"><br /></span> 
Mudar imagem:<br />
<asp:FileUpload ID="FileUpload1" runat="server" Width="244px" CssClass="txt" />
</p>
<asp:Panel ID="pnlSelo" runat="server">
    <p>&nbsp;</p>
    <p>
        Selo Banner</p>
    <p>
<asp:DropDownList ID="drpCssType" runat="server"></asp:DropDownList>
</p>
</asp:Panel>
    <p>&nbsp;</p>
    <p>
        <asp:Button ID="btn_gravar" runat="server" BackColor="#666666" Font-Bold="True" 
            Font-Size="16px" ForeColor="White" Height="32px" Text="Gravar" 
            Width="88px" onclick="btn_gravar_Click" />
</p>
    <p>&nbsp;</p>
</asp:Content>

