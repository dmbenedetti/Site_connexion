<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Área Restrita</title>
<style>

body{
background:#F2F2F2;}
.style1
{
height: 39px;
}
.style2
{
height: 110px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" bgcolor="#F2F2F2" border="0" width="100%" height="100%">
		<tr>
			<td valign="middle" align="center">
	
				<table cellspacing="0" cellpadding="0" border="0" bgcolor="#FFFFFF">
					<tr>
						<td width="23"><img src="images/borda01.gif" border="0" width="23" height="23"></td>
						<td width="400"></td>
						<td width="23"><img src="images/borda02.gif" border="0" width="23" height="23"></td>
					</tr>
					<tr>
						<td width="23"></td>
						<td width="400" valign="top" height="270">
							
							
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td valign="top" style="font-size:11px;">
											<center>
												<img src="images/logo.jpg" border="0" ><br /><br /><br />
											</center>
											<font face="Verdana, Arial, Helverica" color="#000000"><b>
												Bem-vindo à área de administração do site</b><br />
												<br>
												Para acessar o sistema, é obrigatório informar o login e senha.
											</font>
										</td>
									</tr>
									<tr>
										<td style="font-size:10px;" valign="middle" class="style1">
											
										</td>
									</tr>
									<tr>
										<td valign="top" style="font-size:10px;"  align=left class="style2">

											<font face="verdana"><b>Login</b> <asp:RequiredFieldValidator ID="vldlogin" 
                                                runat="server" ControlToValidate="txtlogin" 
                                                ErrorMessage="Preencha o campo login">*</asp:RequiredFieldValidator>
                                            
                                            <br />
											<asp:TextBox ID="txtlogin" runat="server" Width="170px"></asp:TextBox>
											<br />
											<br />
											 <b>Senha</b> <asp:RequiredFieldValidator ID="vldsenha" runat="server" 
                                                ControlToValidate="txtsenha" ErrorMessage="Preencha o campo senha">*</asp:RequiredFieldValidator>
                                            <br />
											
											<asp:TextBox ID="txtsenha" runat="server" TextMode="Password" Width="170px"></asp:TextBox>
&nbsp;<br>
											</font>
										</td>
									</tr>
									<tr>
										<td height="30" align=left valign="middle">
											&nbsp;<asp:Button ID="btnentrar" runat="server" onclick="btnentrar_Click" Text="Entrar"  />
                                            <asp:ValidationSummary ID="vldsumary" runat="server" />
										</td>
									</tr>
								</table>
							
						</td>
						<td width="23"></td>
					</tr>
					<tr>
						<td width="23"><img src="images/borda01_a.gif" border="0" width="23" height="23" /></td>
						<td align="center"><font size="1px" color="#0560A6">Desenvolvido por Connexion Net</font></td>
						<td width="23"><img src="images/borda02_a.gif" border="0" width="23" height="23" /></td>
					</tr>
				</table>
				
			</td>
		</tr>
	</table>
    </form>
</body>
</html>
