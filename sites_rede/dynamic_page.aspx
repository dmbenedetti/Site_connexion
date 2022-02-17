<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dynamic_page.aspx.cs" Inherits="imprensa_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container_interna">
<h2>
    <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
    <br /><br />
    <asp:Literal ID="ltr_conteudo" runat="server"></asp:Literal>
</div>
</asp:Content>

