<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="galeria_editar_foto.aspx.cs" Inherits="admin_galeria_excluir_foto" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>
        &nbsp;</p>
    <h2 class="style1">
        Editar Foto</h2>
    <p></p><p><br /></p>
    <table cellpadding="0" cellspacing="0" style="width: 600px">
            <tr>
                <td align="left" class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Image ID="img" runat="server" Height="113px" Width="150px" /><br />
                    Mudar Imagem:<br />
    <asp:FileUpload ID="fupfoto" runat="server" CssClass="txt" Width="243px" />
                    <br />
                    Título:<br />
                    <asp:TextBox ID="txt_titulo" runat="server" Width="391px" CssClass="txt"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <br />
                    <asp:Label ID="lblmsg" runat="server" style="color: #FF0000"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Button3" runat="server" Height="27px" onclick="Button3_Click" 
                        Text="Gravar" Width="70px" CssClass="txt" />
                    <br />
                </td>
            </tr>
        </table>
    
</asp:Content>

