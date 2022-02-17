<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="hospitais_menu_ordem.aspx.cs" Inherits="admincms_hospitais_especialidades" %>

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
    <p><strong>Portal Rede D'or > Ordenar Menus</strong></p>
    <p></p>
    <h2>&nbsp;</h2>
<h2>Ordenar Menus</h2>
    <p></p>
<p>
    <table border="0" style="width: 596px">
        <tr>
            <td class="auto-style2">Menu:
            </td>
            <td class="auto-style3" width="521">
                <asp:DropDownList ID="drpMenu" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpMenu_SelectedIndexChanged">
                    <asp:ListItem Value="8" Text="O Hospital"></asp:ListItem>
                    <asp:ListItem Value="9" Text="Serviços"></asp:ListItem>
                    <asp:ListItem Value="5" Text="Imprensa"></asp:ListItem>
                    <asp:ListItem Value="7" Text="Profissionais da Saúde"></asp:ListItem>
                </asp:DropDownList>
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
        <asp:GridView ID="gdv_especialidade" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_pagina" DataSourceID="ds_especialidades" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Página">
                    <ItemTemplate>
                        <div><asp:Literal ID="ltl1" runat="server" Text='<%# Tipo(Eval("id_tipo")) %>'></asp:Literal><asp:Label ID="Label1" runat="server" Text='<%# Bind("nm_nome") %>'></asp:Label></div>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Height="30px" Width="410px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ordem">
                    <ItemTemplate>
                        <asp:HiddenField ID="idPagina" runat="server" Value='<%# Bind("id_pagina") %>'></asp:HiddenField>
                        <asp:HiddenField ID="idTipo" runat="server" Value='<%# Bind("id_tipo") %>' />
                        <asp:TextBox ID="txtOrdem" runat="server" Text='<%# Bind("nu_ordem") %>'></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle Height="30px" HorizontalAlign="Left" />
                    <ItemStyle Width="610px" />
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
    </ContentTemplate>
</asp:UpdatePanel>
<p>
    </p>
    <p>
        <asp:SqlDataSource ID="ds_especialidades" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" SelectCommand="SELECT b.id_sessao, b.id_conteudo id_pagina, b.nm_titulo nm_nome, ISNULL(a.nu_ordem, 99) nu_ordem, 1 id_tipo from TB_PORTAL_MENU_ORDEM a RIGHT OUTER JOIN TB_PORTAL_CONTEUDO b ON a.id_pagina = b.id_conteudo  and (a.id_tipo IS NULL OR a.id_tipo = 1)WHERE b.id_sessao = @idSessao AND ds_visivel = 1 AND b.id_hospital = @idHosp and b.id_tipo IN (1,2,3,10) and b.id_status = 1 UNION SELECT c.id_sessao, c.id_pagina_fixa id_pagina, c.ds_titulo nm_nome, ISNULL(a.nu_ordem, 1) nu_ordem, 3 id_tipo from 	TB_PORTAL_MENU_ORDEM a 	RIGHT OUTER JOIN TB_CONTEUDO_PAGINA_FIXA c ON a.id_pagina = c.id_pagina_fixa and (a.id_tipo IS NULL OR a.id_tipo = 3)WHERE c.id_sessao = @idSessao and c.id_hospital = @idHosp  order by nu_ordem">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpMenu" Name="idSessao" />
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" DbType="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
<p>
        &nbsp;</p>
<p>
        <asp:LinkButton ID="btnGravar" runat="server" Text="Gravar" CssClass="btn" OnClick="btnGravar_Click" /><br />
</p>
</asp:Content>

