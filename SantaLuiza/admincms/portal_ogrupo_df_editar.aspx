<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_ogrupo_df_editar.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > O Grupo > Demostrativo Financeiro > Editar </strong>
        
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Editar Demostrativo Financeiro<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
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
        <strong>Arquivo PDF</strong></p>
    <p>
        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="txt" />
    </p>
     <p>
        Arquivo Atual:</p>
    <p>
        <asp:HyperLink NavigateUrl="~/pdf/df/" runat="server" ID="filepdf"></asp:HyperLink>
    </p>
    <p>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Excluir este arquivo</asp:LinkButton>
    </p>
<!-- Fim Div formulario_pag-->
    <p>
        &nbsp;</p>
    <!-- Div Conteudo_pag-->
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
<p>&nbsp;</p>
</asp:Content>

