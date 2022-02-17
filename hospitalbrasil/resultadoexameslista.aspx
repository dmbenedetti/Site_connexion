<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="resultadoexameslista.aspx.cs" Inherits="resultadoexameslista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/style_veus_laudo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function AbrirExame(idExame) {
            window.open("ResultadoExame.aspx?d=" + idExame.toString(), "ResultadoExame", "width=800,height=600,top=10,left=0,statusbar=no;location=1,status=1,scrollbars=1", "");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width='810' border='0' cellspacing='0' cellpadding='1' align='center'>
        <tr>
            <td align='left' height="30">
                <br />
                <font size="3"><b>
                    <asp:Literal ID="ltlCliente" runat="server"></asp:Literal></b></font>
            </td>
        </tr>
    </table>
    <br>
    <table width='810' border='0' cellspacing='4' cellpadding='1' align='center'>
        <tr valign="top">
            <td valign="top">
                <asp:Repeater ID="rptExames" runat="server">
                    <HeaderTemplate>
                        <table width='500' border='0' cellspacing='0' cellpadding='0' align='center'>
                            <tr valign="middle" class='backgroud_top'>
                                <td align='center' colspan="8" bgcolor='#d6d6d6'>
                                    <img alt="" border="0" src='images/box_top_600.gif'>
                                </td>
                            </tr>
                            <tr valign="middle">
                                <!-- Certificado do Laudo -->
                                <td align='left' width='20' class='titulo_novo' nowrap>
                                    &nbsp;<img alt="" border="0" src='images/gap.gif'>
                                </td>
                                <!-- Imagem da carta -->
                                <td align='left' width='20' class='titulo_novo' nowrap>
                                    &nbsp;<img alt="" border="0" src='images/email.png'>
                                </td>
                                <!-- Data de Atendimento -->
                                <td align='left' width='200' class='titulo_novo'>
                                    DATA DO ATENDIMENTO
                                </td>
                                <!-- Nome Medico -->
                                <td align='left' class='titulo_novo'>
                                    NOME DO MÉDICO
                                </td>
                                <!-- CRM Medico -->
                                <td align='left' width='100' class='titulo_novo'>
                                    CRM
                                </td>
                                <!-- Laudo -->
                                <td align='center' width='10' class='titulo_novo'>
                                    <!--img alt="" border="0" src='images/page.png'-->
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <FooterTemplate>
                        <tr valign="middle">
                            <!-- Imagem da carta -->
                            <td align='left' colspan="7" class='rodape_novo'>
                                &nbsp;&nbsp;<asp:Literal ID="ltlLaudos" runat="server"></asp:Literal> Laudo(s) disponível(eis)
                            </td>
                        </tr>

                        <tr valign="middle" class='backgroud_top'>
                            <td align='center' colspan="10" bgcolor='#E7E7E7'>
                                <img alt="" border="0" src='images/box_bot_600.gif'>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                    <ItemTemplate>
                        <tr valign="middle">
                            <td valign="middle" align='center' style="cursor:pointer;" width="25" class='linha_novo' onclick='<%# "AbrirExame(" + Eval("id_exame_ficha").ToString() + ")" %>'>
                                    <img alt="" border="0" src='images/gap.gif'>
                            </td>
                            <td valign="middle" align='center' style="cursor:pointer;" width="25" class='linha_novo' onclick='<%# "AbrirExame(" + Eval("id_exame_ficha").ToString() + ")" %>'>
                                    <img alt="" border="0" src='images/email.png'></a>
                            </td>
                            <td valign="middle" align='left' style="cursor:pointer;" width='200' class='linha_novo' onclick='<%# "AbrirExame(" + Eval("id_exame_ficha").ToString() + ")" %>'>
                                    <%# Convert.ToDateTime(Eval("dt_exame")).ToString("dd/MM/yyyy") %>&nbsp;
                            </td>
                            <td valign="middle" align='left' style="cursor:pointer;" class='linha_novo' onclick='<%# "AbrirExame(" + Eval("id_exame_ficha").ToString() + ")" %>'>
                                    <%# Eval("Medico") %>&nbsp;
                            </td>
                            <td valign="middle" align='left' style="cursor:pointer;" width='100' class='linha_novo' onclick='<%# "AbrirExame(" + Eval("id_exame_ficha").ToString() + ")" %>'>
                                    <%# Eval("crm") %>&nbsp;
                            </td>
                            <td valign="middle" align='center' style="cursor:pointer;" width='10' class='linha_novo' onclick='<%# "AbrirExame(" + Eval("id_exame_ficha").ToString() + ")" %>'>
                                    <img border="0" src='images/page.png' alt='Laudo Completo'>
                           </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
    </table>
</asp:Content>
