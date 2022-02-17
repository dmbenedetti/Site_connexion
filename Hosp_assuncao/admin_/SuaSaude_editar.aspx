<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="SuaSaude_editar.aspx.cs" Inherits="admin_portal_excluir_pagina" Title="Untitled Page" %>

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
        Editar Edição Revista SuaSaúde</h2>
        <p>
        &nbsp;</p>
    <p>
                Título:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txt_titulo" ErrorMessage="Digite um título"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" Width="403px"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_texto" runat="server" Text="Edição:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txt_edicao" ErrorMessage="Digite um número de edição"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txt_edicao" runat="server" CssClass="txt" Width="88px"></asp:TextBox>
                <br />
                <asp:Label ID="lbl_inserir_foto" runat="server" Text="Inserir imagem:"></asp:Label>
                <br />
                <asp:FileUpload ID="fupfoto" runat="server" CssClass="txt" Width="275px" />
                <br />
                <asp:Label ID="lbl_inserir_foto0" runat="server" Text="Inserir arquivo pdf:"></asp:Label>
                <br />
                <asp:FileUpload ID="fuparquivo" runat="server" CssClass="txt" Width="275px" />
                <br />
                <p>
    <asp:Image ID="img" runat="server" Height="113px" Width="150px" />
        <p>
                <br />
                <asp:Button ID="Button4" runat="server" CssClass="txt" onclick="Button4_Click" 
                    Text="Enviar" />
            <br />
<p>
                <asp:Label ID="lblmsg" runat="server" style="color: #FF0000"></asp:Label>
            <br /><br />
        <asp:ImageButton ID="ImageButton2" runat="server" 
            ImageUrl="~/admin/images/btn_excluir.jpg" onclick="ImageButton2_Click" />
    <br />
    
        
</asp:Content>

