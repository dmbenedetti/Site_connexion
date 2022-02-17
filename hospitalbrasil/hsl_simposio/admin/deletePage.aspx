<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="deletePage.aspx.cs" Inherits="admin_deletePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Excluir Página :<asp:Label ID="lblPagina" runat="server" Text=""></asp:Label></h2>
    <p>
        <br />
    </p>
    <p>Você tem certeza que deseja excluir esta página?
    <br />
    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="Medium" 
            ForeColor="Red"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnDelete" runat="server" Text="Excluir" CssClass="txt" 
            Height="27px" Width="82px" onclick="btnDelete_Click" /></p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <input id="Button1" class="txt" type="button" value="&laquo; Voltar" onclick="javascript: history.go(-1)" /><br />
    </p>
</asp:Content>

