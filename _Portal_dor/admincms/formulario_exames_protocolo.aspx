<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formulario_exames_protocolo.aspx.cs" Inherits="admincms_formulario_exames_protocolo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%; ">
            <tr>
                <td><img src="images/logoRedeDor.jpg"></td>
                <td>Protocolo de Retirada de Exames</td>
          </tr>
            <tr>
                <td>Protocolo:</td>
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
                <td><asp:Literal ID="ltlDataNascimento" runat="server"></asp:Literal></td>
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
        </table>    
        <p> Este Protocolo deverá ser apresentado no momento da retirada do exame</p>
        <p>O prazo de entrega previsto é de 3 dias após a solicitação.</p>
    </div>
    </form>
</body>
</html>
