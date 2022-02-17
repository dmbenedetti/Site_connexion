<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form12.aspx.cs" Inherits="form12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
<style>
#contato{
background:url(images/btn_contato_hover.jpg);}
#table_contato{
width:400px;}
.celula_table{
height:30px;
font:12px Tahoma, Arial, Helvetica, sans-serif;
color:#666;
    }
.celula_table2{
height:40px;
width:300px;
text-align:left;
}
.text_field{
border:solid 1px #849E9F;
height:23px;}
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
    
</style>
    <script src="js/jquery.mask.js"></script>
            <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
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
    <style>
        .celula_table
        {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
        }
        .text_field
        {
            border: solid 1px #849E9F;
            height: 23px;
        }
        .txt
        {
            border: solid 1px #ccc;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            height: 24px;
        }
        .style4
        {
            font: normal normal normal 14px normal Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            width: 254px;
        }
        .style6
        {
            font: normal normal bold 14px normal Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            height: 24px;
        }
        .style8
        {
            font: normal normal bold 14px normal Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
        }
        .style9
        {
        }
        .style10
        {
            width: 224px;
        }
        .style11
        {
            font-size: 16px;
        }
        .style12
        {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            width: 254px;
        }
        .style13
        {
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            height: 24px;
            width: 254px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div id="titulo_pag">
        <h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
    </div>
    <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Data Cesariana:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDataCesaria" 
        ErrorMessage="Preencha a data da cesáriana.">*</asp:RequiredFieldValidator>
            </td>
            <td width="400" class="celula_table" height="24" align="left" valign="top">
                <asp:TextBox ID="txtDataCesaria" onkeypress="return txtBoxFormat(this, '99/99/9999', event);" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Hora:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHora" 
        ErrorMessage="Preencha a hora da cesáriana.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txtHora" runat="server" CssClass="txt" Height="18px" Width="300px"
                    onkeypress="return txtBoxFormat(this, '99:99', event);"
                    onclick="this.value='';" MaxLength="13"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Duração:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator19" runat="server" ControlToValidate="drpDuracao" 
        ErrorMessage="Selecione a duração.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:DropDownList ID="drpDuracao" runat="server" CssClass="txt">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                      </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Nome Completo do Pasciente:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNomePasciente" 
        ErrorMessage="Digite o nome da pasciente.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtNomePasciente" runat="server" CssClass="txt" Height="18px" Width="300px"
                    MaxLength="300"></asp:TextBox>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Data de Nascimento:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDataNascimento" 
        ErrorMessage="Digite a data de nasciomento da pasciente.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtDataNascimento" onkeypress="return txtBoxFormat(this, '99/99/9999', event);" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
       <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Telefone de contato celular:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTelContato" 
        ErrorMessage="Digite o telefone celular de contato da pasciente.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtTelContato" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>        
       <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Telefone de contato fixo:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtTelContato2" 
        ErrorMessage="Digite o telefone fixo de contato da pasciente.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtTelContato2" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>        
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                &nbsp;
            </td>
            <td height="24" align="left" class="celula_table" valign="top">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="style4" align="left" valign="top" class="style3">
                <strong>Informações do convênio</strong>
            </td>
            <td height="24" align="left" class="celula_table" valign="top">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Convênio:*<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server"
                    ControlToValidate="txtConvenio" ErrorMessage="Preencha o campo convênio">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtConvenio" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
       
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                &nbsp;
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td class="style6" align="left" valign="top" class="style3" colspan="2">
                Informações da equipe médica
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Nome do Obstetra:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNomeObstetra" 
        ErrorMessage="Digite o nome do Obstetra.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtNomeObstetra" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                CRM:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCRM" 
        ErrorMessage="Digite o CRM.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtCRM" runat="server" CssClass="txt" Height="18px" Width="100px"
                    MaxLength="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Telefone de contato celular:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTelObstreta" 
        ErrorMessage="Digite o telefone celular de contato do obstreta.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtTelObstreta" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>        
       <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Telefone de contato fixo:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtTelObstreta2" 
        ErrorMessage="Digite o telefone fixo de contato do obstreta.">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtTelObstreta2" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999" runat="server" CssClass="txt" Height="18px" Width="100px" MaxLength="10"></asp:TextBox>
            </td>
        </tr>  
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtEmailObtetra"
                    ErrorMessage="Preencha o campo email">*</asp:RequiredFieldValidator>
                *
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtEmailObtetra" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style12" valign="top" class="style4">
                Nome auxiliar:
            </td>
            <td align="left" class="celula_table" valign="top" class="style5">
                <asp:TextBox ID="txtNomeAuxiliar" runat="server" CssClass="txt" Height="18px"
                    Width="300px" />
            </td>
        </tr>
        
        <tr>
            <td height="24" class="style12" align="left" valign="middle" class="style3">
                &nbsp;
            </td>
            <td height="24" class="celula_table" align="left" valign="middle">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="style8" align="left" valign="middle" class="style3" colspan="2">
                Informações para agendamento
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                <span>Código da cesariana AMB/TUSS:</span>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtAMB" runat="server" CssClass="txt" Height="18px"
                    Width="300px"></asp:TextBox>
                <br />
                1º Arquivo - <asp:fileupload id="fupArquivo1" runat="server"></asp:fileupload>
                <br />
                2º Arquivo - <asp:fileupload id="fupArquivo2" runat="server"></asp:fileupload>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Quantas semanas de gestação:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator10" runat="server" ControlToValidate="drpTempoGestacao" 
        ErrorMessage="Selecione o tempo de gestação.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:DropDownList ID="drpTempoGestacao" runat="server" CssClass="txt">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="11" Value="11"></asp:ListItem>
                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                        <asp:ListItem Text="13" Value="13"></asp:ListItem>
                        <asp:ListItem Text="14" Value="14"></asp:ListItem>
                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                        <asp:ListItem Text="16" Value="16"></asp:ListItem>
                        <asp:ListItem Text="17" Value="17"></asp:ListItem>
                        <asp:ListItem Text="18" Value="18"></asp:ListItem>
                        <asp:ListItem Text="19" Value="19"></asp:ListItem>
                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        <asp:ListItem Text="21" Value="21"></asp:ListItem>
                        <asp:ListItem Text="22" Value="22"></asp:ListItem>
                        <asp:ListItem Text="23" Value="23"></asp:ListItem>
                        <asp:ListItem Text="24" Value="24"></asp:ListItem>
                        <asp:ListItem Text="25" Value="25"></asp:ListItem>
                        <asp:ListItem Text="26" Value="26"></asp:ListItem>
                        <asp:ListItem Text="27" Value="27"></asp:ListItem>
                        <asp:ListItem Text="28" Value="28"></asp:ListItem>
                        <asp:ListItem Text="29" Value="29"></asp:ListItem>
                        <asp:ListItem Text="30" Value="30"></asp:ListItem>
                        <asp:ListItem Text="31" Value="31"></asp:ListItem>
                        <asp:ListItem Text="32" Value="32"></asp:ListItem>
                        <asp:ListItem Text="33" Value="33"></asp:ListItem>
                        <asp:ListItem Text="34" Value="34"></asp:ListItem>
                        <asp:ListItem Text="35" Value="35"></asp:ListItem>
                        <asp:ListItem Text="36" Value="36"></asp:ListItem>
                        <asp:ListItem Text="37" Value="37"></asp:ListItem>
                        <asp:ListItem Text="38" Value="38"></asp:ListItem>
                        <asp:ListItem Text="39" Value="39"></asp:ListItem>
                        <asp:ListItem Text="40" Value="40"></asp:ListItem>
                        <asp:ListItem Text="41" Value="41"></asp:ListItem>
                        <asp:ListItem Text="42" Value="42"></asp:ListItem>
                      </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Gestação única:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator12" runat="server" ControlToValidate="drpGestacaoUnica" 
        ErrorMessage="Selecione se é gestão única.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:DropDownList ID="drpGestacaoUnica" runat="server" CssClass="txt">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Sim" Value="Sim"></asp:ListItem>
                        <asp:ListItem Text="Não" Value="Não"></asp:ListItem>
                      </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
               Alergia a látex:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator13" runat="server" ControlToValidate="drpAlergia" 
        ErrorMessage="Selecione se possui alergia a látex.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                     <asp:DropDownList ID="drpAlergia" runat="server" CssClass="txt">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Sim" Value="Sim"></asp:ListItem>
                        <asp:ListItem Text="Não" Value="Não"></asp:ListItem>
                      </asp:DropDownList>
 
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Reserva de sangue:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtReservaSangue" 
        ErrorMessage="Entre com informações de reserva de sangue, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
              <asp:TextBox ID="txtReservaSangue" runat="server" Width="300px" 
        CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Comorbidades Maternas:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtComorbidades" 
        ErrorMessage="Entre com informações de Comorbidades Maternas, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
              <asp:TextBox ID="txtComorbidades" runat="server" Width="300px" 
        CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">Medicamentos em uso durante a gestação:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtMedicamentos" 
        ErrorMessage="Entre com informações de medicamentos em uso durante a gestação, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txtMedicamentos" runat="server" Width="300px" 
        CssClass="txt"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="style13" align="left" valign="top" class="style3">Alterações fetais conhecidas:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtAlteracoesFetais" 
        ErrorMessage="Entre com informações de alterações fetais conhecidas, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txtAlteracoesFetais" runat="server" Width="300px" 
        CssClass="txt"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td height="24" class="style12" align="left" valign="middle" class="style3">
                &nbsp;
            </td>
            <td height="24" class="celula_table" align="left" valign="middle">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="style8" align="left" valign="middle" class="style3" colspan="2">
                Reservas
            </td>
        </tr>
         <tr>
            <td class="style13" align="left" valign="top" class="style3">UTI Neonatal:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator21" runat="server" ControlToValidate="drpAlergia" 
        ErrorMessage="Selecione UTI Neonatal.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:DropDownList ID="drpNeonatal" runat="server" CssClass="txt">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Sim" Value="Sim"></asp:ListItem>
                        <asp:ListItem Text="Não" Value="Não"></asp:ListItem>
                      </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td class="style13" align="left" valign="top" class="style3">
            </td>
            <td class="style3" align="left" valign="top">
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
               Observações (informações adicionais):
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txtObs" runat="server" Height="130px" TextMode="MultiLine" 
        Width="300px" CssClass="txt"></asp:TextBox>
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
            <td height="24" class="style12" align="left" valign="top" class="style3" style="color:red;">

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
    </table>

                <script>
                    $('#ContentPlaceHolder1_txtDataCesaria').mask('00/00/0000');
                    $('#ContentPlaceHolder1_txtHora').mask('00:00');
                    $('#ContentPlaceHolder1_txtDataNascimento').mask('00/00/0000');
                    $('#ContentPlaceHolder1_txtTelContato').mask('(00) 00000-0000');
                    $('#ContentPlaceHolder1_txtTelContato2').mask('(00) 0000-0000');
                    $('#ContentPlaceHolder1_txtTelObstreta').mask('(00) 00000-0000');
                    $('#ContentPlaceHolder1_txtTelObstreta2').mask('(00) 0000-0000');

    </script>

</asp:Content>

