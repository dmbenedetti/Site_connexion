<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="confirmacao.aspx.cs" Inherits="confirmacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            text-align: center;
            font-size: 14px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div id="titulo_pag">
        <h2>Confirmação de envio</h2>    
    </div>

<br />
<div id="textos" class="style1">
    <span style="font-size:14px">Sua mensagem foi enviada com sucesso a área responsável por agendamentos.<br /></span>
    <br />
    <span style="font-size:14px">Você deseja gravar o formulário preenchido em seu computador?
    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">CLIQUE AQUI. </asp:LinkButton></span>
    <br />
    <br />
    <span style="font-size:14px">Se não deseja salvar o arquivo,
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">CLIQUE AQUI</asp:LinkButton></span>
&nbsp;para voltar ao formulário
</div>
</asp:Content>

