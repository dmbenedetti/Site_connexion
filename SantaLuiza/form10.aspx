<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form10.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
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
#contato{
background:url(images/btn_contato_hover.jpg);}
#table_contato{
width:400px;}
.celula_table{
height:30px;
font:12px Tahoma, Arial, Helvetica, sans-serif;
color:#666;
text-align:right;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container_interna">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <br />
            <div><asp:Literal ID="ltlResumo" runat="server"></asp:Literal></div>
            <div style="font:Tahoma, arial, verdana; color:#666666;">
              <div align="center" style="width: 500px; clear:both; float:left;">
                <table id="table_contato" align=center>
                  <tr>
                    <td class="celula_table" valign=top align="left" colspan="2">
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                      </td>
                  </tr>
                  <tr>
                    <td width="100" class="celula_table" valign=top>Nome:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome" 
        ErrorMessage="Preencha o campo nome.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtnome" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td width="100" class="celula_table" valign=top>CPF:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCPF" 
        ErrorMessage="Preencha o campo CPF.">*</asp:RequiredFieldValidator>
                      &nbsp;</td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtCPF" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td width="100" class="celula_table" valign=top>RG:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRG" 
        ErrorMessage="Preencha o campo RG.">*</asp:RequiredFieldValidator>
                      &nbsp;</td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtRG" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                    <tr>
                    <td width="100" class="celula_table" valign=top>Data de Nascimento:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_nascimento" 
        ErrorMessage="Preencha o campo Data de Nascimento.">*</asp:RequiredFieldValidator>
                      &nbsp;</td>
                    <td class="style1" valign=top>
                <asp:TextBox ID="txt_nascimento" runat="server" CssClass="txt" Height="18px" Width="100px"
                    onkeypress="return txtBoxFormat(this, '99/99/9999', event);" onclick="this.value='';"
                    MaxLength="10"></asp:TextBox>
                      </td>
                    </tr>
                  <tr>
                    <td class="celula_table" valign=top>Email:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail" 
        ErrorMessage="Preencha o campo email.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtemail" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Telefone Residencia:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txttelefone" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                    <tr>
                    <td class="celula_table" valign=top>Telefone Comercial:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txttelefone0" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                    </tr>
                    <tr>
                    <td class="celula_table" valign=top>Telefone<br />Celular:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txttelefone1" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                    </tr>
                    <tr>
                    <td class="celula_table" valign=top>Modalidade da Consulta:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator10" runat="server" ControlToValidate="drpModalidade" 
        ErrorMessage="Preencha o campo Modalidade da Consulta">*</asp:RequiredFieldValidator> </td>
                    <td class="style1" valign=top>
                      <asp:DropDownList ID="drpModalidade" runat="server" CssClass="text_field">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Particular" Value="Particular"></asp:ListItem>
                        <asp:ListItem Text="Convênido" Value="Convênido"></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                    </tr>
                    <tr>
                    <td class="celula_table" valign=top>Tipo da Consulta:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpModalidade" 
        ErrorMessage="Preencha o campo Modalidade da Consulta">*</asp:RequiredFieldValidator> </td>
                    <td class="style1" valign=top>
                        <asp:DropDownList ID="drpExame" CausesValidation="false" runat="server" CssClass="text_field">
                                                    <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="Ginecologia" Value="Ginecologia"></asp:ListItem>
                                                    <asp:ListItem Text="Cirurgia Pediátrica" Value="Cirurgia Pediátrica"></asp:ListItem>
                                                    <asp:ListItem Text="Cirurgia Geral" Value="Cirurgia Geral"></asp:ListItem>
                                                    <asp:ListItem Text="Cirurgua Plástica" Value="Cirurgua Plástica"></asp:ListItem>
                                                    <asp:ListItem Text="Pediatria" Value="Pediatria"></asp:ListItem>
                                                    <asp:ListItem Text="Otorrinolaringologia" Value="Otorrinolaringologia"></asp:ListItem>
                                                    <asp:ListItem Text="Proctologia" Value="Proctologia"></asp:ListItem>
                                                    <asp:ListItem Text="Neurocirurgia" Value="Neurocirurgia"></asp:ListItem>
                                                    <asp:ListItem Text="Neurologia" Value="Neurologia"></asp:ListItem>
                                                    <asp:ListItem Text="Ortopedia" Value="Ortopedia"></asp:ListItem>
                                                    <asp:ListItem Text="Urologia" Value="Urologia"></asp:ListItem>
                                                    <asp:ListItem Text="Clínica Médica" Value="Clínica Médica"></asp:ListItem>
                                                    <asp:ListItem Text="Hematologia" Value="Hematologia"></asp:ListItem>
                                                    <asp:ListItem Text="Gastroenterologia" Value="Gastroenterologia"></asp:ListItem>
                                                    <asp:ListItem Text="Dermatologia" Value="Dermatologia"></asp:ListItem>
                                                    <asp:ListItem Text="Reumatologia" Value="Reumatologia"></asp:ListItem>
                                                    <asp:ListItem Text="Infectologia" Value="Infectologia"></asp:ListItem>
                                                    <asp:ListItem Text="Anestesiologia" Value="Anestesiologia"></asp:ListItem>
                                                    <asp:ListItem Text="Oftalmologia" Value="Oftalmologia"></asp:ListItem>
                                                    <asp:ListItem Text="Oncologia" Value="Oncologia"></asp:ListItem>
                                                    <asp:ListItem Text="Nefrologia" Value="Nefrologia"></asp:ListItem>
                                                    <asp:ListItem Text="Mastologia" Value="Mastologia"></asp:ListItem>
                                                    <asp:ListItem Text="Fonoaudiologia" Value="Fonoaudiologia"></asp:ListItem>
                                                </asp:DropDownList>
                      </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:left;" >
                            <br />Dados para contato
                            <br /><br />
                            Um de nossos atendentes consultará a disponibilidade de horários e retornará em 12h.<br />
                            Para isso nos informe nome e telefone para ser contato.
                        </td>
                    </tr>
<tr>
                    <td width="100" class="celula_table" valign=top>Nome para contato:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtContatoNome" 
        ErrorMessage="Preencha o campo nome para contato.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtContatoNome" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                                      <tr>
                    <td class="celula_table" valign=top>Telefone para contato:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txttelefone2" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                    </tr>
                    <tr>
                    <td class="celula_table" valign=top>Email para contato:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtContatoEmail" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                    </tr>
                  <tr>
                    <td class="celula_table" valign=top>Observações:<br />
                      </td>
                    <td rowspan="2" class="style1" valign=top>
                      <asp:TextBox ID="txtmensagem" runat="server" Height="130px" TextMode="MultiLine" 
        Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table"></td>
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
              <div style="width: 400px; float:right;"></div>
  </div>
</div>
</asp:Content>

