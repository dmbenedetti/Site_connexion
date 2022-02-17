<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="galeria_excluir_foto.aspx.cs" Inherits="admin_galeria_excluir_foto" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>
        &nbsp;</p>
    <h2 class="style1">
        Excluir Foto</h2>
    <p></p><p><br /></p>
    <table cellpadding="0" cellspacing="0" style="width: 600px">
            <tr>
                <td align="left" class="style4">
                    Tem certeza que deseja excluir esta Foto?&nbsp;&nbsp;&nbsp;
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Image ID="img" runat="server" Height="113px" Width="150px" />
                    <br />
                    <asp:Label ID="lblid_prod" runat="server" Visible="False"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button3" runat="server" Height="27px" onclick="Button3_Click" 
                        Text="Excluir" Width="70px" CssClass="txt" />
                    <br />
                </td>
            </tr>
        </table>
    
</asp:Content>

