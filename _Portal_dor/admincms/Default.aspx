<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admincms_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

