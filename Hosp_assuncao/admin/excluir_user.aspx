<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="excluir_user.aspx.cs" Inherits="admin_excluir_user" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Gerenciar Usuários - Excluir</h2>
   <p>&nbsp;</p>
       <p>
   
   </p>
       <p>
   
           Tem certeza que deseja excluir este usuário?</p>
                                <p>
   
                                    &nbsp;</p>
       <p>
   
                                    <asp:Label ID="lbldados_user" runat="server"></asp:Label>
   
   </p>
       <br />
       <asp:Button ID="Button1" runat="server" Height="28px" Text="Excluir" 
           Width="63px" onclick="Button1_Click" />
       <br />
       <br />
       <br />
       <br />
       <input id="Button2" type="button" value="Voltar" onclick="javascript: history.go(-1);" />
</asp:Content>

