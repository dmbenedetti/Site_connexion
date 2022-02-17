<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="excluir_noticia.aspx.cs" Inherits="admin_portal_excluir_pagina" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style1
        {
            color: #666666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>
        &nbsp;</p>
    <h2 class="style1">
        Excluir Notícia</h2>
        <p>
        &nbsp;</p>
    <p>
        Você tem certeza que deseja excluir esta notícia?<p>
        <asp:Label ID="lbl_pagina" runat="server" style="font-weight: 700"></asp:Label>
    <p><br />
        <asp:Label ID="lblmsg" runat="server" style="color: #CC0000"></asp:Label>
    <p><br /><br /><br />
        <asp:ImageButton ID="ImageButton2" runat="server" 
            ImageUrl="~/admin/images/btn_excluir.jpg" onclick="ImageButton2_Click" />
    <br />
    
        
</asp:Content>

