<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_espacoSaude.master" AutoEventWireup="true" CodeFile="espaco_saude_page.aspx.cs" Inherits="espaco_saude" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>
    <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
    <br /><br />
    <asp:Literal ID="ltr_conteudo" runat="server"></asp:Literal>
</asp:Content>

