<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="hospitais_ps.aspx.cs" Inherits="admincms_hospitais_especialidades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 97px;
        }
        .auto-style2 {
            width: 97px;
            height: 31px;
        }
        .auto-style3 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Pronto Socorro</strong></p>
    <p></p>
    <h2>&nbsp;</h2>
    <h2>Emergência</h2>
    <p></p>
    <p>
        <table border="0" style="width: 596px">
            <tr>
                <td class="auto-style2">Emergência:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_emergencia" ErrorMessage="Campo emergência obrigatório" ForeColor="Red" ValidationGroup="emergencia">*</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style3" width="521">
        <asp:TextBox ID="txt_emergencia" runat="server" CssClass="txt" Width="271px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" height="30">Descrição: </td>
                <td>
        <asp:TextBox ID="txt_descricao" runat="server" CssClass="txt" Width="271px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" height="30">&nbsp;</td>
                <td><asp:Button ID="btn_gravar" runat="server" CssClass="txt" Text="Gravar" Height="31px" OnClick="btn_gravar_Click" ValidationGroup="emergencia" Width="75px" />
                    <br />
                    <asp:Label ID="lbl_msg" runat="server" Font-Bold="True" Font-Size="14px" ForeColor="#006600"></asp:Label>
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="emergencia" />
                </td>
            </tr>
        </table>
    </p>
    <p></p>
    <p>&nbsp;&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gdv_emergencia" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_prontosocorro" DataSourceID="ds_emergencia" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                    <ItemStyle Height="30px" HorizontalAlign="Center" Width="150px" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Emergência" SortExpression="nm_prontosocorro">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Height="26px" Text='<%# Bind("nm_prontosocorro") %>' Width="197px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nm_prontosocorro") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Height="30px" HorizontalAlign="Left" />
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descrição" SortExpression="ds_prontosocorro">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" Height="26px" Text='<%# Bind("ds_prontosocorro") %>' Width="497px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ds_prontosocorro") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="500px" />
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="ds_emergencia" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" DeleteCommand="UPDATE [TB_PRONTOSOCORRO] SET [id_status] = 2 WHERE [id_prontosocorro] = @original_id_prontosocorro" InsertCommand="INSERT INTO [TB_PRONTOSOCORRO] ([nm_prontosocorro], [ds_prontosocorro]) VALUES (@nm_prontosocorro, @ds_prontosocorro)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id_prontosocorro], [nm_prontosocorro], [ds_prontosocorro] FROM [TB_PRONTOSOCORRO] WHERE ([id_status] = @id_status)" UpdateCommand="UPDATE [TB_PRONTOSOCORRO] SET [nm_prontosocorro] = @nm_prontosocorro, [ds_prontosocorro] = @ds_prontosocorro WHERE [id_prontosocorro] = @original_id_prontosocorro">
                <DeleteParameters>
                    <asp:Parameter Name="id_status" />
                    <asp:Parameter Name="original_id_prontosocorro" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nm_prontosocorro" Type="String" />
                    <asp:Parameter Name="ds_prontosocorro" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nm_prontosocorro" Type="String" />
                    <asp:Parameter Name="ds_prontosocorro" Type="String" />
                    <asp:Parameter Name="original_id_prontosocorro" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
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

