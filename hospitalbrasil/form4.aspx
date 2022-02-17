<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form4.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
<table width="600" border="0" cellspacing="0" cellpadding="0" align=center>
  <tr>
    <td height="25" colspan="2" align="left" valign="top"  class="celula_table">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
      </td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="left" valign="top" class="celula_table"><strong>Cadastre seu currículo</strong> </td>
  </tr>
  <tr>
    <td width="129" height="25" align="left" valign="top"  class="celula_table"> Selecione a área: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="drp_area_atuacao" ErrorMessage="Escolha uma área">*</asp:RequiredFieldValidator>
      </td>
    <td width="471" height="25" align="left" valign="top" class="celula_table">
        <asp:DropDownList ID="drp_area_atuacao" runat="server" CssClass="txt">
            <asp:ListItem>Administração</asp:ListItem>
            <asp:ListItem>Almoxarifado</asp:ListItem>
            <asp:ListItem>Auditoria</asp:ListItem>
            <asp:ListItem>Comercial</asp:ListItem>
            <asp:ListItem>Compras</asp:ListItem>
            <asp:ListItem>Diagnóstico por imagem</asp:ListItem>
            <asp:ListItem>Enfermagem</asp:ListItem>
            <asp:ListItem>Farmácia</asp:ListItem>
            <asp:ListItem>Faturamento</asp:ListItem>
            <asp:ListItem>Financeiro</asp:ListItem>
            <asp:ListItem>Informática</asp:ListItem>
            <asp:ListItem>Manutenção</asp:ListItem>
            <asp:ListItem>Médicos</asp:ListItem>
            <asp:ListItem>Paramédicos</asp:ListItem>
            <asp:ListItem>Recepção</asp:ListItem>
            <asp:ListItem>Recursos Humanos</asp:ListItem>
            <asp:ListItem>Vendas</asp:ListItem>
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td height="25" align="left" valign="top" class="celula_table"> Cargo de interesse: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txt_cargo" 
            ErrorMessage="Preenche o campo Cargo de interesse">*</asp:RequiredFieldValidator>
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_cargo" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Salário Pretendido: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txt_salario" 
            ErrorMessage="Preenche o campo Salário Pretendido">*</asp:RequiredFieldValidator>
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_salario" runat="server" CssClass="txt" Height="18px" 
            Width="300px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top"><strong>DADOS PESSOAIS</strong> </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Nome: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txt_nome" ErrorMessage="Preenche o campo Nome">*</asp:RequiredFieldValidator>
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_nome" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nascimento:<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_nascimento" 
            ErrorMessage="Preenche o campo Nascimento">*</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txt_nascimento" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Endereço: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="txt_endereco" ErrorMessage="Preenche o campo Endereço">*</asp:RequiredFieldValidator>
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_endereco" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        Cep:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
            ControlToValidate="txt_cep" ErrorMessage="Preenche o campo CEP">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txt_cep" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Bairro: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
            ControlToValidate="txt_bairro" ErrorMessage="Preenche o campo Bairro">*</asp:RequiredFieldValidator>
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_bairro" runat="server" CssClass="txt" Height="18px" 
            Width="130px"></asp:TextBox>
&nbsp;&nbsp; Cidade:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" 
            runat="server" ControlToValidate="txt_cidade" 
            ErrorMessage="Preenche o campo Cidade">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txt_cidade" runat="server" CssClass="txt" 
            Height="18px" Width="125px"></asp:TextBox>
