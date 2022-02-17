<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_programetes.aspx.cs" Inherits="admincms_ogrupo" %>

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
            width: 920px;
        }
        .style3
        {
            width: 663px;
        }
        .style4
        {
            width: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Espaço Saúde > Programetes da Discovery</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Programetes da Discovery</h2>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
<p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="suaSaude" />
    <p>
    <asp:Label ID="lbl_erro" runat="server" ForeColor="Red"></asp:Label>
    
        <p>
            &nbsp;</p>
    <p>
        <strong>Texto da página:</strong></p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Height="112px" 
            TextMode="MultiLine" Width="903px"></asp:TextBox>
    </p>
    <p>
        <br />
        <asp:Button ID="btn_texto" runat="server" BackColor="#666666" ForeColor="White" 
            Height="30px" Text="Alterar Texto" 
            Width="95px" onclick="btn_texto_Click" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        ______________________________________________________________________________________________________________________________________</p>
    <p>
        &nbsp;</p>
    <p>
        <strong>Video Destaque: </strong></p>
    
        <table class="style2">
            <tr>
                <td class="style4" height="30">
                    Titulo:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Digite o título do vídeo" 
                        ForeColor="Red" ValidationGroup="saude">*</asp:RequiredFieldValidator>
                </td>
                <td height="30">
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txt" Width="400px"></asp:TextBox>
                </td>
                <td class="style2" rowspan="2">
                    <asp:Literal ID="ltr_video" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="style4" height="30">
                    Vídeo:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Digite o embed do video" 
                        ForeColor="Red" ValidationGroup="saude">*</asp:RequiredFieldValidator>
                </td>
                <td height="30">
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" Width="400px" 
                        Height="130px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3" height="30" colspan="3">
                    <asp:Button ID="Button3" runat="server" BackColor="#666666" ForeColor="White" 
                        Height="26px" onclick="Button3_Click" Text="Alterar Video Destaque" ValidationGroup="saude" 
                        Width="183px" />
                </td>
                <td class="style3" height="30">
                    &nbsp;</td>
            </tr>
</table>
    <p>
        ______________________________________________________________________________________________________________________________________</p>
    <p>
        &nbsp;</p>
    <p>
        <strong>Videos </strong></p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" ForeColor="White" 
            Height="30px" PostBackUrl="portal_programetes_criar.aspx" Text="Novo Vídeo" 
            Width="95px" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_programete" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="nm_titulo" HeaderText="Título">
                <HeaderStyle Height="30px" HorizontalAlign="Left" />
                <ItemStyle Height="30px" Width="350px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="id_programete" 
                    DataNavigateUrlFormatString="portal_programetes_editar.aspx?id={0}" 
                    Text="Editar">
                <ItemStyle HorizontalAlign="Center" Width="60px" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="id_programete" 
                    DataNavigateUrlFormatString="portal_programetes_excluir.aspx?id={0}" 
                    Text="Excluir">
                <ItemStyle HorizontalAlign="Center" Width="60px" />
                </asp:HyperLinkField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
    
        <asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="30px" PostBackUrl="portal_espaco_saude.aspx" 
            Text="Voltar" Width="77px" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

