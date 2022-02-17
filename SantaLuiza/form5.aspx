<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form5.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
<style>
.celula_table{
font:12px Tahoma, Arial, Helvetica, sans-serif;
color:#666;

    }
.text_field{
border:solid 1px #849E9F;
height:23px;}
    .txt
    {
        border:solid 1px #ccc;
        }
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 232px;
    }
    .style3
    {
    }
    .style4
    {
        width: 237px;
        height: 24px;
    }
    .style5
    {
        height: 24px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <br />
            <div><asp:Literal ID="ltlResumo" runat="server"></asp:Literal></div>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3" colspan="2"><h3>Aviso de cirurgia</h3></td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3" colspan="2"> 
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Nome completo do paciente:*
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_nome_paciente" 
            ErrorMessage="Preencha o nome completo do paciente">*</asp:RequiredFieldValidator>
      </td>
    <td width="400" class="celula_table"  height="24" align="left" valign="top">
        <asp:TextBox ID="txt_nome_paciente" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Telefone:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_telefone" 
            ErrorMessage="Preencha o Telefone">*</asp:RequiredFieldValidator>
        (xx)xxxx-xxxx</td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_telefone" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24"  class="celula_table" align="left" valign="top" class="style3"> Data de nascimento:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_nascimento" 
            ErrorMessage="Preencha o campo Data de nascimento">*</asp:RequiredFieldValidator>
        (dd/mm/aaaa)</td>
    <td height="24"  class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_nascimento" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Sexo:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator4" runat="server" ControlToValidate="rdo_sexo" 
            ErrorMessage="Escolha um sexo">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:RadioButtonList ID="rdo_sexo" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow" Width="200px">
            <asp:ListItem>Masculino</asp:ListItem>
            <asp:ListItem>Feminino</asp:ListItem>
        </asp:RadioButtonList>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Peso (Cirurgia Infantil):</td>
    <td height="24" align="left"  class="celula_table" valign="top">
        <asp:TextBox ID="txt_peso" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Convênio:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_convenio" 
            ErrorMessage="Preencha o campo convênio">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_convenio" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Plano:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_plano" 
            ErrorMessage="Preencha o campo plano">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_plano" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24"  class="celula_table" align="left" valign="top" class="style3"> Acomodação:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator8" runat="server" ControlToValidate="rdo_acomodacao" 
            ErrorMessage="Escolha uma acomodação">*</asp:RequiredFieldValidator>
      </td>
    <td height="24"  class="celula_table" align="left" valign="top">
        <asp:RadioButtonList ID="rdo_acomodacao" runat="server" Height="24px" 
            RepeatDirection="Horizontal" Width="369px">
            <asp:ListItem>Enfermaria</asp:ListItem>
            <asp:ListItem>Apartamento</asp:ListItem>
            <asp:ListItem>Ambulatorial</asp:ListItem>
            <asp:ListItem>Hosp. Dia</asp:ListItem>
        </asp:RadioButtonList>
      </td>
  </tr>
  <tr>
    <td height="24"  class="celula_table" align="left" valign="top" class="style3"> Produto:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_produto" 
            ErrorMessage="Preencha o campo produto">*</asp:RequiredFieldValidator>
      </td>
    <td height="24"  class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_produto" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24"  class="celula_table" align="left" valign="top" class="style3"> Nome do médico:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator10" runat="server" 
            ControlToValidate="txt_nome_paciente" 
            ErrorMessage="Preencha o campo nome do médico">*</asp:RequiredFieldValidator>
      </td>
    <td height="24"  class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_nome_medico" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24"  class="celula_table" align="left" valign="top" class="style3"> CRM:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_crm" 
            ErrorMessage="Preencha o campo CRM">*</asp:RequiredFieldValidator>
      </td>
    <td height="24"  class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_crm" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Telefone do médico:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator12" runat="server" 
            ControlToValidate="txt_telefone_medico" 
            ErrorMessage="Preencha o campo telefone do médico">*</asp:RequiredFieldValidator>
        (xx)xxxx-xxxx</td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_telefone_medico" runat="server" CssClass="txt" Height="18px" 
            Width="180px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> E-mail: </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_email" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  colspan="2" align="left" valign="top"><p><strong>Os agendamentos estarão centralizados no Agendamento Cirúrgico.</strong></p>
      <p><strong>Telefones: 2127-6699 ou 2127-6872 
      </p> </p> <p>Fax: 2127-6387 </strong></p>
      <p><strong>Horário de atendimento:</strong></p>
    <p><strong>Segunda a </strong><strong>Sexta das 8h às 17h30min</strong></p></td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Data de Internação:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator13" runat="server" 
            ControlToValidate="txt_data_internacao" 
            ErrorMessage="Preencha o campo data de internação">*</asp:RequiredFieldValidator>
        (dd/mm/aaaa)</td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_data_internacao" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Hora:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator14" runat="server" 
            ControlToValidate="txt_hora_internacao" 
            ErrorMessage="Preencha o campo hora internação">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_hora_internacao" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Cod. Procedimento: </td>
    <td height="24" class="celula_table"  align="left" valign="top">Cirurgia / Exame:</td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3">
        <asp:TextBox ID="txt_cod_procedimento1" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
        *<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
            ControlToValidate="txt_cod_procedimento1" 
            ErrorMessage="Preencha o campo codigo procedimento">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_cirugia_exame1" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
        *<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
            ControlToValidate="txt_cirugia_exame1" 
            ErrorMessage="Preencha o campo Cirurgia / Exame">*</asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3">
        <asp:TextBox ID="txt_cod_procedimento2" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_cirugia_exame2" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3">
        <asp:TextBox ID="txt_cod_procedimento3" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_cirugia_exame3" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Data da Cirurgia / Exame:*
        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
            ControlToValidate="txt_data_cirurgia" 
            ErrorMessage="Preencha o campo Data cirurgia / exame">*</asp:RequiredFieldValidator>
        (dd/mm/aaaa)</td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_data_cirurgia" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Hora:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator18" runat="server" 
            ControlToValidate="txt_hora_cirurgia" 
            ErrorMessage="Preencha o hora da cirurgia">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_hora_cirurgia" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Tempo Previsto:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator19" runat="server" 
            ControlToValidate="txt_tempo_cirurgia" 
            ErrorMessage="Preencha o campo tempo previsto">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_tempo_cirurgia" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Diagnóstico: </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_diagnostico" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> CID:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator20" runat="server" ControlToValidate="txt_CID" 
            ErrorMessage="Preencha o campo CID">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_CID" runat="server" CssClass="txt" Height="18px" 
            Width="100px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Origem do Anestesista:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator21" runat="server" 
            ControlToValidate="rdo_origem_anestesista" 
            ErrorMessage="Escolha a origem do anestesista">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:RadioButtonList ID="rdo_origem_anestesista" runat="server" 
            RepeatDirection="Horizontal" Width="191px">
            <asp:ListItem>Interno</asp:ListItem>
            <asp:ListItem>Externo</asp:ListItem>
        </asp:RadioButtonList>
      </td>
  </tr>
  <tr>
    <td align="left" class="celula_table"  valign="top" class="style4"> Tipo de Anestesia:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator22" runat="server" 
            ControlToValidate="txt_tipo_anestesia" 
            ErrorMessage="Preencha o campo Tipo de Anestesista">*</asp:RequiredFieldValidator>
      </td>
    <td align="left" class="celula_table"  valign="top" class="style5">
        <asp:TextBox ID="txt_tipo_anestesia" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"> Nome do Anestesista:*<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator23" runat="server" 
            ControlToValidate="txt_nome_anestesista" 
            ErrorMessage="Preencha o campo nome do anestesista">*</asp:RequiredFieldValidator>
      </td>
    <td height="24" class="celula_table"  align="left" valign="top">
        <asp:TextBox ID="txt_nome_anestesista" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3"><strong>Reserva</strong> </td>
    <td height="24" class="celula_table"  align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="24"  class="celula_table" align="left" valign="top" colspan="2">
        <asp:RadioButtonList ID="rdo_reserva" runat="server" 
            RepeatDirection="Horizontal" Width="441px">
            <asp:ListItem>UTI Adulto</asp:ListItem>
            <asp:ListItem>UTI Pediátrica</asp:ListItem>
            <asp:ListItem>UTI Neo-Natal</asp:ListItem>
        </asp:RadioButtonList>
      </td>
  </tr>
  <tr>
    <td height="24"  class="celula_table" align="left" valign="top" colspan="2">
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td class="style2" class="celula_table"  valign="top">
                    <asp:CheckBox ID="chk_congelacao" runat="server" Text="Congelação" />
                    <br />
                    <asp:CheckBox ID="chk_anatomia" runat="server" Text="Anatomia Patológica" />
                    <br />
                    <asp:CheckBox ID="chk_sangue" runat="server" Text="Sangue - Tipo: " />
        <asp:TextBox ID="txt_tipo_sangue" runat="server" CssClass="txt" Height="18px" 
            Width="50px"></asp:TextBox>
                    <br />
                    <asp:CheckBox ID="chk_protese" runat="server" 
                        Text="Prótese / Órtese / Síntese:" />
                </td>
                <td valign="top" class="celula_table" >
                    <asp:CheckBox ID="chk_microscopio" runat="server" Text="Microscópio" />
                    <br />
                    <asp:CheckBox ID="chk_rx" runat="server" Text="RX" />
                    <br />
                    <asp:CheckBox ID="chk_outros" runat="server" Text="Outros" />
&nbsp;<asp:TextBox ID="txt_outros" runat="server" CssClass="txt" Height="18px" 
            Width="150px"></asp:TextBox>
                </td>
            </tr>
        </table>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" colspan="2">
        <asp:TextBox ID="txt_protese" runat="server" CssClass="txt" Height="74px" 
            Width="532px" TextMode="MultiLine"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="24" class="celula_table" align="left" valign="top" class="style3">* Campos obrigatórios<br />
        <br />
        <asp:ImageButton ID="ImageButton2" runat="server" 
            ImageUrl="~/images/btn_enviar.png" onclick="ImageButton2_Click" />
        </td>
    <td height="24" class="celula_table"  align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="24" class="celula_table"  align="left" valign="top" class="style3">&nbsp;</td>
    <td height="24" class="celula_table"  align="left" valign="top">&nbsp;</td>
  </tr>
</table>
</asp:Content>

