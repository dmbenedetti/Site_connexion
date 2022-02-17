<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_saude_HSL_DOR_temas.aspx.cs" Inherits="admincms_ogrupo" %>

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
        Hospitais Rede D’Or São Luiz>Temas</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
    <table cellpadding="0" cellspacing="0" >
        <tr>
            <td class="style2" colspan="3">
                <h3>
                    Tema:
                </h3>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txt_setor" Display="Dynamic" 
                    ErrorMessage="Campo obrigatório" ForeColor="Red" ValidationGroup="setor"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Inserir:</td>
            <td >
                <asp:TextBox ID="txt_setor" runat="server" CssClass="txt" Width="250px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td width="160">
                &nbsp; &nbsp;<asp:Button ID="btn_gravar_reazon2" runat="server" BackColor="#666666" 
                    ForeColor="White" Height="26px" onclick="btn_gravar_reazon2_Click" 
                    Text="Gravar" ValidationGroup="setor" Width="57px" />
                </td>
        </tr>
    </table>
    <br />
    <p>
        <asp:GridView ID="gdv_setor" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_tema" DataSourceID="ds_setor" 
            EmptyDataText="Nenhum valor encontrado" ForeColor="Black" GridLines="Vertical" 
            Width="432px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            onclientclick="return confirm('Você tem certeza que deseja excluir este registro?')" 
                            Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Height="30px" HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>
                <asp:BoundField DataField="nm_tema" HeaderText="Tema" 
                    SortExpression="nm_tema">
                <HeaderStyle Height="30px" HorizontalAlign="Left" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="ds_setor" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            DeleteCommand="UPDATE [TB_PORTAL_TEMA] SET [id_status] = 2  WHERE [id_tema] = @original_id_tema " 
            InsertCommand="INSERT INTO [TB_PORTAL_TEMA] ([nm_tema], [id_status]) VALUES (@nm_tema, @id_status)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [id_tema], [nm_tema], [id_status] FROM [TB_PORTAL_TEMA] WHERE ([id_status] = @id_status)" 
            UpdateCommand="UPDATE [TB_PORTAL_TEMA] SET [nm_tema] = @nm_tema  WHERE [id_tema] = @original_id_tema ">
            <DeleteParameters>
                <asp:Parameter Name="original_id_tema" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nm_tema" Type="String" />
                <asp:Parameter Name="id_status" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nm_tema" Type="String" />
                <asp:Parameter Name="original_id_tema" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" ForeColor="White" 
        Height="31px" PostBackUrl="portal_saude_HSL_DOR.aspx" Text="Voltar" 
        Width="79px" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="suaSaude" />
    <p>
    <asp:Label ID="lbl_erro" runat="server" ForeColor="Red"></asp:Label>
    
        <p>
            &nbsp;<p>
        &nbsp;</p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

