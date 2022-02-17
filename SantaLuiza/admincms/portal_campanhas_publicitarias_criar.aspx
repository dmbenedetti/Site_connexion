<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_campanhas_publicitarias_criar.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > o Grupo &gt; Campanhas Publicitárias 
        &gt;Nova Campanha</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Nova Campanha Publicitária<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
        <br />
        <b>Título&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_titulo" ErrorMessage="Digite um titulo para página" ForeColor="Red" ValidationGroup="grupo">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Resumo </b>
    </p>
    <p>
        <asp:TextBox ID="txt_resumo" runat="server" CssClass="txt" MaxLength="200" 
            Width="600px" Height="44px" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Data </b>
    </p>
    <p>
        <asp:TextBox ID="txt_data" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
        <asp:CalendarExtender ID="txt_data_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="txt_data">
        </asp:CalendarExtender>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <strong>Imagem destaque (L:85px - A:80px)</strong></p>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt" />
    </p>
<!-- Fim Div formulario_pag-->
    <p>
        &nbsp;</p>
    <!-- Div Conteudo_pag-->
    <div id="conteudo_pag">
        <p>
            <b>Conteúdo</b></p>
        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../fckeditor/" 
            Height="600px" SkinPath="skins/silver/" Width="900px"></FCKeditorV2:FCKeditor>
    </div>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
    
<p>&nbsp;</p>
</asp:Content>

