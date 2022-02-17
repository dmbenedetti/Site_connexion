<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form6.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Assunção S/A" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
#contato{
background:url(images/btn_contato_hover.jpg);}
#table_contato{
width:600px;}
.celula_table{
height:30px;
font:12px Tahoma, Arial, Helvetica, sans-serif;
color:#666;
text-align:right;
width:388px;
    }
.celula_table2{
height:40px;
width:300px;
text-align:left;
}
.text_field{
border:solid 1px #849E9F;
}
    .style1
    {
        height: 40px;
        width: 289px;
        text-align: left;
    }
    .style2
    {
        width: 289px;
    }


#Content2 body div #dvMsg p {
	font-family: Verdana, Geneva, sans-serif;
}
.large {
	font-size: x-large;
}
.medium {
	font-size: medium;
	font-family: Arial, Helvetica, sans-serif;
}
</style>
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
        // onkeypress="return txtBoxFormat(this, '999.999.999/9999-99', event);"  onclick="this.value='';" MaxLength="19"
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
  </div>
            <div style="font:Tahoma, arial, verdana; color:#666666;">
<div id="dvMsg" runat="server" visible="false" style="width: 600px; margin-left: calc((100% - 600px)/2); font-size: medium; font-style: italic;">
    <div><em>Sua mensagem foi enviada com sucesso à nossa equipe. Obrigada pelo contato.</em><br />
    </div>
    <div><em><br />
    </em></div>
    <div><em>Seu exame estará disponível para ser retirado em 2 (dois) dias úteis a partir desta data, no endereço </em><strong><em>Av. Álvaro Guimarães, 3033, Assunção, São Bernardo do Campo (SP)</em></strong><em>.</em><br />
    </div>
    <div><em><br />
    </em></div>
    <div><em>Horários de Entrega de Resultados do Hospital Assunção: de 2ª a 6ª, das 7h </em><em>às 19h</em><em>, e aos sábados, das 8h às </em><em>12h.</em></div>
    <p class="large">&nbsp;</p>
</div>
<table id="table_contato" align=center runat="server">
<tr>
<td class="celula_table" valign=top align="left" colspan="2">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </td>
</tr>
<tr>
<td width="100" class="celula_table" valign=top>Nome completo do paciente (sem abreviatura):*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome" 
        ErrorMessage="Preencha o campo nome.">*</asp:RequiredFieldValidator>
        </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtnome" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<td class="celula_table" valign=top>Data de Nascimento  *:  <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNascimento" 
        ErrorMessage="Preencha a data de nascimento.">*</asp:RequiredFieldValidator>
    </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtNascimento" onkeypress="return txtBoxFormat(this, '99/99/9999', event);" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<td width="100" class="celula_table" valign=top>R.G.:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnome" 
        ErrorMessage="Preencha o campo R.G.">*</asp:RequiredFieldValidator>
        </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtRG" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<td class="celula_table" valign=top>Telefone para contato *  <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttelefone" 
        ErrorMessage="Preencha o campo telefone">*</asp:RequiredFieldValidator>
        </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txttelefone" runat="server" Width="300px" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999', event));" 
        CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<td class="celula_table" valign=top>Data do atendimento/realização do exame:
    </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtDataExame" onkeypress="return txtBoxFormat(this, '99/99/9999', event);" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<td class="celula_table" valign=top>Exame solicitado:</td>
<td class="style1" valign=top>
    <asp:ListBox ID="ltsExame" CssClass="text_field" Width="300px" runat="server" Height="65px"  SelectionMode="Multiple">
        <asp:ListItem Text="Raios-X" Value="Raios-X"></asp:ListItem>
        <%--<asp:ListItem Text="Ressonância Magnética" Value="Ressonância Magnética"></asp:ListItem>--%>
        <asp:ListItem Text="Tomografia Computadorizada" Value="Tomografia Computadorizada"></asp:ListItem>
        <asp:ListItem Text="Ultrassonografia" Value="Ultrassonografia"></asp:ListItem>
    </asp:ListBox>
    Para solicitar mais de um exame, segure a tecla Ctrl e clique sobre os exames que deseja
        <br />
        <br /></td>
</tr>
<tr>
<td class="celula_table" valign=top>Número do Atendimento / Prescrição</td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtNumero" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<td class="celula_table" valign=top>Email:
        </td>
<td class="style1" valign=top>
    <asp:TextBox ID="txtemail" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<%--<!--<td class="celula_table" valign=top>Observações:
        </td>
<td rowspan="2" class="style1" valign=top>
    <asp:TextBox ID="txtmensagem" runat="server" Height="130px" TextMode="MultiLine" 
        Width="300px" CssClass="text_field"></asp:TextBox>
        </td>
</tr>
<tr>
<td class="celula_table"></td>-->--%>
</tr>
<tr>
<td class="celula_table"></td>
<td align="right" class="style2">
    *campos obrigatórios<br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_enviar.png" 
        onclick="ImageButton1_Click" />
    </td>
</tr>
</table>
</div>
</asp:Content>

