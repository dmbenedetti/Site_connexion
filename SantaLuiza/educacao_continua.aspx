<%@ Page Language="C#" MasterPageFile="~/MasterPage_am.master" AutoEventWireup="true"
    CodeFile="educacao_continua.aspx.cs" Inherits="fale_conosco" Title="Hospital e Maternidade Brasil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #contato
        {
            background: url(images/btn_contato_hover.jpg);
        }
        #table_contato
        {
            width: 400px;
        }
        .celula_table
        {
            height: 30px;
            font: 12px Tahoma, Arial, Helvetica, sans-serif;
            color: #666;
            text-align: right;
            width: 388px;
        }
        .celula_table2
        {
            height: 40px;
            width: 300px;
            text-align: left;
        }
        .text_field
        {
            border: solid 1px #849E9F;
            height: 23px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="titulo_pag">
        <h2>
            <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
    </div>
    <br />
    <div>
        <asp:Literal ID="ltlResumo" runat="server"></asp:Literal></div>
    <div style="font: Tahoma, arial, verdana; color: #666666;">
        <table id="table_contato" align="center">
            <tr>
                <td class="celula_table" valign="top" align="left" colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="100" class="celula_table" valign="top">
                    Nome:*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome"
                        ErrorMessage="Preencha o campo nome.">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1" valign="top">
                    <asp:TextBox ID="txtnome" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="100" class="celula_table" valign="top">
                    Registro Profissional:*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="txtregistro" ErrorMessage="Preencha o campo Registro Profissional">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1" valign="top">
                    <asp:TextBox ID="txtregistro" runat="server" Width="300px" CssClass="text_field"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="100" class="celula_table" valign="top">
                    Ocupação:*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="drpOcupacao" ErrorMessage="Selecione uma ocupação">*</asp:RequiredFieldValidator>
                </td>
                <td class="style1" valign="top">
                    <asp:DropDownList ID="drpOcupacao" runat="server">
                        <asp:ListItem Value="" Text="Selecione"></asp:ListItem>
                        <asp:ListItem Value="Médico" Text="Médico"></asp:ListItem>
                        <asp:ListItem Value="Fisioterapeuta" Text="Fisioterapeuta"></asp:ListItem>
                        <asp:ListItem Value="Enfermeiro" Text="Enfermeiro"></asp:ListItem>
                        <asp:ListItem Value="Nutricionista" Text="Nutricionista"></asp:ListItem>
                        <asp:ListItem Value="Outros Profissionais de Saúde" Text="Outros Profissionais de Saúde"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
            <table id="table1" align="center">
            <tr>
                <td class="style1" colspan="2">
                    Unidade da Rede D'Or que você trabalha?:<br />
                    <asp:CheckBoxList ID="chkHospitais" runat="server" DataTextField="nm_hospital" DataValueField="nm_hospital"
                        DataSourceID="ds_hospitais" RepeatLayout="Table" Width="600" RepeatColumns="3" TextAlign="Right">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="ds_hospitais" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
                        SelectCommand="SELECT nm_hospital FROM [TB_HOSPITAL] where id_status = @id_status">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="celula_table">
                </td>
                <td align="right" class="style2">
                    *campos obrigatórios<br />
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_enviar.png"
                        OnClick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
