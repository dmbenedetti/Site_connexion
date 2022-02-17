<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Fotobb_texto.aspx.cs" Inherits="admin_Fotobb_texto" Title="Untitled Page" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<p>
        &nbsp;</p>
    <h2 class="style1">
        Editar Páginas do Portal</h2>
    <p>
        &nbsp;</p>
                                    <p>
    <br />
                                    </p>
<!-- Div Conteudo_pag-->
<div id="conteudo_pag">
    <p><b>Texto:</b></p>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="600px" Width="600px" SkinPath="skins/silver/" BasePath="../fckeditor/"></FCKeditorV2:FCKeditor>
</div>
    <br />
    <br />
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/admin/images/btn_gravar.jpg" onclick="ImageButton2_Click" />
        <br /><br /><br />
</div>
</asp:Content>

