<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form_exame.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="js/jquery.maskedinput.js"></script>
<style>
#contato{
background:url(images/btn_contato_hover.jpg);}
#table_contato{
max-width:600px;}
.celula_table{
height:30px;
font:12px Tahoma, Arial, Helvetica, sans-serif;
color:#666;
text-align:right;
    }
.celula_table2{
height:40px;
max-width:300px;
text-align:left;
width:100%;
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
    <script type="text/javascript">
        function Imprimir() {
            var i = $("#ContentPlaceHolder1_idForm").val();
            window.open('formulario_exames_protocolo.aspx?id=' + i,'protocolo','width=600,height=600, top=100, left=100');
        }
        $(document).ready(function () {
            $('#ContentPlaceHolder1_txtemail').mask('99/99/9999');
            $('#ContentPlaceHolder1_txtDataAtendimento').mask('99/99/9999');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container_interna">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <br />
            <div><asp:Literal ID="ltlResumo" runat="server"></asp:Literal></div>
            <div style="font:Tahoma, arial, verdana; color:#666666;">
              <div align="center" style="max-width: 500px; clear:both; float:left;">
                <table id="table_contato" align=center>
                  <tr>
                    <td class="celula_table" valign=top align="left" colspan="2">
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                      </td>
                  </tr>
                    <tr id="trProtocolo" runat="server" visible="false">
                    <td class="celula_table" valign=top>&nbsp;</td>
                    <td>
                        <span class="celula_table"><strong>Protocolo:</strong></span>
                        <asp:HiddenField ID="hfProtocolo" runat="server" />
                      <asp:literal ID="idProtocolo" runat="server"></asp:literal>
                      &nbsp;&nbsp;&nbsp;&nbsp;<span class="celula_table"><strong>Data da Solicitação:</strong></span><span class="style1">
                      <asp:Literal ID="dtSolicitacao" runat="server"></asp:Literal>
                      </span></td>
                        </tr>
                  <tr>
                      <td class="celula_table" valign=top>&nbsp;</td>
                      <td class="style1" valign=top>&nbsp;</td>
                  </tr>
                  <tr>

                    <td width="200" class="celula_table" valign=top>Nome:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome" 
        ErrorMessage="Preencha o campo nome.">*</asp:RequiredFieldValidator>
                        <asp:HiddenField ID="idForm" runat="server" />
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtnome" runat="server" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Data de Nascimento:*<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail" 
        ErrorMessage="Preencha o campo Data de nascimento.">*</asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtemail" runat="server" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                    <tr>
                        <td class="celula_table" valign=top>Data do Exame:*</td>
                    <td class="style1" valign=top>
                        <asp:TextBox ID="txtDataAtendimento" runat="server" CssClass="text_field"></asp:TextBox>
                      <asp:DropDownList ID="dropMes" Visible="false" runat="server" CssClass="text_field">
                                    <asp:ListItem Text="Mês" Value=""></asp:ListItem>
                                    <asp:ListItem Text="01" Value="01"></asp:ListItem>
                          <asp:ListItem Text="02" Value="02"></asp:ListItem>
                          <asp:ListItem Text="03" Value="03"></asp:ListItem>
                          <asp:ListItem Text="04" Value="04"></asp:ListItem>
                          <asp:ListItem Text="05" Value="05"></asp:ListItem>
                          <asp:ListItem Text="06" Value="06"></asp:ListItem>
                          <asp:ListItem Text="07" Value="07"></asp:ListItem>
                          <asp:ListItem Text="08" Value="08"></asp:ListItem>
                          <asp:ListItem Text="09" Value="09"></asp:ListItem>
                          <asp:ListItem Text="10" Value="10"></asp:ListItem>
                          <asp:ListItem Text="11" Value="11"></asp:ListItem>
                          <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                       <asp:DropDownList ID="dropAno" Visible="false" runat="server" CssClass="text_field">
                                    <asp:ListItem Text="Ano" Value=""></asp:ListItem>
                                </asp:DropDownList>
                      </td>
                        
                    </tr>
                      <tr>
                          <td class="celula_table" valign=top>
                              Tipo de Atendimento:
                          </td>
                          <td>
                              <asp:RadioButtonList ID="rdoTipo" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellSpacing="5" CellPadding="5">
                                  <asp:ListItem Text="Emergencia" Value="Emergencia" Selected></asp:ListItem>
                                  <asp:ListItem Text="Internação" Value="Internação"></asp:ListItem>
                              </asp:RadioButtonList>
                          </td>
                      </tr>
                  <tr>
                    <td class="celula_table" valign=top>Telefone fixo:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txttelefone" runat="server" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Telefone celular:
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtCelular" runat="server" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top>Observação:
                      </td>
                    <td rowspan="2" class="style1" valign=top>
                      <asp:TextBox ID="txtmensagem" runat="server" Height="130px" TextMode="MultiLine" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table"></td>
                  </tr>
                  <tr id="tr1" runat="server">
                    <td class="celula_table"></td>
                    <td align="right" class="style2">
                      *campos obrigatórios<br />
                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_enviar.png" 
        onclick="btnEnviar_Click" />
                    </td>
                  </tr>
                  <tr>
                      <td colspan="2" class="style2">
                          Este protocolo deverá ser apresentado no momento da retirada do exame.<br /><br />
                          O prazo de entrega previsto é de 3 dias após a solicitação, sempre a partir das 14 horas.<br /><br />
                          <strong>O horário de funcionamento do setor de entrega de exames é de Segunda a Quinta das 8 horas as 18 horas e sexta das 8 horas as 17 horas, não funcionamos aos Sábados, Domingo e Feriados.</strong><br /><br />
                          Para as solicitações de entregas de exames em domicilio, este prazo estende-se para até 5 dias úteis após a data programada para liberação do resultado. A entrega é realizada sempre em horário comercial de segunda a sexta.
                      </td>
                  </tr>
                  <tr id="tr2" runat="server" visible="false">
                    <td align="right" class="style2" colspan="2">
                        <br />
                      Enviar por e-mail para: <asp:TextBox ID="txtEmail2" runat="server" CssClass="text_field"></asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/btn_enviar.png" OnClick="btnEnviar0_Click" />

                    </td>
                  </tr>
                    <tr id="tr3" runat="server" visible="false">
                                              <td class="celula_table" colspan="2">
                      <asp:Image ID="btnImprimir" runat="server" onclick="Imprimir();"  ImageUrl="images/btn_imprimir.png" /></td>

                    </tr>

                </table>
              </div>
  </div>
</div>
</asp:Content>

