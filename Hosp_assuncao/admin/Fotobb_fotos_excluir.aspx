<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Fotobb_fotos_excluir.aspx.cs" Inherits="admin_Fotobb_texto" Title="Untitled Page" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 589px;
            height: 150px;
        }
        .style6
        {
            height: 48px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<p>
        &nbsp;</p>
    <h2 >
        Excluir Fotos De Bebê</h2>
    <p>
        &nbsp;</p>
                                    <p>
    <br />
                                    </p>
        <table cellpadding="0" cellspacing="1" class="style1">
            <tr>
                <td class="style6">
                    <br />
                    Você tem certeza que deseja excluir as fotos da senha abaixo?<br />
                    <br />
                    <asp:Label ID="lbl_codigo" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                <asp:ImageButton ID="ImageButton2" runat="server" 
            ImageUrl="~/admin/images/btn_excluir.jpg" onclick="ImageButton2_Click" /></td>
            </tr>
            </table>

<br />
<br />
        <br /><br /><br />
</div>
</asp:Content>

