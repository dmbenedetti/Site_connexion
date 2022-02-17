<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_home_slider_editar.aspx.cs" Inherits="admincms_portal_home_banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Gerenciar Home Page > Slider > Editar</strong></p>
<h2>&nbsp;</h2>
    <h2>Editar</h2>
<p>
    &nbsp;</p>
    <p>
Link:<br />
    <asp:TextBox ID="txt_link" runat="server" CssClass="txt" Height="22px" 
            Width="300px"></asp:TextBox>
</p>
<p><br />
    Ordem (Númerico, quanto menor o número, mas no ínico irá aparecer):<br />
    <asp:TextBox ID="txtOrdem" runat="server" CssClass="txt" Height="22px" Width="300px"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runa    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtOrdem" MaximumValue="9999" Display="Dynamic" MinimumValue="-9999" ErrorMessage="Ordem deve ser númerico" ForeColor="Red" Type="Integer">*</asp:RangeValidator>

</p>
    <p>
        <asp:Label ID="lblerro" runat="server"></asp:Label>
</p>
<p>
        &nbsp;</p>
<p>
        Imagem atual:<br />
</p>
    <asp:Image ID="Image1" runat="server" Height="300px" Width="940px" />
<span class="style2">
<br />
<br />
<br /></span> 
Mudar imagem:<br />
<asp:FileUpload ID="FileUpload1" runat="server" Width="244px" CssClass="txt" />
<br />
<br />
<br />
    <p>
        <asp:Button ID="btn_gravar" runat="server" BackColor="#666666" Font-Bold="True" 
            Font-Size="16px" ForeColor="White" Height="32px" Text="Gravar" 
            Width="88px" onclick="btn_gravar_Click" />
</p>
    <p>&nbsp;</p>
</asp:Content>

