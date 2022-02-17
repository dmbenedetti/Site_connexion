<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admincms_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Área Restrita - Rede D'or</title>
     <link href="styles.css" rel="stylesheet" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="geral">
        <h2 id="arearestrita">Área Restrita</h2>
        <p id="logo_default">
        <img src="images/logoRedeDor.jpg" id="logoRedeDor" />
        </p>
        <div id="Login-box">
			  <div id="control_login">
            <asp:Login ID="login_admin" runat="server" DisplayRememberMe="False" 
                      FailureText="Sua tentativa de login não foi bem sucedida. Por favor, tente novamente." 
                      Height="164px" LoginButtonText="ENTRAR" PasswordLabelText="Senha:" 
                      PasswordRequiredErrorMessage="Campo senha é obrigatório." 
                      TextLayout="TextOnTop" TitleText="" UserNameLabelText="Usuário:" 
                      UserNameRequiredErrorMessage="Campo usuário é obrigatório." Width="267px" 
                      ViewStateMode="Enabled" onauthenticate="login_admin_Authenticate">
                <FailureTextStyle HorizontalAlign="Left" VerticalAlign="Top" />
                <LoginButtonStyle BackColor="Gray" BorderStyle="None" Font-Bold="True" Font-Size="16px" Height="30px" Width="100px" />
                <TextBoxStyle Height="25px" Width="250px" />
            </asp:Login>
			        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" ValidationGroup="login_admin" />
                  <br />
			        </div>      
        </div>
    </div>
    </form>
</body>
</html>
