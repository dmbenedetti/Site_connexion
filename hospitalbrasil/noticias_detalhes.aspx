<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="noticias_detalhes.aspx.cs" Inherits="quem_somos" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.ver_mais
{
    font:14px "Frutiger LT 57 Cn", Arial, Helvetica, sans-serif;
text-decoration:none;
color:#436DA2;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2>Notícias</h2>
            </div>
            <h3><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h3>
            
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
  <p><a href="noticias.aspx" class="ver_mais"><strong>+ Ver mais notícias</strong> </a></p>
</asp:Content>

