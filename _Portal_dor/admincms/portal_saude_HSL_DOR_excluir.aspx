<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_saude_HSL_DOR_excluir.aspx.cs" Inherits="admincms_ogrupo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" language="javascript">
        //MÁSCARA DE VALORES

        function txtBoxFormat(objeto, sMask, evtKeyPress) {
            var i, nCount, sValue, fldLen, mskLen, bolMask, sCod, nTecla;


            if (document.all) { // Internet Explorer
                nTecla = evtKeyPress.keyCode;
            } else if (document.layers) { // Nestcape
                nTecla = evtKeyPress.which;
            } else {
                nTecla = evtKeyPress.which;
                if (nTecla == 8) {
                    return true;
                }
            }

            sValue = objeto.value;

            // Limpa todos os caracteres de formatação que
            // já estiverem no campo.
            sValue = sValue.toString().replace("-", "");
            sValue = sValue.toString().replace("-", "");
            sValue = sValue.toString().replace(".", "");
            sValue = sValue.toString().replace(".", "");
            sValue = sValue.toString().replace("/", "");
            sValue = sValue.toString().replace("/", "");
            sValue = sValue.toString().replace(":", "");
            sValue = sValue.toString().replace(":", "");
            sValue = sValue.toString().replace("(", "");
            sValue = sValue.toString().replace("(", "");
            sValue = sValue.toString().replace(")", "");
            sValue = sValue.toString().replace(")", "");
            sValue = sValue.toString().replace(" ", "");
            sValue = sValue.toString().replace(" ", "");
            fldLen = sValue.length;
            mskLen = sMask.length;

            i = 0;
            nCount = 0;
            sCod = "";
            mskLen = fldLen;

            while (i <= mskLen) {
                bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/") || (sMask.charAt(i) == ":"))
                bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))

                if (bolMask) {
                    sCod += sMask.charAt(i);
                    mskLen++;
                }
                else {
                    sCod += sValue.charAt(nCount);
                    nCount++;
                }

                i++;
            }

            objeto.value = sCod;

            if (nTecla != 8) { // backspace
                if (sMask.charAt(i - 1) == "9") { // apenas números...
                    return ((nTecla > 47) && (nTecla < 58));
                }
                else { // qualquer caracter...
                    return true;
                }
            }
            else {
                return true;
            }
        }
        // onkeypress="return txtBoxFormat(this, '9', event);"  onclick="this.value='';" MaxLength="3"
</script>
<style type="text/css">
    .style2
    {
        width: 500px;
    }
    .style3
    {
    }
    .style4
    {
        width: 98px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Espaço Saúde > Saúde com os 
        Hospitais Rede D’Or São Luiz &gt; Excluir Audio</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Excluir Áudio</h2>
    <p>&nbsp;</p>
    <p>
    <asp:Label ID="lbl_erro" runat="server" ForeColor="Red"></asp:Label>
    
        <br />
    
        <table class="style2">
            <tr>
                <td class="style3" height="30" colspan="2">
                    Deseja realmente excluir este audio?</td>
            </tr>
            <tr>
                <td class="style4" height="30">
                    Titulo:
                    </td>
                <td>
                    <asp:Label ID="lbl_titulo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4" height="30">
                    Tema:</td>
                <td>
                    <asp:Label ID="lbl_tema" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4" height="30">
                    Especialista</td>
                <td>
                    <asp:Label ID="lbl_especialista" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4" height="30">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#666666" ForeColor="White" 
                        Height="24px" onclick="Button1_Click1" Text="Excluir" ValidationGroup="saude" 
                        Width="80px" />
                </td>
            </tr>
</table>
    <p>&nbsp;</p>
    <p>
    
        <asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="30px" PostBackUrl="portal_saude_HSL_DOR.aspx" 
            Text="Voltar" Width="77px" />
    </p>
</asp:Content>

