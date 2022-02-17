<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="inserir_user.aspx.cs" Inherits="admin_inserir_user" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Gerenciar Usuários - Inserir</h2>
   <p>&nbsp;</p>
   <p>
   
       <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
   
   </p>
       <p>
   
   </p>
       <p>
   
           Nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
               ControlToValidate="txtnome" ErrorMessage="Digite um nome para o Usuário"></asp:RequiredFieldValidator>
       </p>
                                <p>
   
                                    <asp:TextBox ID="txtnome" runat="server" MaxLength="50" Width="400px" 
                                        CssClass="txt"></asp:TextBox>
   
   </p>
       <p>
   
                                    &nbsp;</p>
       <p>
   
                                    Login:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtlogin" ErrorMessage="Digite um login para o Usuário"></asp:RequiredFieldValidator>
   
   </p>
       <p>
   
                                    <asp:TextBox ID="txtlogin" runat="server" MaxLength="50" Width="400px" 
                                        CssClass="txt"></asp:TextBox>
   
   </p>
   <p>
   
                                    E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="txtemail" ErrorMessage="Digite um e-mail para o Usuário"></asp:RequiredFieldValidator>
   
   </p>
       <p>
   
                                    <asp:TextBox ID="txtemail" runat="server" MaxLength="50" Width="400px" 
                                        CssClass="txt"></asp:TextBox>
   
   </p>
       <p>
   
                                    &nbsp;</p>
       <p>
   
                                    Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txtsenha" 
                                        ErrorMessage="Digite uma Senha para o Usuário"></asp:RequiredFieldValidator>
   
       </p>
       <p>
   
                                    <asp:TextBox ID="txtsenha" runat="server" MaxLength="50" TextMode="Password" 
                                        Width="400px" CssClass="txt"></asp:TextBox>
   
   </p>
       <p>
   
                                    &nbsp;</p>
       <p>
   
                                    Confirmar senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtsenha_confirmar" 
                                        ErrorMessage="Confirme a senha digitada acima"></asp:RequiredFieldValidator>
   
       </p>
       <p>
   
                                    <asp:TextBox ID="txtsenha_confirmar" runat="server" MaxLength="50" 
                                        TextMode="Password" Width="400px" CssClass="txt"></asp:TextBox>
   
   </p>
       <p>
   
                                    &nbsp;</p>
       <p>
   
                                    Nível:</p>
       <p>
   
                                    <asp:DropDownList ID="drpnivel" runat="server" Height="21px" Width="122px" 
                                        CssClass="txt">
                                        <asp:ListItem>Administrador</asp:ListItem>
                                        <asp:ListItem>Editor</asp:ListItem>
                                        
                                        <asp:ListItem>Foto bebê</asp:ListItem>
                                        
                                    </asp:DropDownList>
   
   </p>
       <p>
   
                                    &nbsp;</p>
                                <p>
   
                                    &nbsp;</p>
       <br />
       <asp:Button ID="Button1" runat="server" Height="28px" Text="Cadastrar" 
           Width="80px" onclick="Button1_Click" CssClass="txt" />
       <br />
       <br />
       <br />
       <br />
       <input id="Button2" type="button" value="Voltar" onclick="javascript: history.go(-1);" />
</asp:Content>

