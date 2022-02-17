<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fotosbb_ver_foto.aspx.cs" Inherits="fotosbb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.text_field{
border:solid 1px #849E9F;
height:23px;}
    .style1
    {
        width: 400px;
    }
    .style2
    {
        width: 64px;
    }
    </style>
    <link href="styles/imprimir_foto.css" rel="stylesheet" media="print" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text="Nasceu no Hospital Brasil"></asp:Label></h2>
            </div>
            <div>
                
                <table class="style1" id="tabela_fotos_small">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="lbl_foto1" runat="server" Text=""></asp:Label></td>
                        <td>
                            <asp:Label ID="lbl_foto2" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>
                
            </div>
    <p id="texto_pag">
        <br />
        Para Salvar a foto clique com o botão direito do mouse em cima da foto e escolha 
        a opção salvar imagem.<br />
        Para imprimir pressione <b>ctrl + P</b> no seu teclado</p>
    <p>
        <asp:Image ID="Image1" runat="server" Height="335px" Width="500px" CssClass="fotobb_ver" />
    </p>
    <p>&nbsp;
        </p>
    <p id="btn_pag">
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/images/btn_voltar.png" onclick="ImageButton1_Click" />
    </p>
</asp:Content>

