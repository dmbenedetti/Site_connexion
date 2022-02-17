<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="english.aspx.cs" Inherits="campanhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.campanhas_front a
{
    text-decoration:none;
    color:#666666;
}
.campanhas_front h3
{
    font-size:16px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>English</h2>
<br /><br />
<h3>
    <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h3>
    <br />
    <asp:Literal ID="ltr_conteudo" runat="server"></asp:Literal>
    <br /><br />

</asp:Content>

