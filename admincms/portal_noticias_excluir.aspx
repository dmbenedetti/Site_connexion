<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_noticias_excluir.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D&#39;or &gt; Imprensa &gt; Notícias &gt; Excluir &gt; <asp:Label ID="lbl_noticia" runat="server" Text=""></asp:Label></strong>
        
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Excluir Notícia<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
        <br />
        <b>Você tem certeza que deseja excluir esta notícia?</b></p>
    <p>
        <asp:Label ID="lbl_titulo" runat="server"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        Excluir esta notícia em todos os hospitais abaixo?<asp:RadioButtonList 
            ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="129px">
            <asp:ListItem>sim</asp:ListItem>
            <asp:ListItem>não</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <asp:CheckBox ID="chkAll" Text="Todos" runat="server" />
    <asp:CheckBoxList ID="chb_hospitais" runat="server">
    </asp:CheckBoxList>
    <br />
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Excluir" 
            Width="148px" ValidationGroup="grupo" />
    </p>
<p>&nbsp;</p>
</asp:Content>

