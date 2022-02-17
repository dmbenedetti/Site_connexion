<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form8.aspx.cs" Inherits="form8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        <h2>
            <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
    </div>
    <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="24" class="celula_table" align="left" valign="top" class="style3" colspan="2">
                <h3>
                    Aviso de cirurgia</h3>
            </td>
        </tr>
        <tr>
            <td height="24" class="celula_table" align="left" valign="top" class="style3" colspan="2">
                <span style="color: Red">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </span>
                <p class="MsoNormal">
                    <span>*&nbsp; Campos obrigatórios<o:p></o:p></span></p>
                <br />
                <p>
                    <strong><span>Horário de atendimento: Todos os dias, das 8h às 18h</span></strong></p>
                <br />
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Tipo de Cirurgia:*<asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server"
                    ControlToValidate="rdo_tipoCirurgia" ErrorMessage="Escolha o  Tipo de cirurgia">*</asp:RequiredFieldValidator>
            </td>
            <td width="400" class="celula_table" height="24" align="left" valign="top">
                <asp:RadioButtonList ID="rdo_tipoCirurgia" runat="server" Height="24px" RepeatDirection="Horizontal"
                    Width="202px">
                    <asp:ListItem>Eletiva</asp:ListItem>
                    <asp:ListItem>Urgente</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Nome completo do paciente:*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_nome_paciente"
                    ErrorMessage="Preencha o nome completo do paciente">*</asp:RequiredFieldValidator>
            </td>
            <td width="400" class="celula_table" height="24" align="left" valign="top">
                <asp:TextBox ID="txt_nome_paciente" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Telefone:*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txt_telefone" ErrorMessage="Preencha o Telefone">*</asp:RequiredFieldValidator>
                (xx)xxxx-xxxx
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txt_telefone" runat="server" CssClass="txt" Height="18px" Width="300px"
                    onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999', event));"
                    onclick="this.value='';" MaxLength="13"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Telefone Celular:*<asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server"
                    ControlToValidate="txt_telefoneCelular" ErrorMessage="Preencha o Telefone">*</asp:RequiredFieldValidator>
                (xx)xxxxx-xxxx
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txt_telefoneCelular" runat="server" CssClass="txt" Height="18px"
                    Width="300px" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999', event));"
                    onclick="this.value='';" MaxLength="14"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Data de nascimento:*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txt_nascimento" ErrorMessage="Preencha o campo Data de nascimento">*</asp:RequiredFieldValidator>
                (dd/mm/aaaa)
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_nascimento" runat="server" CssClass="txt" Height="18px" Width="100px"
                    onkeypress="return txtBoxFormat(this, '99/99/9999', event);" onclick="this.value='';"
                    MaxLength="10"></asp:TextBox>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Sexo:*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rdo_sexo"
                    ErrorMessage="Escolha um sexo">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:RadioButtonList ID="rdo_sexo" runat="server" RepeatDirection="Horizontal" Width="200px">
                    <asp:ListItem>Masculino</asp:ListItem>
                    <asp:ListItem>Feminino</asp:ListItem>
                </asp:RadioButtonList>
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
                Convênio:*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ControlToValidate="txt_convenio" ErrorMessage="Preencha o campo convênio">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_convenio" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Plano:*<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_plano"
                    ErrorMessage="Preencha o campo plano">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_plano" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Tipo de plano:*<asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server"
                    ControlToValidate="rdo_tipoplano" ErrorMessage="Escolha o tipo do plano">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:RadioButtonList ID="rdo_tipoplano" runat="server" RepeatDirection="Horizontal"
                    Width="300px">
                    <asp:ListItem>Individual</asp:ListItem>
                    <asp:ListItem>Empresarial</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Acomodação:*<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ControlToValidate="rdo_acomodacao" ErrorMessage="Escolha uma acomodação">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:RadioButtonList ID="rdo_acomodacao" runat="server" Height="24px" RepeatDirection="Horizontal"
                    Width="369px">
                    <asp:ListItem>Apartamento</asp:ListItem>
                    <asp:ListItem>Hosp. Dia</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Produto:
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_produto" runat="server" CssClass="txt" Height="18px" Width="250px"></asp:TextBox>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Código da Carteirinha:*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txt_codigoCarteirinha"
                    ErrorMessage="Preencha o código da carteirinha">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_codigoCarteirinha" runat="server" CssClass="txt" Height="18px"
                    Width="250px"></asp:TextBox>
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
                Nome do médico:*<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                    ControlToValidate="txt_nome_medico" ErrorMessage="Preencha o campo nome do médico">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_nome_medico" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                CRM:*<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_crm"
                    ErrorMessage="Preencha o campo CRM">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_crm" runat="server" CssClass="txt" Height="18px" Width="100px"
                    MaxLength="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                Telefone do médico:*<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                    ControlToValidate="txt_telefone_medico" ErrorMessage="Preencha o campo telefone do médico">*</asp:RequiredFieldValidator>
                (xx)xxxxx-xxxx
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_telefone_medico" runat="server" CssClass="txt" Height="18px"
                    Width="180px" onkeypress="return (this.value.length < 13 ? txtBoxFormat(this, '(99)9999-9999', event) : txtBoxFormat(this, '(99)99999-9999', event));"
                    onclick="this.value='';" MaxLength="14"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txt_email"
                    ErrorMessage="Preencha o campo email">*</asp:RequiredFieldValidator>
                *
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_email" runat="server" CssClass="txt" Height="18px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style12" valign="top" class="style4">
                1º auxiliar:
            </td>
            <td align="left" class="celula_table" valign="top" class="style5">
                Nome <asp:TextBox ID="txt_auxiliar_nome1" runat="server" CssClass="txt" Height="18px"
                    Width="300px"></asp:TextBox><br />CRM <asp:TextBox ID="txt_auxiliar_crm1" runat="server" CssClass="txt" Height="18px"
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style12" valign="top" class="style4">
                2º auxiliar:
            </td>
            <td align="left" class="celula_table" valign="top" class="style5">
                Nome <asp:TextBox ID="txt_auxiliar_nome2" runat="server" CssClass="txt" Height="18px"
                    Width="300px"></asp:TextBox><br />CRM <asp:TextBox ID="txt_auxiliar_crm2" runat="server" CssClass="txt" Height="18px"
                    Width="300px"></asp:TextBox>
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
                <span>Data da Cirurgia / Exame:*<asp:RequiredFieldValidator ID="RequiredFieldValidator17"
                    runat="server" ControlToValidate="txt_data_cirurgia" ErrorMessage="Preencha o campo Data cirurgia / exame">*</asp:RequiredFieldValidator>
                    &nbsp;(dd/mm/aaaa)</span>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:TextBox ID="txt_data_cirurgia" runat="server" CssClass="txt" Height="18px" Width="100px"
                    onkeypress="return txtBoxFormat(this, '99/99/9999', event);" onclick="this.value='';"
                    MaxLength="10"></asp:TextBox>
                <asp:CalendarExtender ID="txt_data_cirurgia_CalendarExtender" runat="server" Enabled="True"
                    FirstDayOfWeek="Sunday" Format="dd/MM/yyyy" TargetControlID="txt_data_cirurgia"
                    TodaysDateFormat="dd/MM/yyyy">
                </asp:CalendarExtender>

                &nbsp;&nbsp; Hora:*<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                    ControlToValidate="txt_hora_cirurgia" ErrorMessage="Preencha o hora da cirurgia">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_hora_cirurgia"
                    ErrorMessage="Digite uma hora válida" ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$">*</asp:RegularExpressionValidator>
                <asp:TextBox ID="txt_hora_cirurgia" runat="server" CssClass="txt" Height="18px" Width="100px"
                    onkeypress="return txtBoxFormat(this, '99:99', event);" onclick="this.value='';"
                    MaxLength="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Tempo Previsto:*<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server"
                    ControlToValidate="txt_tempo_cirurgia" ErrorMessage="Preencha o campo tempo previsto">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txt_tempo_cirurgia" runat="server" CssClass="txt" Height="18px"
                    Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                CID:
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txt_CID" runat="server" CssClass="txt" Height="18px" Width="100px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Hipótese Diagnóstica:
            </td>
            <td class="style3" align="left" valign="top">
                <asp:TextBox ID="txt_diagnostico" runat="server" CssClass="txt" Height="18px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                <span>Lateralidade:*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator31"
                    runat="server" ControlToValidate="rdo_Lateralidade" ErrorMessage="Escolha a lateralidade">*</asp:RequiredFieldValidator>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <asp:RadioButtonList ID="rdo_Lateralidade" runat="server" RepeatDirection="Horizontal"
                    Width="400px">
                    <asp:ListItem>Esquerdo</asp:ListItem>
                    <asp:ListItem>Direito</asp:ListItem>
                    <asp:ListItem>Bilateral</asp:ListItem>
                    <asp:ListItem>Não há Lateralidade</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style13" align="left" valign="top" class="style3">
                Paciente Alérgico a Latex:*<asp:RequiredFieldValidator ID="RequiredFieldValidator36"
                    runat="server" ControlToValidate="rdo_alergia_latex" 
                    ErrorMessage="Informe se o paciente é alérgico a latex.">*</asp:RequiredFieldValidator>
            </td>
            <td class="style3" align="left" valign="top">
                <asp:RadioButtonList ID="rdo_alergia_latex" runat="server" RepeatDirection="Horizontal"
                    Width="191px">
                    <asp:ListItem>Sim</asp:ListItem>
                    <asp:ListItem>Não</asp:ListItem>
                </asp:RadioButtonList>
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
                <span>Cod. Procedimento AMB/TUSS*: </span>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                <span></span>
            </td>
        </tr>
        <asp:Repeater ID="rptProcedimentos" runat="server">
            <ItemTemplate>
                <tr>
                    <td height="24" class="style12" align="left" valign="top" class="style3">
                        <%# Eval("id") %>°&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txt_codProcedimentoMasTuss" runat="server" CssClass="txt" Height="18px"
                            Width="200px" Text='<%# Eval("cod") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCodProcedimento" runat="server" ErrorMessage="Procedimento é Obrigatório" ControlToValidate="txt_codProcedimentoMasTuss" Enabled='<%# Convert.ToInt32(Eval("id")) <=1 %>'>*</asp:RequiredFieldValidator>
                    </td>
                    <td height="24" class="celula_table" align="left" valign="top">
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                <tr>
                    <td colspan="2" align="left">
                        <asp:Button ID="btnInserirProcedimento" runat="server" Text="Adicionar" CausesValidation="false"
                            OnClick="btnInserirProcedimento_Click" />
                    </td>
                </tr>
            </FooterTemplate>
        </asp:Repeater>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                <span>Justificativa para o procedimento:</span>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">
                &nbsp;&nbsp;
                <asp:TextBox ID="txt_JustificativaProcedimento" runat="server" CssClass="txt" Height="18px"
                    Width="375px"></asp:TextBox>
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
            <td height="24" class="style12" align="left" valign="top" class="style3">
                &nbsp;
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="celula_table" align="left" valign="top" class="style3" colspan="2">
                <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td class="style9" height="24">
                            <span>Materiais especiais / OPME</span>
                        </td>
                        <td class="style10">
                            <span>Fornecedor</span>
                        </td>
                        <td>
                            <span>Quantidade</span>
                        </td>
                    </tr>
                    <asp:Repeater ID="rptMateriais" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="style9" height="24">
                                    <%# Eval("id") %>°&nbsp;&nbsp;
                                    <asp:TextBox ID="txt_MateriaisEspeciais" runat="server" CssClass="txt" Height="18px"
                                        Width="150px" Text='<%# Eval("cod") %>'></asp:TextBox>
                                </td>
                                <td class="style10">
                                    <asp:TextBox ID="txt_Fornecedor" runat="server" CssClass="txt" Height="18px" Width="200px"
                                        Text='<%# Eval("fornecedor") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_materiaisQtde" runat="server" CssClass="txt" Height="18px" Width="200px"
                                        Text='<%# Eval("quantidade") %>'></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <tr>
                                <td colspan="3" align="left">
                                    <asp:Button ID="btnInserirMaterial" runat="server" Text="Adicionar" CausesValidation="false"
                                        OnClick="btnInserirMaterial_Click" />
                                </td>
                            </tr>
                        </FooterTemplate>
                    </asp:Repeater>
                </table>
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
            <td height="24" class="style12" align="left" valign="top" class="style3">
                <strong>Reservas</strong>
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="celula_table" align="left" valign="top" colspan="2">
                <asp:RadioButtonList ID="rdo_reserva" runat="server" RepeatDirection="Horizontal"
                    Width="441px">
                    <asp:ListItem>UTI Adulto</asp:ListItem>
                    <asp:ListItem>UTI Pediátrica</asp:ListItem>
                    <asp:ListItem>UTI Neonatal</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td height="24" class="celula_table" align="left" valign="top" colspan="2">
                <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td class="style2" class="celula_table" valign="top">
                            Biópsia de Congelação – Laboratório:&nbsp;<asp:TextBox ID="txt_biopsiaCongelacao"
                                runat="server" CssClass="txt" Height="18px" Width="150px"></asp:TextBox>
                            <br />
                            Video:
                            <asp:TextBox ID="txt_video" runat="server" CssClass="txt" Height="18px" Width="150px"></asp:TextBox>
                            <br />
                            Escopia:
                            <asp:TextBox ID="txt_escopia" runat="server" CssClass="txt" Height="18px" Width="150px"></asp:TextBox>
                            <br />
                            Microscópio :
                            <asp:TextBox ID="txt_microscopio" runat="server" CssClass="txt" Height="18px" Width="150px"></asp:TextBox>
                            <br />
                            Reserva de Sangue:
                            <asp:TextBox ID="txt_tipo_sangue" runat="server" CssClass="txt" Height="18px" Width="150px"></asp:TextBox>
                            <br />
                            Outros: &nbsp;
                            <asp:TextBox ID="txt_outros" runat="server" CssClass="txt" Height="18px" Width="550px"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                * Campos obrigatórios<br />
                <br />
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/btn_enviar.png"
                    OnClick="ImageButton2_Click" />
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
        <tr>
            <td height="24" class="style12" align="left" valign="top" class="style3">
                &nbsp;
            </td>
            <td height="24" class="celula_table" align="left" valign="top">&nbsp;
                
            </td>
        </tr>
    </table>
</asp:Content>

