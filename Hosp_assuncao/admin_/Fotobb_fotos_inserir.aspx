﻿<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Fotobb_fotos_inserir.aspx.cs" Inherits="admin_Fotobb_texto" Title="Untitled Page" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 591px;
            height: 261px;
        }
        .style2
        {
        }
        .style3
        {
            width: 126px;
            height: 31px;
        }
        .style4
        {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<p>
        &nbsp;</p>
    <h2 >
        Inserir Fotos De Bebê</h2>
    <p>
        &nbsp;</p>
                                    <p>
    <br />
                                    </p>
        <table cellpadding="0" cellspacing="1" class="style1">
            <tr>
                <td class="style2" colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    <br />
                    <asp:Label ID="lbl_msg" runat="server" style="color: #FF0000; font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_codigo" ErrorMessage="Preencha o campo senha">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_codigo" runat="server" CssClass="txt" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Nome do Bebê:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        runat="server" ControlToValidate="txt_nome_bb" 
                        ErrorMessage="Preencha o campo nome do bebê">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_nome_bb" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    Peso:</td>
                <td class="style11">
                    <asp:TextBox ID="txt_peso" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    Altura:</td>
                <td class="style11">
                    <asp:TextBox ID="txt_altura" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Nome da Mãe:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        runat="server" ControlToValidate="txt_nome_mae" 
                        ErrorMessage="Preencha o campo nome da mãe">*</asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_nome_mae" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Nome do pai:</td>
                <td>
                    <asp:TextBox ID="txt_nome_pai" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Foto 1:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                        runat="server" ControlToValidate="FileUpload1" 
                        ErrorMessage="Escolha uma foto para cadastrar">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt" Width="400px" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Foto 2:</td>
                <td>
                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="txt" Width="400px" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Data de expiração:</td>
                <td>
                    <asp:TextBox ID="txt_data" runat="server" Width="201px" CssClass="txt"></asp:TextBox>
            
                    <asp:CalendarExtender ID="txt_data_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="txt_data" TodaysDateFormat="dd/MM/yyyy" Format="dd/MM/yyyy" >
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" CssClass="txt" Height="21px" 
                        Text="Gravar" Width="73px" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

<br />
<br />
        <br /><br /><br />
</div>
</asp:Content>

