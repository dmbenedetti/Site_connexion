<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="transmissaodeparto.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
#contato{
background:url(images/btn_contato_hover.jpg);}
#table_contato{
width:400px;}
.celula_table{
height:30px;
font:12px Tahoma, Arial, Helvetica, sans-serif;
color:#666;
text-align:left;
width:388px;
    }
.celula_table2{
height:40px;
width:300px;
text-align:left;
}
.text_field{
border:solid 1px #849E9F;
height:23px;}
    .style1
    {
        height: 40px;
        width: 289px;
        text-align: left;
    }
    .style2
    {
        width: 289px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <div style="font:Tahoma, arial, verdana; color:#666666;">
<table id="table_contato" align=center>
<tr>
<td class="celula_table" valign=top align="left" colspan="2">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="color: #FF0000; text-align: left" />
                            <br />
    <asp:Label ID="lblmsg" runat="server" style="text-align: left; color: #FF0000"></asp:Label>
                            </td>
</tr>
<tr>
<td width="100" class="celula_table" valign=top>Login*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLogin" 
        ErrorMessage="Preencha o campo Login.">*</asp:RequiredFieldValidator>
                            </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtLogin" runat="server" Width="300px" CssClass="text_field" MaxLength="40"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table" valign=top>Senha:</td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtsenha" runat="server" Width="300px" CssClass="text_field" MaxLength="8" TextMode="Password"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table"></td>
<td align="right" class="style2">
    *campos obrigatórios<br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_enviar.png" 
        onclick="ImageButton1_Click" />
    </td>
</tr>
</table>
</div>
</asp:Content>

