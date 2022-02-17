<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="newPage.aspx.cs" Inherits="admin_newPage" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Criar Página</h2>
    <p>
        <br />
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
        ValidationGroup="pagina" />
    <p>Titulo:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtTitulo" ErrorMessage="Preencha o campo Título" 
            ForeColor="Red" ValidationGroup="pagina"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txtTitulo" runat="server" CssClass="txt" Width="400px" 
            MaxLength="60"></asp:TextBox>
    </p>
    <p>
        Resumo:</p>
    <p>
        <asp:TextBox ID="txtResumo" runat="server" CssClass="txt" Width="800px" 
            MaxLength="60"></asp:TextBox>
    </p>
    <p>Ícone:</p>
    <p>
        <asp:RadioButtonList ID="rblIcones" runat="server" RepeatDirection="Horizontal" 
            Width="487px">
            <asp:ListItem Selected="True" Value="1">&lt;img src=&quot;../images/ico_red.gif&quot;&gt;</asp:ListItem>
            <asp:ListItem Value="2">&lt;img src=&quot;../images/ico_blue.gif&quot;&gt;</asp:ListItem>
            <asp:ListItem Value="3">&lt;img src=&quot;../images/ico_yellow.gif&quot;&gt;</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p>Conteudo</p>
    <p></p>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../fckeditor/" 
        Height="600px" ToolbarSet="BugTracker" Width="900px">
    </FCKeditorV2:FCKeditor>
    <p>
        <asp:Button ID="btnGravar" runat="server" CssClass="txt" Height="26px" 
            onclick="Button1_Click" Text="Gravar" Width="63px" 
            ValidationGroup="pagina" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <input id="Button1" class="txt" type="button" value="&laquo; Voltar" onclick="javascript: history.go(-1)" /><br />
    </p>
</asp:Content>

