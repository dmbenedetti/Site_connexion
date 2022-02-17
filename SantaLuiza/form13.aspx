<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form13.aspx.cs" Inherits="form13" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
    <style>
        #contato {
            background: url(images/btn_contato_hover.jpg);
        }

        #table_contato {
            width: 400px;
        }

        .celula_table {
            height: 30px;
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
        }

        .celula_table2 {
            height: 40px;
            width: 300px;
            text-align: left;
        }

        .text_field {
            border: solid 1px #849E9F;
            height: 23px;
        }

        .style1 {
            height: 40px;
            width: 289px;
            text-align: left;
        }

        .style2 {
            width: 289px;
        }
    </style>
    <script src="js/jquery.mask.js"></script>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        //MÁSCARA DE VALORES

        function Change(a) {
            if (a.value == "Outros") {
                $("#trOutro").show();
                ValidatorEnable(document.getElementById("ContentPlaceHolder1_RequiredFieldValidator14"), true);
            }
            else {
                $("#trOutro").hide();
                ValidatorEnable(document.getElementById("ContentPlaceHolder1_RequiredFieldValidator14"), false);
            }
        }



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
        // onkeypress="return txtBoxFormat(this, '999.999.999/9999-99', event);"  onclick="this.value='';" MaxLength="19"
    </script>
    <style>
        .celula_table {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
        }

        .text_field {
            border: solid 1px #849E9F;
            height: 23px;
        }

        .txt {
            border: solid 1px #ccc;
        }

        .style1 {
            width: 100%;
        }

        .style2 {
        }

        .style3 {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            height: 24px;
        }

        .style4 {
            font: normal normal normal 14px normal Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            width: 254px;
        }

        .style6 {
            font: normal normal bold 14px normal Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            height: 24px;
        }

        .style8 {
            font: normal normal bold 14px normal Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
        }

        .style9 {
        }

        .style10 {
            width: 224px;
        }

        .style11 {
            font-size: 16px;
        }

        .style12 {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            width: 254px;
        }

        .style13 {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            height: 24px;
            width: 254px;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

      <script>
          $(function () {
              $("#ContentPlaceHolder1_txtDataNascimento").datepicker({
                  changeMonth: true,
                  changeYear: true,
                  yearRange: "-50:+0"
              })
          });
          $(function () {
              $("#ContentPlaceHolder1_txtDataParto").datepicker({
                  changeMonth: true,
                  changeYear: true,
                  yearRange: "-0:+1"
              })
          });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="titulo_pag">
        <h2>
            <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
    </div>

    <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">Nome completo:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNome"
                ErrorMessage="Preencha o Nome completo.">*</asp:RequiredFieldValidator></td>
            <td width="400" class="celula_table" height="24" align="left" valign="top">
                <asp:TextBox ID="txtNome" runat="server" CssClass="txt" Height="18px" Width="300px"
                    MaxLength="300"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">Data Nascimento:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDataNascimento"
                ErrorMessage="Preencha a data de nascimento.">*</asp:RequiredFieldValidator>
            </td>
            <td width="400" class="celula_table" height="24" align="left" valign="top">
                <asp:TextBox ID="txtDataNascimento" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">CPF:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCPF"
                ErrorMessage="Preencha o CPF.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txtCPF" runat="server" CssClass="txt" Height="18px" Width="300px"
                    onkeypress="return txtBoxFormat(this, '999.999.999-99', event);"
                    onclick="this.value='';" MaxLength="14"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">Idade:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtIdade"
                ErrorMessage="Preencha a Idade.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txtIdade" runat="server" CssClass="txt" Height="18px" Width="80px"
                    onkeypress="return txtBoxFormat(this, '99', event);"
                    onclick="this.value='';" MaxLength="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">Endereço:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEndereco"
                ErrorMessage="Preencha o Endereço.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtEndereco" runat="server" CssClass="txt" Height="18px" Width="300px"
                    MaxLength="300"></asp:TextBox>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">E-mail:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Preencha o e-mail" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="E-mail inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" Height="18px" Width="300px"
                    MaxLength="300"></asp:TextBox>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">Telefone:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTelContato"
                ErrorMessage="Preencha o telefone.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtTelContato" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">Idade Gestacional:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtIdadeGestacional"
                ErrorMessage="Preencha a Idade Gestacional.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txtIdadeGestacional" runat="server" CssClass="txt" Height="18px" Width="80px"
                    onkeypress="return txtBoxFormat(this, '99', event);"
                    onclick="this.value='';" MaxLength="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">Data provável do parto:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDataNascimento"
                ErrorMessage="Preencha a data provavel do parto.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtDataParto" onkeypress="return txtBoxFormat(this, '99/99/9999', event);" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="true" TargetControlID="txtDataParto"></asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">Nome do Obstetra:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNomeObstetra"
                ErrorMessage="Digite o nome do Obstetra.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtNomeObstetra" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">Como ficou sabendo do curso?:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator10" runat="server" ControlToValidate="drpTempoGestacao"
                ErrorMessage="Selecione como ficou sabendo do curso.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:DropDownList ID="drpTempoGestacao" onchange="Change(this)" runat="server" CssClass="txt">
                    <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                    <asp:ListItem Text="Google" Value="Google"></asp:ListItem>
                    <asp:ListItem Text="Redes Sociais" Value="Redes Sociais"></asp:ListItem>
                    <asp:ListItem Text="Site do Hospital" Value="Site do Hospital"></asp:ListItem>
                    <asp:ListItem Text="Indicação do médico" Value="Indicação do médico"></asp:ListItem>
                    <asp:ListItem Text="Indicação de amigos" Value="Indicação de amigos"></asp:ListItem>
                    <asp:ListItem Text="Outros" Value="Outros"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="trOutro" style="display: none;">
            <td height="24" class="style12" align="left" valign="top" class="style3">Outro:*<asp:RequiredFieldValidator
                ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtOutro"
                ErrorMessage="Informe como ficou sabendo do curso.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtOutro" runat="server" Width="300px"
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                * Campos obrigatórios<br />
                <br />
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_enviar.png" 
        onclick="ImageButton1_Click" />
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3" style="color: red;">

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
    </table>

<script>
          ValidatorEnable(document.getElementById("ContentPlaceHolder1_RequiredFieldValidator14"), false);
</script>

</asp:Content>


