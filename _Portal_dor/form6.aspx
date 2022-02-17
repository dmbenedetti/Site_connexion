<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form6.aspx.cs" Inherits="fale_conosco" Title="Rede D'Or São Luiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
width:388px;
    }
.celula_table2{
height:40px;
width:300px;
text-align:left;
}
.text_field{
border:solid 1px #849E9F;
height:23px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <br />
            <div><asp:Literal ID="ltlResumo" runat="server"></asp:Literal></div>
<br />
Registre sua opinião e contribua para a melhoria da qualidade de nosso atendimento.<br />
</p>
            <table width="550" border="0" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td colspan="5">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                            </td>
    </tr>
    <tr>
      <td colspan="5"><strong>1 - Se passou pelo Pronto Atendimento</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Cortesia dos Recepcionistas</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="cortesia_recepcionistas" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Atenção da enfermagem</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="atencao_enfermagem" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Cortesia no Atendimento Médico</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="cortesia_atendimento_medico" runat="server" 
              Height="17px" RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Tempo de espera para atendimento</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="tempo_espera" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>2 - Recepção Internação</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Cortesia dos Colaboradores</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="cortesia_colaboradores" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Espera para emissão da documentação</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="espera_documentacao" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>3 - Enfermagem</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Atenção</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="enfermagem_atencao" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>4 - Médicos</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Atendimento de suas necessidades</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="medicos_atendimento" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>5 - Nutrição</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Temperatura dos alimentos</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="temperatura_alimentos" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Atenção das copeiras</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="atencao_copeiras" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>6 - Manutenção</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Tempo de atendimento a solicitação</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="tempo_atendimento" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>7 - Governança</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Limpeza das acomodações</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="limpeza_acomodacoes" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>8 - Alta</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Espera para alta</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="espera_alta" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>9 - Qualidade</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Se utilizou os serviços da Ouvidoria, como avalia os serviços?</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="servico_ouvidoria" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>» Você recomendaria o Hospital?</strong></td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td> </td>
      <td> </td>
      <td> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="recomenda_hospital" runat="server" Height="16px" 
              RepeatDirection="Horizontal" Width="180px">
              <asp:ListItem>Não</asp:ListItem>
              <asp:ListItem>Sim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">Em caso de não recomendar o Hospital, qual o motivo?</td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><label>&nbsp;<asp:TextBox ID="motivo_nao_recomenda" runat="server" Height="52px" TextMode="MultiLine" 
        Width="530px" CssClass="text_field"></asp:TextBox>
      </label></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>10 - </strong><strong>Auditoria Médica</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5" bgcolor="#f2f2f2">» Se utilizou os serviços da Auditoria Médica, como avalia os serviços prestados</td>
    </tr>
    <tr>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
      <td align="center"> </td>
    </tr>
    <tr>
      <td align="center" colspan="5">
          <asp:RadioButtonList ID="auditoria_medica" runat="server" Height="17px" 
              RepeatDirection="Horizontal" Width="546px">
              <asp:ListItem>Excelente</asp:ListItem>
              <asp:ListItem>Ótimo</asp:ListItem>
              <asp:ListItem>Bom</asp:ListItem>
              <asp:ListItem>Ruim</asp:ListItem>
              <asp:ListItem>Muito Ruim</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>11 - Comentários</strong></td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5">
    <asp:TextBox ID="comentarios" runat="server" Height="52px" TextMode="MultiLine" 
        Width="530px" CssClass="text_field"></asp:TextBox>
                            </td>
    </tr>
    <tr>
      <td colspan="5"> </td>
    </tr>
    <tr>
      <td colspan="5"><strong>Dados do Paciente</strong></td>
    </tr>
    <tr>
      <td colspan="5"> 
        <table width="100%" height="245" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>Nome do Paciente*:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                    runat="server" ControlToValidate="nome_paciente" 
                    ErrorMessage="Preencha o nome do paciente">*</asp:RequiredFieldValidator>
              </td>
            <td>
    <asp:TextBox ID="nome_paciente" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                            </td>
          </tr>
          <tr>
            <td>Email*:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="email" ErrorMessage="Preencha o campo email">*</asp:RequiredFieldValidator>
                                                    </td>
            <td>
    <asp:TextBox ID="email" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                                                    </td>
          </tr>
          <tr>
            <td>Telefone*:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                    runat="server" ControlToValidate="telefone" 
                    ErrorMessage="Preencha o campo telefone">*</asp:RequiredFieldValidator>
                                                    </td>
            <td>
    <asp:TextBox ID="telefone" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                                                    </td>
          </tr>
          <tr>
            <td>Local de Atendimento*:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" 
                    runat="server" ControlToValidate="loca_atendimento" 
                    ErrorMessage="Preencha o local de atendimento">*</asp:RequiredFieldValidator>
                                                    </td>
            <td>
    <asp:TextBox ID="loca_atendimento" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                                                    </td>
          </tr>
          <tr>
            <td>Data Internação:</td>
            <td>
    <asp:TextBox ID="data_internacao" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                                                    </td>
          </tr>
          <tr>
            <td>Data Alta:</td>
            <td>
    <asp:TextBox ID="data_alta" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                                                    </td>
          </tr>
          <tr>
            <td>Quarto*:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="quarto" ErrorMessage="Preencha o campo quarto">*</asp:RequiredFieldValidator>
                                                    </td>
            <td>
    <asp:TextBox ID="quarto" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                                                    </td>
          </tr>
        </table>        
      </td>
    </tr>
    <tr>
      <td colspan="5"><div>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_enviar.png" 
        onclick="ImageButton1_Click" />
    &nbsp; 
            *campos obrigatórios</div></td>
    </tr>
  </tbody>
</table>

</div>
</asp:Content>

