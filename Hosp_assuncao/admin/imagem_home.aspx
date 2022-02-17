<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="imagem_home.aspx.cs" Inherits="admin_imagem_home" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style1
        {
            color: #666666;
        }
        .style2
        {
            color: #999999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>&nbsp;</p>
<h2 class="style1">Editar Imagem Destaque do Portal</h2>
<p>
Link da chamada:<br />
<asp:TextBox ID="txt_link" runat="server" CssClass="txt" width="300px"></asp:TextBox>
</p>
<p>Imagem Chamada:</p>
<p><asp:Image ID="Image1" runat="server" Height="126px" Width="500px" />
<br />
<span class="style2"><i>Tamanho da imagem: 985px de largura por 248px de altura</i><br /></span> 
Mudar imagem:<br />
<asp:FileUpload ID="FileUpload1" runat="server" Width="244px" CssClass="txt" />
</p>
    <p>&nbsp;</p>
    <p>
        <asp:ImageButton ID="ImageButton2" runat="server" 
            ImageUrl="~/admin/images/btn_gravar.jpg" onclick="ImageButton2_Click" />
</p>
    <p>&nbsp;</p>

</asp:Content>