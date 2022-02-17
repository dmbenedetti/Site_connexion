<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formulario_exames_protocolo.aspx.cs" Inherits="admincms_formulario_exames_protocolo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title><asp:Literal ID="ltlTitle" runat="server"></asp:Literal></title>
    <link rel='stylesheet' type='text/css' href='css/commom.css' />
    <style>
        table tr td {
            padding-top: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%; ">
            <tr>
                <td><div id="logo" style="cursor: pointer;" onclick="location.href='default.aspx'" <%= logo%>>
                <asp:Image ImageUrl="images/transp.gif" runat="server" ID="imgLogo" />
            </div></td>
                <td>Protocolo Exame de Imagens e Analises Clínica</td>
            </tr>
            <tr><td colspan="2" style="height:30px;"></td></tr>
            <tr>
                <td>Protoco:</td>
                <td><asp:Literal ID="ltlProtocolo" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Data da Solicitação:</td>
                <td>
                    <asp:Literal ID="ltlDataSolicitacao" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Nome:</td>
                <td><asp:Literal ID="ltlNome" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Data de Nascimento:</td>
                <td><asp:Literal ID="ltlNascimento" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Data do Exame:</td>
                <td><asp:Literal ID="ltlDataExame" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Tipo Atendimento:</td>
                <td><asp:Literal ID="ltlTipoAtendimento" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Telefone fixo:</td>
                <td><asp:Literal ID="ltlTelefone" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Celular:</td>
                <td><asp:Literal ID="ltlCelular" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td>Observação:</td>
                <td><asp:Literal ID="ltlObs" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2" style="height:30px;"></td>
            </tr>
            <tr><td colspan="2" style="text-align:center"><asp:Image ID="btnImprimir" runat="server" onclick="window.print();"  ImageUrl="images/btn_imprimir.png" /></td></tr>
        </table>    
    </div>
    </form>
    <script type="text/javascript">
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', '<%= GA_Cod %>', '<%= GA_dom %>');
    ga('send', 'pageview');

        </script>
</body>
</html>
