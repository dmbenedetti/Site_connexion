<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_saude_HSL_DOR_editar.aspx.cs" Inherits="admincms_ogrupo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" language="javascript">
        //MÁSCARA DE VALORES

        function txtBoxFormat(objeto, sMask, evtKeyPress) {
            var i, nCount, sValue, fldLen, mskLen, bolMask, sCod, nTecla;


            if (document.all) { // Internet Explorer
                nTecla = evtKeyPress.keyCode;
            } else if (document.layers) { // Nestcape
                nTecla = evtKeyPress.which;
            } else {
                nTecla = evtKeyPress.which;
                if (nTecla == 8) {
                    return true;
                }
            }

            sValue = objeto.value;

            // Limpa todos os caracteres de formatação que
            // já estiverem no campo.
            sValue = sValue.toString().replace("-", "");
            sValue = sValue.toString().replace("-", "");
            sValue = sValue.toString().replace(".", "");
            sValue = sValue.toString().replace(".", "");
            sValue = sValue.toString().replace("/", "");
            sValue = sValue.toString().replace("/", "");
            sValue = sValue.toString().replace(":", "");
            sValue = sValue.toString().replace(":", "");
            sValue = sValue.toString().replace("(", "");
            sValue = sValue.toString().replace("(", "");
            sValue = sValue.toString().replace(")", "");
            sValue = sValue.toString().replace(")", "");
            sValue = sValue.toString().replace(" ", "");
            sValue = sValue.toString().replace(" ", "");
            fldLen = sValue.length;
            mskLen = sMask.length;

            i = 0;
            nCount = 0;
            sCod = "";
            mskLen = fldLen;

            while (i <= mskLen) {
                bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/") || (sMask.charAt(i) == ":"))
                bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))

                if (bolMask) {
                    sCod += sMask.charAt(i);
                    mskLen++;
                }
                else {
                    sCod += sValue.charAt(nCount);
                    nCount++;
                }

                i++;
            }

            objeto.value = sCod;

            if (nTecla != 8) { // backspace
                if (sMask.charAt(i - 1) == "9") { // apenas números...
                    return ((nTecla > 47) && (nTecla < 58));
                }
                else { // qualquer caracter...
                    return true;
                }
            }
            else {
                return true;
            }
        }
        // onkeypress="return txtBoxFormat(this, '9', event);"  onclick="this.value='';" MaxLength="3"
</script>
<style type="text/css">
    .style2
    {
        width: 500px;
    }
    .style3
    {
        width: 97px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Espaço Saúde > Saúde com os 
        Hospitais Rede D’Or São Luiz &gt; Editar Audio</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Editar Áudio</h2>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
<p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
    ForeColor="Red" ValidationGroup="saude" />
    <p>
    <asp:Label ID="lbl_erro" runat="server" ForeColor="Red"></asp:Label>
    
        <table class="style2">
            <tr>
                <td class="style3" height="30">
                    Titulo:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Digite um título" 
                        ForeColor="Red" ValidationGroup="saude">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3" height="30" valign="top">
                    Audio:<br />
                    <br />
                    Atual:</td>
                <td valign="top">
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt" />
                    <br />
                    <br />
                    <asp:Label ID="lbl_audio" runat="server" Text=""></asp:Label>                    
                </td>
            </tr>
            <tr>
                <td class="style3" height="30">
                    Tema:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList1" ErrorMessage="Escolha um tema " 
                        ForeColor="Red" ValidationGroup="saude">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txt" 
                        DataSourceID="SqlDataSource1" DataTextField="nm_tema" DataValueField="id_tema">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
                        SelectCommand="SELECT [id_tema], [nm_tema] FROM [TB_PORTAL_TEMA] WHERE ([id_status] = @id_status)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style3" height="30">
                    Especialista<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        runat="server" ControlToValidate="DropDownList2" 
                        ErrorMessage="Escolha o especialista" ForeColor="Red" ValidationGroup="saude">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="txt" 
                        DataSourceID="SqlDataSource2" DataTextField="nm_especialista" 
                        DataValueField="id_especialista">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
                        SelectCommand="SELECT [id_especialista], [nm_especialista] FROM [TB_PORTAL_ESPECIALISTA] WHERE ([id_status] = @id_status)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style3" height="30">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#666666" ForeColor="White" 
                        Height="24px" onclick="Button1_Click1" Text="Gravar" ValidationGroup="saude" 
                        Width="80px" />
                </td>
            </tr>
</table>
    <p>&nbsp;</p>
    <p>
    
        <asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="30px" PostBackUrl="portal_saude_HSL_DOR.aspx" 
            Text="Voltar" Width="77px" />
</p>
</asp:Content>

