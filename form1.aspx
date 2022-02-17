<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="form1.aspx.cs" Inherits="fale_conosco" Title="Rede D'Or São Luiz" %>

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
/*width:388px;*/
    }
.celula_table2{
height:40px;
width:300px;
text-align:left;
}
.text_field{
    width:300px;
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
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
            <br />
            <div><asp:Literal ID="ltlResumo" runat="server"></asp:Literal></div>
            <div style="font:Tahoma, arial, verdana; color:#666666;">
              <div align="center">
                <table id="table_contato" align=center>
                  <tr>
                    <td class="celula_table" valign=top align="left" colspan="2">
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                      </td>
                  </tr>
                  <tr>
                    <td width="100" class="celula_table" valign=top><div align="left">Nome:*</div>                      <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnome" 
        ErrorMessage="Preencha o campo nome.">
                        <div align="left">*</div>
                      </asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtnome" runat="server" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top><div align="left">Email:*</div>                      <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail" 
        ErrorMessage="Preencha o campo email.">
                        <div align="left">*</div>
                      </asp:RequiredFieldValidator>
                      </td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txtemail" runat="server" CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top><div align="left">Telefone:
                      </div></td>
                    <td class="style1" valign=top>
                      <asp:TextBox ID="txttelefone" runat="server" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top colspan="2">
                        <div align="left">
                          <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                              <td align=left>&nbsp;&nbsp;
                                <div align="justify">Estado:
                                </div>                                <asp:DropDownList AutoPostBack="true" CausesValidation="false" ID="drpEstado" runat="server" CssClass="text_field" datasourceid="ds_estados" DataTextField="ds_uf_sigla" DataValueField="ds_uf_sigla" ></asp:DropDownList></td>
                              <td align=left>&nbsp;&nbsp;&nbsp;&nbsp;
                                <div align="justify">Unidade:
                                </div>                                
                                <asp:DropDownList ID="drpUnidade" runat="server" CssClass="text_field" datasourceid="ds_hospital" DataTextField="nm_hospital" DataValueField="nm_hospital"></asp:DropDownList></td>
                              <td align=left>&nbsp;&nbsp;&nbsp;&nbsp;
                                <div align="justify">Departamento:
                                </div>                                <asp:DropDownList ID="drpDepartamento" runat="server" CssClass="text_field">
                              <%--    <asp:ListItem Text="Selecione" Value=""></asp:ListItem>--%>
                                  <asp:ListItem Text="Ouvidoria" Value="Ouvidoria"></asp:ListItem>
                               <%--   <asp:ListItem Text="Compras" Value="Compras"></asp:ListItem>--%>
                                 <%-- <asp:ListItem Text="Marketing" Value="Marketing"></asp:ListItem>--%>
                              </asp:DropDownList></td>
                            </tr>
                            <tr>
                              <td><div align="justify"><br />
                                <br />
                              </div></td>
                              <td><div align="justify"><br />
                                <br />
                              </div></td>
                              <td><div align="justify"><br />
                                <br />
                              </div></td>
                            </tr>
                            </table> 
                      </div></td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top><div align="left">Assunto*:</div>                      <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator3" runat="server" ControlToValidate="drpAssunto" 
        ErrorMessage="Preencha o campo assunto">
                        <div align="left">*</div>
                    </asp:RequiredFieldValidator> </td>
                    <td class="style1" valign=top>
                      <asp:DropDownList ID="drpAssunto" runat="server" CssClass="text_field">
                        <asp:ListItem Text="Selecione" Value=""></asp:ListItem>
                        <asp:ListItem Text="Dúvida" Value="Dúvida"></asp:ListItem>
                        <asp:ListItem Text="Crítica" Value="Crítica"></asp:ListItem>
                        <asp:ListItem Text="Sugestão" Value="Sugestão"></asp:ListItem>
                        <asp:ListItem Text="Elogio" Value="Elogio"></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table" valign=top><div align="left">Mensagem:*</div>                      <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmensagem" 
        ErrorMessage="Preencha o campo mensagem">
                        <div align="left">*</div>
                      </asp:RequiredFieldValidator>
                      </td>
                    <td rowspan="2" class="style1" valign=top>
                      <asp:TextBox ID="txtmensagem" runat="server" Height="130px" TextMode="MultiLine" 
        CssClass="text_field"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                    <td class="celula_table"><div align="left"></div></td>
                  </tr>
                  <tr>
                    <td class="celula_table"><div align="left"></div></td>
                    <td align="right" class="style2">
                      <div align="left">*campos obrigatórios<br />
                      </div>
                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/btn_enviar.png" 
        onclick="ImageButton1_Click" />
                    </td>
                  </tr>
                </table>
              </div>
  </div>
      <asp:SqlDataSource ID="ds_estados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
        SelectCommand="SELECT 'Selecione' ds_uf_sigla, '' as ds_uf_nome UNION SELECT ds_uf_sigla, ds_uf_nome from uf ORDER BY ds_uf_nome">
    </asp:SqlDataSource>
      <asp:SqlDataSource ID="ds_hospital" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
        SelectCommand="SELECT 0 id_hospital,  'Selecione' as nm_hospital UNION SELECT id_hospital, nm_hospital from TB_HOSPITAL a INNER JOIN UF b ON a.id_estado = b.cd_uf  where id_status = 1 and (@Estado = '' OR b.ds_uf_sigla = @Estado) ORDER BY id_hospital">
        <SelectParameters>
            <asp:ControlParameter ControlID="drpEstado" PropertyName="SelectedValue" Name="Estado" DbType="String" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

