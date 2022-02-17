<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form1.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

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
text-align:right;
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                            </td>
</tr>
<tr>
<td width="100" class="celula_table" valign=top>Nome:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome" 
        ErrorMessage="Preencha o campo nome.">*</asp:RequiredFieldValidator>
                            </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtnome" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table" valign=top>Empresa:&nbsp;&nbsp;&nbsp; </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtempresa" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table" valign=top>Telefone:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttelefone" 
        ErrorMessage="Preencha o campo telefone">*</asp:RequiredFieldValidator>
                            </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txttelefone" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table" valign=top>Email:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail" 
        ErrorMessage="Preencha o campo email.">*</asp:RequiredFieldValidator>
                            </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtemail" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table" valign=top>Assunto:&nbsp;&nbsp;&nbsp; </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtassunto" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table" valign=top>Mensagem:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmensagem" 
        ErrorMessage="Preencha o campo mensagem">*</asp:RequiredFieldValidator>
                            </td>
<td rowspan="2" class="style1" valign=top>
    <asp:TextBox ID="txtmensagem" runat="server" Height="130px" TextMode="MultiLine" 
        Width="300px" CssClass="text_field"></asp:TextBox>
                            </td>
</tr>
<tr>
<td class="celula_table"></td>
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

