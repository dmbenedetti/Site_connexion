<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form11.aspx.cs" Inherits="form11" Title="Hospital e Maternidade Brasil" %>


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
              <div align="center" style="width: 100%; clear:both; float:left;">
                <table id="table_contato" align=center style="width: 640px;">
                  <tr>
                    <td class="celula_table" valign=top align="left" colspan="2">
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Data Cesariana:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDataCesaria" 
        ErrorMessage="Preencha a data da cesáriana.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtDataCesaria" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Hora:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHora" 
        ErrorMessage="Preencha a hora da cesáriana.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtHora" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>

                  <tr>
                    <td class="celula_table" valign=top>Duração*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator3" runat="server" ControlToValidate="drpDuracao" 
        ErrorMessage="Selecione a duração.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:DropDownList ID="drpDuracao" runat="server" CssClass="text_field">
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
                    <td class="celula_table" valign=top>Nome Completo do Pasciente<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNomePasciente" 
        ErrorMessage="Digite o nome da pasciente.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtNomePasciente" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Data de Nascimento*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDataNascimento" 
        ErrorMessage="Digite a data de nasciomento da pasciente.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtDataNascimento" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Telefone de contato (2 numeros, celular e fixo)*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTelContato" 
        ErrorMessage="Digite o telefone de contato da pasciente.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtTelContato" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2">
                          Informação do convênio
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Convênio*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtConvenio" 
        ErrorMessage="Digite os dados do convênio.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtConvenio" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2">
                          Informações da equipe médica
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Nome do Obstetra*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNomeObstetra" 
        ErrorMessage="Digite o nome do Obstetra.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtNomeObstetra" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>CRM*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNomeObstetra" 
        ErrorMessage="Digite o CRM.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtCRM" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Telefone de contato(2 números: fixo e celular)*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtTelObstetra" 
        ErrorMessage="Digite o telefone do Obstetra.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtTelObstetra" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>E-mail:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtEmailObtetra" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Nome do auxiliar:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtNomeAuxiliar" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2">
                          Informações para agendamento
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Código da cesariana AMB/TUSS (1º e 2º e arquivo):
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtAMB" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Quantas semanas de gestação*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator11" runat="server" ControlToValidate="drpTempoGestacao" 
        ErrorMessage="Selecione o tempo de gestação.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:DropDownList ID="drpTempoGestacao" runat="server" CssClass="text_field">
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
                    <td class="celula_table" valign=top>Gestação única*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator12" runat="server" ControlToValidate="drpGestacaoUnica" 
        ErrorMessage="Selecione se é gestão única.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:DropDownList ID="drpGestacaoUnica" runat="server" CssClass="text_field">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Sim" Value="Sim"></asp:ListItem>
                        <asp:ListItem Text="Não" Value="Não"></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Alergia a látex*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator13" runat="server" ControlToValidate="drpAlergia" 
        ErrorMessage="Selecione se possui alergia a látex.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:DropDownList ID="drpAlergia" runat="server" CssClass="text_field">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Sim" Value="Sim"></asp:ListItem>
                        <asp:ListItem Text="Não" Value="Não"></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Reserva de sangue*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtReservaSangue" 
        ErrorMessage="Entre com informações de reserva de sangue, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtReservaSangue" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Comorbidades Maternas*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtComorbidades" 
        ErrorMessage="Entre com informações de comorbidades maternas, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtComorbidades" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Medicamentos em uso durante a gestação*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtMedicamentos" 
        ErrorMessage="Entre com informações de medicamentos em uso durante a gestação, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtMedicamentos" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Alterações fetais conhecidas*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtAlteracoesFetais" 
        ErrorMessage="Entre com informações de alterações fetais conhecidas, se não existir digite (NEGA).">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtAlteracoesFetais" runat="server" Width="300px" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2">
                          Reservas
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>UTI Neonatal*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator17" runat="server" ControlToValidate="drpAlergia" 
        ErrorMessage="Selecione UTI Neonatal.">*</asp:RequiredFieldValidator>:
                      </td>
                    <td class="style1" valign=top>
                      <asp:DropDownList ID="drpNeonatal" runat="server" CssClass="text_field">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Sim" Value="Sim"></asp:ListItem>
                        <asp:ListItem Text="Não" Value="Não"></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                  </tr>

                  <tr>
                    <td class="celula_table" valign=top>Observações (informações complementares):
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtObs" runat="server" Height="130px" TextMode="MultiLine" 
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
                <p>&nbsp;</p>
              </div>
</div>
</asp:Content>

