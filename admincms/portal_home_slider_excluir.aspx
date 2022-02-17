<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_home_slider_excluir.aspx.cs" Inherits="admincms_portal_home_slider_excluir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Gerenciar Home Page > Slider > Excluir</strong></p>
<h2>&nbsp;</h2>
    <h2>Excluir imagem</h2>
    <br /><br />
<p>
    Você tem certeza que deseja excluir esta imagem?</p>
<p>
    Link:
    <asp:Label ID="Label1" runat="server"></asp:Label>
</p>
<p>
    <asp:Image ID="Image1" runat="server" Height="300px" Width="940px" />
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" onclick="Button1_Click" Text="Excluir" 
        Width="80px" />
</p>
<p>
    &nbsp;</p>

</asp:Content>

