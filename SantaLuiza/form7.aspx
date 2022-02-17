<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form7.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container_interna">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <br />
<p>
Dados pessoais
</p>
            <div style="font:Tahoma, arial, verdana; color:#666666;">
              <div align="center">
                <table id="table_contato" align=center>
                  <tr>
                    <td class="celula_table" valign=top align="left" colspan="2">
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                      </td>
                  </tr>
                  <tr>
                    <td width="" class="celula_table" valign=top>Nome do paciente:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome" 
        ErrorMessage="Preencha o campo nome do paciente.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtnome" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Número do quarto:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNumeroQuarto" 
        ErrorMessage="Preencha o campo do número do quarto.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtNumeroQuarto" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Seu Nome:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSeuNome" 
        ErrorMessage="Preencha o campo do seu nome.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtSeuNome" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Seu e-mail:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSeuEmail" 
        ErrorMessage="Preencha o campo do seu e-mail.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtSeuEmail" runat="server" Width="300px" 
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
</div>
</asp:Content>

