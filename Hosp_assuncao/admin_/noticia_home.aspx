<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="noticia_home.aspx.cs" Inherits="admin_noticia_home" Title="Untitled Page" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style1
        {
            color: #666666;
        }
        .style3
        {
            width: 77px;
            height: 29px;
            background-color: #EEEEEE;
        }
        .style5
        {
            width: 77px;
        }
        .style6
        {
            width: 100%;
            height: 138px;
        }
        .style7
        {
            width: 258px;
            background-color: #EEEEEE;
        }
        .style9
        {
            height: 71px;
            background-color: #EEEEEE;
        }
        .style10
        {
            height: 30px;
            background-color: #EEEEEE;
        }
        .style11
        {
            background-color: #F4F4F4;
        }
        .style12
        {
            background-color: #EEEEEE;
        }
        .style13
        {
            height: 24px;
        }
        .style15
        {
            background-color: #F4F4F4;
            height: 29px;
        }
        .style17
        {
            background-color: #F4F4F4;
            height: 72px;
        }
        .style18
        {
            height: 72px;
            background-color: #EEEEEE;
            width: 77px;
        }
        .style23
        {
            background-color: #EEEEEE;
            width: 77px;
        }
        .style24
        {
            height: 24px;
            width: 77px;
        }
        .style25
        {
            height: 30px;
            background-color: #EEEEEE;
            width: 77px;
        }
        .style26
        {
            height: 71px;
            background-color: #EEEEEE;
            width: 77px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>
        &nbsp;</p>
    <h2 class="style1">
        Gerenciar Chamadas de notícias</h2>
    <p>
        &nbsp;</p>
        <table width="602">
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style12">
                <asp:RadioButtonList ID="rdo_img" runat="server" 
                    RepeatDirection="Horizontal" Width="368px" AutoPostBack="True" 
                    onselectedindexchanged="rdo_img_SelectedIndexChanged">
                    <asp:ListItem Value="0">Com Imagem</asp:ListItem>
                    <asp:ListItem Value="1">Sem Imagem</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td  style="background:#eeeeee;" colspan="2">
                <table class="style6" cellspacing="0" <% =exibe_img %>>
                    <tr>
                        <td class="style7">
<span>&nbsp;
        <asp:Image ID="img_chamada" runat="server" Width="244" Height="123" /></span>
                        </td>
                        <td class="style12" valign="top">
                            <br />
                            Mudar Imagem:<br />
    <asp:FileUpload ID="fup_imagem" runat="server" CssClass="txt" Width="243px" />
                            <br />
                            <br />
        <asp:Label ID="lblmsg" runat="server" Text="" style="color: #CC0000"></asp:Label>
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
</table>


    <table style="width: 603px" >
        
        <tr>
            <td class="style3" valign="top">
                Titulo 1:</td>
            <td class="style15" valign="top">
                <span class="style12">
        <asp:TextBox ID="txt_titulo1" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </span>
            </td>
        </tr>
        <tr>
            <td class="style18" valign="top">
                Resumo 1:</td>
            <td class="style17" valign="top">
                <span class="style12">
        <asp:TextBox ID="txt_resumo1" runat="server" CssClass="txt" Width="400px" 
            Height="65px" TextMode="MultiLine"></asp:TextBox></span>
            </td>
        </tr>
        </table>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <table>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style11">
                <asp:RadioButtonList ID="rdo_tipo1" runat="server" Height="24px" 
                    RepeatDirection="Horizontal" Width="526px" AutoPostBack="True" 
                    onselectedindexchanged="rdo_tipo1_SelectedIndexChanged">
                    <asp:ListItem Value="1">Página do Site</asp:ListItem>
                    <asp:ListItem Value="2">URL Outro site</asp:ListItem>
                    <asp:ListItem Value="3">Nova Página</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr >
            <td class="style3">
                <asp:Label ID="lbl_link1" runat="server" Text="Link 1:"></asp:Label>
            </td>
            <td class="style15">
                <span class="style12">
    <asp:TextBox ID="txt_url1" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </span>
            </td>
        </tr>
        <tr >
            <td style="background:#eeeeee;" valign="top">
                <asp:Label ID="lblcont1" runat="server" Text="Conetudo 1:"></asp:Label></td>
            <td style="background:#eeeeee;"  valign="top">
        <FCKeditorV2:FCKeditor ID="FCK1" runat="server" BasePath="../fckeditor/" 
                    Height="300px" SkinPath="skins/silver/" Width="500px">
        </FCKeditorV2:FCKeditor>
            </td>
        </tr>
        
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>
        
        <table <% =exibe_chamada2 %>>
        <tr>
            <td class="style24">
                </td>
            <td class="style13">
                </td>
        </tr>
        <tr>
            <td class="style25">
                Titulo 2:</td>
            <td class="style10">
        <asp:TextBox ID="txt_titulo2" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style26" valign="top">
                Resumo 2:</td>
            <td class="style9" valign="top">
        <asp:TextBox ID="txt_resumo2" runat="server" CssClass="txt" Width="400px" 
            Height="65px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        </table>
        
        
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    
    
        <table  <% =exibe_chamada2 %>>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style12">
                <asp:RadioButtonList ID="rdo_tipo2" runat="server" Height="24px" 
                    RepeatDirection="Horizontal" Width="526px" AutoPostBack="True" 
                    onselectedindexchanged="rdo_tipo2_SelectedIndexChanged">
                    <asp:ListItem Value="1">Página do Site</asp:ListItem>
                    <asp:ListItem Value="2">URL Outro site</asp:ListItem>
                    <asp:ListItem Value="3">Nova Página</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr >
            <td class="style25">
                <asp:Label ID="lbl_link2" runat="server" Text="Link 2:"></asp:Label>
            </td>
            <td class="style10">
    <asp:TextBox ID="txt_url2" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td  valign="top" style="background:#EEEEEE;">
                <asp:Label ID="lblcont2" runat="server" Text="Conetudo 2:"></asp:Label>
            </td>
            <td  valign="top"  style="background:#EEEEEE;">
        <FCKeditorV2:FCKeditor ID="FCK2" runat="server" BasePath="../fckeditor/" 
                    Height="300px" SkinPath="skins/silver/" Width="500px">
        </FCKeditorV2:FCKeditor>
            </td>
        </tr>
        </table>
        </ContentTemplate>
    </asp:UpdatePanel>
        <table style="width: 604px">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                <span>
        <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/admin/images/btn_gravar_e_ativar.jpg" onclick="ImageButton1_Click" />
                </span>
            </td>
        </tr>
    </table>
</asp:Content>

