<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="usuarios_editar.aspx.cs" Inherits="admincms_usuarios_editar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Portal Rede D'or > Usuários Área Restrita > <asp:Label ID="lbl_usuario" runat="server" Text=""></asp:Label> > Editar</p>
<h2>Dados do Usuário</h2>
<p></p>
    <p>
        &nbsp;</p>
    <p>
    
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                ValidationGroup="Usuario" />
    <p>
    <table border="0" cellpadding="4">
                <tr>
                    <td align="left" class="style5" height="30" valign="middle">
                        Nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txt_nome" ErrorMessage="Campo nome é obrigatório" 
                            ForeColor="Red" ValidationGroup="Usuario">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txt_nome" runat="server" CssClass="txt" Height="24px" 
                            Width="407px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style5" height="30" valign="middle">
                        Email:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txt_email" ErrorMessage="Campo email é obrigatório" 
                            ForeColor="Red" ValidationGroup="Usuario">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txt_email" ErrorMessage="Email inválido" ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="Usuario">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txt_email" runat="server" CssClass="txt" Height="24px" 
                            Width="407px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style5" height="30" valign="middle">
                        <p>
                            Login:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txt_login" ErrorMessage="Campo login é obrigatório" 
                                ForeColor="Red" ValidationGroup="Usuario">*</asp:RequiredFieldValidator>
                        </p>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txt_login" runat="server" AutoPostBack="True" CssClass="txt" 
                            Height="24px" ontextchanged="txt_login_TextChanged" Width="200px"></asp:TextBox>
                        &nbsp;<asp:Label ID="lbl_valida_login" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style5" height="30" valign="middle">
                        Senha:<asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="txt_senha_confirm" ControlToValidate="txt_senha" 
                            ErrorMessage="As senhas digitadas não conferem" ForeColor="Red" 
                            ValidationGroup="Usuario">*</asp:CompareValidator>
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="txt_senha" runat="server" CssClass="txt" Height="24px" 
                            TextMode="Password" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style5" height="30" valign="middle">
                        Confirmar Senha:</td>
                    <td class="style4">
                        <asp:TextBox ID="txt_senha_confirm" runat="server" CssClass="txt" Height="24px" 
                            TextMode="Password" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style5" height="30" valign="middle">
                        &nbsp;</td>
                    <td class="style4">
            
    <b>Permissões:</b><br />
    <asp:CheckBox ID="chkAll" Text="Todos" runat="server" />
    <asp:CheckBoxList ID="chb_hospitais" runat="server">
    </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style5" height="30" valign="middle">
                        &nbsp;</td>
                    <td class="style4">
            
    <asp:Button ID="btn_gravar" runat="server" BackColor="#666666" Font-Bold="True" ForeColor="White" Height="25px" onclick="btn_gravar_Click" Text="Gravar" ValidationGroup="Usuario" Width="95px" />
                    </td>
                </tr>
            </table>
            <br />
    <input id="btn_voltar" type="button" value="&laquo; Voltar" onclick="history.back();" class="btn" /><br />
</asp:Content>

