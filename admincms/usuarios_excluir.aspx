<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="usuarios_excluir.aspx.cs" Inherits="admincms_usuarios_editar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Portal Rede D'or > Usuários Área Restrita > <asp:Label ID="lbl_usuario" runat="server" Text=""></asp:Label> > Excluir
<h2>Dados do Usuário</h2>
<p></p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
    
            Você tem certeza que deseja excluir este usuário?<p>
    
            <asp:Label ID="lbl_usuer" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label> 
    <p>
    
            &nbsp;<p>
    
    <asp:Button ID="btn_gravar" runat="server" BackColor="#666666" Font-Bold="True" ForeColor="White" Height="25px" onclick="btn_gravar_Click" Text="Excluir" ValidationGroup="Usuario" Width="95px" />
                    <p>
                        &nbsp;<p>
                        &nbsp;<p>
                        &nbsp;<p>
                        <br />
    <input id="btn_voltar" type="button" value="&laquo; Voltar" onclick="history.back();" class="btn" /><br />
</asp:Content>

