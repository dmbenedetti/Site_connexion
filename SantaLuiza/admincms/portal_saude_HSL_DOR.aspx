<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_saude_HSL_DOR.aspx.cs" Inherits="admincms_ogrupo" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Espaço Saúde > Saúde com os 
        Hospitais Rede D’Or São Luiz</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Saúde com os Hospitais Rede D’Or São Luiz</h2>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
<p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="suaSaude" />
    <p>
    <asp:Label ID="lbl_erro" runat="server" ForeColor="Red"></asp:Label>
    
        <p>
            &nbsp;<p>
        <a href="portal_saude_HSL_DOR_temas.aspx">Gerenciar Temas</a>&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;
        <a href="portal_saude_HSL_DOR_especialistas.aspx">Gerenciar Especialistas</a>

        
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" ForeColor="White" 
            Height="30px" PostBackUrl="portal_saude_HSL_DOR_criar.aspx" Text="Novo Áudio" 
            Width="95px" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_saude" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="nm_titulo" HeaderText="Título">
                <HeaderStyle Height="30px" HorizontalAlign="Left" />
                <ItemStyle Height="30px" Width="350px" />
                </asp:BoundField>
                <asp:BoundField DataField="nm_especialista" HeaderText="Especialista">
                <HeaderStyle Height="30px" HorizontalAlign="Left" />
                <ItemStyle Width="250px" />
                </asp:BoundField>
                <asp:BoundField DataField="nm_tema" HeaderText="Tema">
                <HeaderStyle Height="30px" HorizontalAlign="Left" Width="250px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="id_saude" DataNavigateUrlFormatString="portal_saude_HSL_DOR_editar.aspx?id={0}" Text="Editar">
                <ItemStyle HorizontalAlign="Center" Width="60px" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="id_saude" DataNavigateUrlFormatString="portal_saude_HSL_DOR_excluir.aspx?id={0}" Text="Excluir">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            SelectCommand="SELECT [id_saude], [nm_titulo], [id_espedcialista], [id_tema] FROM [TB_PORTAL_SAUDE_HSL_DOR] WHERE ([id_status] = @id_status)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