&nbsp;&nbsp;Estado:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
            runat="server" ControlToValidate="drp_estado" ErrorMessage="Escolha um estado">*</asp:RequiredFieldValidator>
        <asp:DropDownList ID="drp_estado" runat="server" 
            CssClass="txt" Height="18px" Width="112px">
            <asp:ListItem>SP</asp:ListItem>
                       <asp:ListItem>RJ</asp:ListItem>
                       <asp:ListItem>ES</asp:ListItem>
                       <asp:ListItem>MG</asp:ListItem>
                       <asp:ListItem>PR</asp:ListItem>
                       <asp:ListItem>SC</asp:ListItem>
                       <asp:ListItem>RS</asp:ListItem>
                       <asp:ListItem>MS</asp:ListItem>
                       <asp:ListItem>GO</asp:ListItem>
                       <asp:ListItem>DF</asp:ListItem>
                       <asp:ListItem>MT</asp:ListItem>
                       <asp:ListItem>TO</asp:ListItem>
                       <asp:ListItem>BA</asp:ListItem>
                       <asp:ListItem>SE</asp:ListItem>
                       <asp:ListItem>AL</asp:ListItem>
                       <asp:ListItem>PB</asp:ListItem>
                       <asp:ListItem>PE</asp:ListItem>
                       <asp:ListItem>RN</asp:ListItem>
                       <asp:ListItem>CE</asp:ListItem>
                       <asp:ListItem>PI</asp:ListItem>
                       <asp:ListItem>MA</asp:ListItem>
                       <asp:ListItem>PA</asp:ListItem>
                       <asp:ListItem>AM</asp:ListItem>
                       <asp:ListItem>RO</asp:ListItem>
                       <asp:ListItem>AC</asp:ListItem>
                       <asp:ListItem>RR</asp:ListItem>
                       <asp:ListItem>AP</asp:ListItem>
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Telefone: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
            ControlToValidate="txt_telefone" ErrorMessage="Preenche o campo Telefone">*</asp:RequiredFieldValidator>
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_telefone" runat="server" CssClass="txt" Height="18px" 
            Width="150px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp; E-mail:<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator12" runat="server" ControlToValidate="txt_email" 
            ErrorMessage="Preenche o campo E-mail">*</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txt_email" runat="server" CssClass="txt" 
            Height="18px" Width="261px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Estado Civil: 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
            ControlToValidate="drp_estado_civil" ErrorMessage="Escolha um Estado Civil">*</asp:RequiredFieldValidator>
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:DropDownList ID="drp_estado_civil" runat="server" CssClass="txt" 
            Width="100px">
            <asp:ListItem>Solteiro</asp:ListItem>
            <asp:ListItem>Casado</asp:ListItem>
            <asp:ListItem>Divorciado</asp:ListItem>
            <asp:ListItem>Viúvo</asp:ListItem>
            <asp:ListItem>Separado</asp:ListItem>
            <asp:ListItem>Outro</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Sexo:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
            ControlToValidate="rdo_sexo" ErrorMessage="Escolha um sexo">*</asp:RequiredFieldValidator>
        <asp:RadioButtonList ID="rdo_sexo" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow" Width="200px">
            <asp:ListItem>Masculino</asp:ListItem>
            <asp:ListItem>Feminino</asp:ListItem>
        </asp:RadioButtonList>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top"><strong>DADOS PROFISSIONAIS</strong> </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"><em>Último Trabalho</em> </td>
    <td height="25" class="celula_table" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Empresa: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_empresa1" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Admissão:
        <asp:TextBox ID="txt_admissao1" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Cargo: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_cargo1" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp; Desligamento:
        <asp:TextBox ID="txt_desligamento1" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Atividades<br />
    desenvolvidas: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_atividades1" runat="server" CssClass="txt" Height="85px" 
            Width="460px" TextMode="MultiLine"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top"><em>Penúltimo Trabalho</em> </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Empresa: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_empresa2" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Admissão:
        <asp:TextBox ID="txt_admissao2" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Cargo: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_cargo2" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp; Desligamento:
        <asp:TextBox ID="txt_desligamento2" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Atividades<br />
    desenvolvidas: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_atividades2" runat="server" CssClass="txt" Height="85px" 
            Width="460px" TextMode="MultiLine"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top"><em>Antepenúltimo Trabalho</em> </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Empresa: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_empresa3" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Admissão:
        <asp:TextBox ID="txt_admissao3" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Cargo: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_cargo3" runat="server" CssClass="txt" Height="18px" 
            Width="250px"></asp:TextBox>
      &nbsp;&nbsp;&nbsp; Desligamento:
        <asp:TextBox ID="txt_desligamento3" runat="server" CssClass="txt" Height="18px" 
            Width="125px"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top"> Atividades<br />
    desenvolvidas: </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:TextBox ID="txt_atividades3" runat="server" CssClass="txt" Height="85px" 
            Width="460px" TextMode="MultiLine" ></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top"><strong>FORMAÇÃO ACADÊMICA</strong> </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top">
        <asp:TextBox ID="txt_formacao" runat="server" CssClass="txt" Height="89px" 
            Width="600px" TextMode="MultiLine"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top"><strong>CURSOS / PALESTRAS</strong> </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top">
        <asp:TextBox ID="txt_cursos" runat="server" CssClass="txt" Height="89px" 
            Width="600px" TextMode="MultiLine"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top"><strong>INFORMAÇÕES ADICIONAIS</strong> </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" colspan="2" align="left" valign="top">
        <asp:TextBox ID="txt_informacoes" runat="server" CssClass="txt" Height="89px" 
            Width="600px" TextMode="MultiLine"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top">&nbsp;</td>
    <td height="25" class="celula_table" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top">
        <asp:ImageButton ID="ImageButton2" runat="server" 
            ImageUrl="~/images/btn_enviar.png" onclick="ImageButton2_Click" />
        <br />
      </td>
    <td height="25" class="celula_table" align="left" valign="top">
        <br />
        <br />
      </td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top" colspan="2">
        <span class="Apple-style-span" 
            style="border-collapse: separate; color: rgb(0, 0, 0); font-family: 'Times New Roman'; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; font-size: medium; ">
        <span class="Apple-style-span" 
            style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: small; ">
        Se preferir, envie seu currículo para:<span class="Apple-converted-space">&nbsp;</span><a 
            href="mailto:rhselecao@hospitalassuncao.com.br?subject=Curr%EDculo%20enviado%20pelo%20Site%20HMA">rhselecao@hospitalassuncao.com.br</a></span></span></td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top">&nbsp;</td>
    <td height="25" class="celula_table" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="25" class="celula_table" align="left" valign="top">&nbsp;</td>
    <td height="25" class="celula_table" align="left" valign="top">&nbsp;</td>
  </tr>
</table>
</asp:Content>

