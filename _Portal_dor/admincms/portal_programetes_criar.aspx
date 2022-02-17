<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_programetes_criar.aspx.cs" Inherits="admincms_ogrupo" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Espaço Saúde > Programetes da Discovery &gt; Novo Vídeo</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Novo Vídeo</h2>
<p>
    &nbsp;<asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" 
        ValidationGroup="saude" />
    <p>
    <asp:Label ID="lbl_erro0" runat="server" ForeColor="Red"></asp:Label>
    
        <table class="style2">
            <tr>
                <td class="style3" height="30">
                    Titulo:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Digite o título do vídeo" 
                        ForeColor="Red" ValidationGroup="saude">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3" height="30">
                    Vídeo:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Digite o embed do video" 
                        ForeColor="Red" ValidationGroup="saude">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" Width="400px" 
                        Height="130px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3" height="30">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#666666" ForeColor="White" 
                        Height="24px" onclick="Button1_Click1" Text="Gravar" ValidationGroup="saude" 
                        Width="80px" />
                </td>
            </tr>
</table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
    
        <asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="30px" PostBackUrl="portal_espaco_saude.aspx" 
            Text="Voltar" Width="77px" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

