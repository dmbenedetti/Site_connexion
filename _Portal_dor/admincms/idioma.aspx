<%@ Page Language="C#" AutoEventWireup="true" CodeFile="idioma.aspx.cs" Inherits="admincms_idioma" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Selecionar Idioma</title>
    <link rel="stylesheet" href="styles.css" />
    </head>
<body>
    <form id="form1" runat="server">
    <div id="geral">
        <p id="logo_default">
        <img src="images/logoRedeDor.jpg" id="logoRedeDor" />
        </p>
        <br />
<br />
<br />
        <br />
        <table align="center" width="400">
            <tr>
                <td align="center">
                    Escolha o idioma que deseja gerenciar a Área Restrita</td>
            </tr>
            <tr>
                <td class="">
                <div class="idioma">
                    
                    <asp:RadioButtonList ID="rdo_idioma" runat="server" Height="169px" 
                        Width="142px">
                        <asp:ListItem Value="1">&nbsp;&nbsp;<img src="images/flag_brasil.png">&nbsp;&nbsp;PT-BR</asp:ListItem>
                        <asp:ListItem Value="2">&nbsp;&nbsp;<img src="images/flag_eua.png">&nbsp;&nbsp;EN-USA</asp:ListItem>
                        <asp:ListItem Value="3">&nbsp;&nbsp;<img src="images/flag_espanha.png">&nbsp;&nbsp;ES-SP</asp:ListItem>
                    </asp:RadioButtonList>
                    
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_ok" runat="server" BackColor="#666666" Font-Bold="True" 
                        ForeColor="White" Height="31px" Text="OK" Width="45px" 
                        onclick="btn_ok_Click" />
                    
                </div>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
