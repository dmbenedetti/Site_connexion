<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="am_cadastro.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>

    <style>
        #contato
        {
            background: url(images/btn_contato_hover.jpg);
        }
        #table_contato
        {
            width: 400px;
        }
        .celula_table
        {
            height: 30px;
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            text-align: right;
            width: 388px;
        }
        .celula_table2
        {
            height: 40px;
            width: 300px;
            text-align: left;
        }
        .text_field
        {
            border: solid 1px #849E9F;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="container_interna">
        <div id="titulo_pag">
            <h2>
                <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
        </div>
        <br />
        <p>
            <asp:Literal ID="ltlResumo" runat="server"></asp:Literal>
        </p>
        <div style="font: Tahoma, arial, verdana; color: #666666;">
            <div align="center">
                <table id="table_contato" align="center">
                    <tr>
                        <td class="celula_table" valign="top" align="left" colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100" class="celula_table" valign="top">
                            Nome:*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome"
                                ErrorMessage="Preencha o campo nome.">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style1" valign="top">
                            <asp:TextBox ID="txtnome" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="celula_table" valign="top">
                            E-mail:*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Preencha o campo email.">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style1" valign="top">
                            <asp:TextBox ID="txtEmail" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="celula_table" valign="top">
                            CRM:*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCRM"
                                ErrorMessage="Preencha o campo CRM.">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style1" valign="top">
                            <asp:TextBox ID="txtCRM" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="celula_table" valign="top">
                            Endereço:*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="txtEndereco" ErrorMessage="Preencha o campo endereço.">*</asp:RequiredFieldValidator>
                        </td>
                        <td class="style1" valign="top">
                            <asp:TextBox ID="txtEndereco" runat="server" Width="600px" CssClass="text_field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="celula_table">
                        </td>
                    </tr>
                    <tr>
                        <td class="celula_table">
                        </td>
                        <td align="right" class="style2">
                            *campos obrigatórios<br /><br />
                            <asp:LinkButton ID="btnEnviar" runat="server" Text=">> ENVIAR" CssClass="btnEnviar" OnClick="btnEnviar_Click"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
