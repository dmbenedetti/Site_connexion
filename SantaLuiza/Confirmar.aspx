<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmar.aspx.cs" Inherits="Confirmar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p> <br /><br /></p>
    <p>Sua mensagem foi enviada com sucesso a área responsável por agendamentos.    </p>
    <p><a href="<%= System.Configuration.ConfigurationManager.AppSettings["form"] %>">Clique aqui</a> para voltar ao formulário. </p>
    <p><br /><br /></p>

</asp:Content>

