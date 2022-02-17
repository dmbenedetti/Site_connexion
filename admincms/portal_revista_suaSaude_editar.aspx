<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_revista_suaSaude_editar.aspx.cs" Inherits="admincms_ogrupo" %>

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
    <p><strong>Portal Rede D'or > Publicações e Campanhas > Revista Sua Saúde&nbsp; &gt; Editar Edição > <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </strong>
        
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Editar Edição</h2>
    <p>&nbsp;</p>
    <p>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </p>
<p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="suaSaude" />
    <p>
    <asp:Label ID="lbl_erro" runat="server" ForeColor="Red"></asp:Label>
    <p>
    <asp:Label ID="lbl_erro2" runat="server" ForeColor="Red"></asp:Label>
    <p>
        <b>Nº da Edição&nbsp; 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_nrEdicao" ErrorMessage="Digite o nº da Edição" ForeColor="Red" ValidationGroup="suaSaude">*</asp:RequiredFieldValidator>
        </b>
    </p>
    <p>
        <asp:TextBox ID="txt_nrEdicao" runat="server" CssClass="txt"  onkeypress="return txtBoxFormat(this, '9', event);"  onclick="this.value='';" MaxLength="3" Width="100px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Data: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_data" ErrorMessage="Digite a data da Edição" ForeColor="Red" ValidationGroup="suaSaude">*</asp:RequiredFieldValidator>
        </b>
    </p>
    <p>
        <asp:TextBox ID="txt_data" runat="server" CssClass="txt" MaxLength="200" Width="182px"></asp:TextBox>
        <asp:CalendarExtender ID="txt_data_CalendarExtender" runat="server" Enabled="True" TargetControlID="txt_data">
        </asp:CalendarExtender>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <strong>Destaque</strong>:</p>
    <p>
        <asp:TextBox ID="txt_destaque" runat="server" CssClass="txt" Width="987px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <strong>Descrição</strong>:</p>
    <p>
        <asp:TextBox ID="txt_ds" runat="server" CssClass="txt" Height="79px" TextMode="MultiLine" Width="987px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <div style="border:solid 1px #ccc;padding:5px;">
    <p>
        <b>Arquivo PDF Atual:</b>
        <asp:Label ID="lbl_arquivo" runat="server"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Alterar PDF: 
        </b>
    </p>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt" />
    </p>
    </div>
    <p>
        &nbsp;</p>
    <p>
    <div style="border:solid 1px #ccc;padding:5px;">
        <b>Imagem da Capa Atual:</b> </p>
    <p>
        <asp:Image ID="Image1" runat="server" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Alterar Imagem:
        </b>
    </p>
    <p>
        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="txt" />
    </p>
    </div>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="35px" Text="Gravar" OnClick="Button1_Click" 
            ValidationGroup="suaSaude" Width="113px" />
    </p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

