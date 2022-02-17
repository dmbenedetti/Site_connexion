<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form2.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

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
        height: 39px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <br />
            <div><asp:Literal ID="ltlResumo" runat="server"></asp:Literal></div>
            <div style="font:Tahoma, arial, verdana; color:#666666;">
<table width="500" height="683" border="0" cellpadding="0" cellspacing="0"  align="center">
  <tr>
    <td colspan="2" class="celula_table">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <strong>
        <br />
        Dados Pessoais</strong></td>
  </tr>
  <tr>
    <td width="142" class="celula_table">Nome:*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" ControlToValidate="txt_nome" ErrorMessage="Digite um nome">*</asp:RequiredFieldValidator>
      </td>
    <td width="358" class="celula_table">
        <asp:TextBox ID="txt_nome" runat="server" Width="342px" CssClass="txt" 
            MaxLength="250"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">Data Nascimento:*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            runat="server" ControlToValidate="data_dia" 
            ErrorMessage="Digite um dia para data de nascimento">*</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="data_mes" 
            ErrorMessage="Digite um mes para data de nascimento">*</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="data_ano" 
            ErrorMessage="Digite um ano para data de nascimento">*</asp:RequiredFieldValidator>
                                </td>
    <td class="celula_table">
        <asp:TextBox ID="data_dia" runat="server" Width="41px" CssClass="txt" 
            MaxLength="2"></asp:TextBox>
                                &nbsp;/
        <asp:TextBox ID="data_mes" runat="server" Width="41px" CssClass="txt" 
            MaxLength="2"></asp:TextBox>
                                &nbsp;/
        <asp:TextBox ID="data_ano" runat="server" Width="41px" CssClass="txt" 
            MaxLength="4"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">Sexo:</td>
    <td class="celula_table">
        <asp:RadioButtonList ID="rdo_sexo" runat="server" Height="20px" 
            RepeatDirection="Horizontal" Width="204px">
            <asp:ListItem>Masculino</asp:ListItem>
            <asp:ListItem>Feminino</asp:ListItem>
        </asp:RadioButtonList>
      </td>
  </tr>
  <tr>
    <td class="style1" class="celula_table"><p>Peso:</p>    </td>
    <td class="style1" class="celula_table">
        <asp:TextBox ID="txt_peso" runat="server" Width="41px" CssClass="txt" 
            MaxLength="5"></asp:TextBox>
                                kg</td>
  </tr>
  <tr>
    <td class="celula_table">E-mail:*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="txt_email" ErrorMessage="Digite um email">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txt_email" ErrorMessage="Digite um e-mail válido" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
      </td>
    <td class="celula_table">
        <asp:TextBox ID="txt_email" runat="server" Width="342px" CssClass="txt" 
            MaxLength="250"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">Telefone Residencial:</td>
    <td class="celula_table">(<asp:TextBox ID="txt_ddd_res" runat="server" Width="41px" CssClass="txt" 
            MaxLength="2"></asp:TextBox>
                                )&nbsp;
        <asp:TextBox ID="txt_tel_res" runat="server" Width="167px" CssClass="txt" 
            MaxLength="9"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">Telefone Celular:</td>
    <td class="celula_table">(<asp:TextBox ID="txt_ddd_cel" runat="server" Width="41px" CssClass="txt" 
            MaxLength="2"></asp:TextBox>
                                )&nbsp;
        <asp:TextBox ID="txt_tel_cel" runat="server" Width="167px" CssClass="txt" 
            MaxLength="9"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">Telefone Comercial:</td>
    <td class="celula_table">(<asp:TextBox ID="txt_ddd_com" runat="server" Width="41px" CssClass="txt" 
            MaxLength="2"></asp:TextBox>
                                )&nbsp;
        <asp:TextBox ID="txt_tel_com" runat="server" Width="167px" CssClass="txt" 
            MaxLength="9"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">&nbsp;</td>
    <td class="celula_table">&nbsp;</td>
  </tr>
  <tr>
    <td class="celula_table"><strong>Dados Assistenciais</strong></td>
    <td class="celula_table">&nbsp;</td>
  </tr>
  <tr>
    <td class="celula_table">Convênio Médico:</td>
    <td class="celula_table">
        <asp:TextBox ID="txt_convenio" runat="server" Width="342px" CssClass="txt" 
            MaxLength="250"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">Plano/Produto:</td>
    <td class="celula_table">
        <asp:TextBox ID="txt_plano" runat="server" Width="342px" CssClass="txt" 
            MaxLength="250"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td class="celula_table">&nbsp;</td>
    <td class="celula_table">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" class="celula_table"><strong>Dados do Exame / Consulta</strong></td>
  </tr>
  <tr>
    <td colspan="2" class="celula_table"> Nome(s) do Exame(s) e/ou Consulta(Especialidade) </td>
  </tr>
  <tr>
    <td height="99" colspan="2" class="celula_table">
        <asp:TextBox ID="txt_exames" runat="server" Width="342px" CssClass="txt" 
            Height="78px" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                                </td>
  </tr>
  <tr>
    <td colspan="2" class="celula_table"><strong>Dados do Agendamento</strong></td>
  </tr>
  <tr>
    <td class="celula_table"> Data Pretendida: </td>
    <td class="celula_table">
        <asp:DropDownList ID="drp_data_dia" runat="server" CssClass="txt" 
            Height="20px" Width="70px">
            <asp:ListItem>--Dia--</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>26</asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>31</asp:ListItem>
        </asp:DropDownList>
                                &nbsp;/
        <asp:DropDownList ID="drp_data_mes" runat="server" CssClass="txt" 
            Height="20px" Width="120px">
            <asp:ListItem>--Mês--</asp:ListItem>
            <asp:ListItem>Janeiro</asp:ListItem>
            <asp:ListItem>Fevereiro</asp:ListItem>
            <asp:ListItem>Março</asp:ListItem>
            <asp:ListItem>Abril</asp:ListItem>
            <asp:ListItem>Maio</asp:ListItem>
            <asp:ListItem>Junho</asp:ListItem>
            <asp:ListItem>Julho</asp:ListItem>
            <asp:ListItem>Agosto</asp:ListItem>
            <asp:ListItem>Setembro</asp:ListItem>
            <asp:ListItem>Outubro</asp:ListItem>
            <asp:ListItem>Novembro</asp:ListItem>
            <asp:ListItem>Dezembro</asp:ListItem>
        </asp:DropDownList>
                                &nbsp;/
        <asp:DropDownList ID="drp_data_ano" runat="server" CssClass="txt" 
            Height="20px" Width="70px">
            <asp:ListItem>--Ano--</asp:ListItem>
          <asp:ListItem>2012</asp:ListItem>
            <asp:ListItem>2013</asp:ListItem>
            <asp:ListItem>2014</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2019</asp:ListItem>
            <asp:ListItem>2020</asp:ListItem>
        </asp:DropDownList>
                                </td>
  </tr>
  <tr>
    <td class="celula_table"> Período: </td>
    <td class="celula_table">
        <asp:RadioButtonList ID="rdo_periodo" runat="server" Height="24px" 
            RepeatDirection="Horizontal" Width="181px">
            <asp:ListItem>Manhã</asp:ListItem>
            <asp:ListItem>Tarde</asp:ListItem>
        </asp:RadioButtonList>
      </td>
  </tr>
  <tr>
    <td class="celula_table">
        <asp:ImageButton ID="ImageButton2" runat="server" 
            ImageUrl="~/images/btn_enviar.png" onclick="ImageButton2_Click" />
      </td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
</asp:Content>

