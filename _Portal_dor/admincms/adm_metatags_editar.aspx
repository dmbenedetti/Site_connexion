<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="adm_metatags_editar.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D&#39;or &gt; Meta Tags &gt; Editar </strong>
        
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Editar Meta Tags<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
    </p>
    <p>Titulo da Página</p>
    <p>
        <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Descrição </b>
    </p>
    <p>
        <asp:TextBox ID="txt_descricao" runat="server" CssClass="txt" MaxLength="2000" 
            Width="600px" Height="44px" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_descricao" Display="Dynamic" 
            ErrorMessage="Descrição obrigatória" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>KeyWords </b>
    </p>
    <p>
        <asp:TextBox ID="txt_keywords" runat="server" CssClass="txt" MaxLength="2000" 
            Width="600px" Height="44px" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txt_keywords" Display="Dynamic" 
            ErrorMessage="KeyWords obrigatória" Font-Bold="False" ForeColor="Red">*</asp:RequiredFieldValidator>
    </p>
    <p>
        &nbsp;</p>
    <p>
    <!-- Div Conteudo_pag-->
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
<p>&nbsp;</p>
</asp:Content>

