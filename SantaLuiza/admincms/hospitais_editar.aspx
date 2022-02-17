<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="hospitais_editar.aspx.cs" Inherits="admincms_hospitais_editar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 129px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Hospitais > <asp:Label ID="lbl_hospital" runat="server" Text=""></asp:Label></strong></p>

   <p>&nbsp;</p>
    <h2>Dados do Hospital</h2>
    <p></p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
    ForeColor="Red" ValidationGroup="hospital" />
    <p>
        <table border="0" width="700">
            <tr>
                <td class="auto-style1" height="30" valign="top">Nome do Hospital: 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_nome" 
                        ErrorMessage="Campo nome do Hospital é obrigatório" ForeColor="Red" 
                        ValidationGroup="hospital">*</asp:RequiredFieldValidator>
                </td>
                <td valign="top" width="521">
                    <asp:TextBox ID="txt_nome" runat="server" CssClass="txt" MaxLength="100" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" height="30" valign="top">Descrição: </td>
                <td valign="top">
                    <asp:TextBox ID="txt_descricao" runat="server" CssClass="txt" Height="138px" TextMode="MultiLine" Width="556px"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1" height="30" valign="top">Site:</td>
                <td valign="top">
                    <asp:TextBox ID="txt_site" runat="server" CssClass="txt" MaxLength="250" Width="556px">http://</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" height="30" valign="top">Estado: 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="drp_Estado" ErrorMessage="Campo estado é obrigatório" 
                        ForeColor="Red" ValidationGroup="hospital">*</asp:RequiredFieldValidator>
                </td>
                <td valign="top">
                    <asp:DropDownList ID="drp_Estado" runat="server" CssClass="txt" DataSourceID="ds_estados" DataTextField="ds_uf_nome" DataValueField="cd_uf" OnPreRender="drp_Estado_PreRender" Width="250px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ds_estados" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" SelectCommand="SELECT [cd_uf], [ds_uf_nome] FROM [uf]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" height="30" valign="top">Endereço:</td>
                <td valign="top">
                    <asp:TextBox ID="txt_endereco" runat="server" CssClass="txt" MaxLength="250" Width="556px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" height="30" valign="top">Telefone:</td>
                <td valign="top">
                    <asp:TextBox ID="txt_telefone" runat="server" CssClass="txt" MaxLength="100" Width="250px"></asp:TextBox>
                </td>
            </tr>
            </table>
    </p>
    <p>&nbsp;</p>
<p><strong>Especialidades</strong></p>
<p>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
<p>
    <asp:CheckBoxList ID="chb_especialidades" runat="server" CellSpacing="4" RepeatColumns="5" Width="900px">
    </asp:CheckBoxList>
    </p>
    <p>&nbsp;</p>
    <p><strong>Exames</strong></p>
    <asp:CheckBoxList ID="chb_exames" runat="server" CellSpacing="4" RepeatColumns="2" Width="900px">
    </asp:CheckBoxList>
    <p>&nbsp;</p>
    <p><strong>Pronto Socorro</strong></p>
    <asp:CheckBoxList ID="chb_ps" runat="server" CellSpacing="4" RepeatColumns="2" Width="703px">
    </asp:CheckBoxList>
    <p>&nbsp;</p>
    <p>
        <asp:Button ID="btn_gravar" runat="server" Height="32px" 
            OnClick="btn_gravar_Click" Text="Gravar" Width="126px" BackColor="#666666" 
            Font-Bold="True" ForeColor="White" ValidationGroup="hospital" />
    </p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
<p>
        <input id="btn_voltar" class="btn" onclick="history.back();" type="button" 
            value="« Voltar" /><br />
    </p>

</asp:Content>

