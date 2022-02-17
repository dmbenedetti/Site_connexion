<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="formulario_exames.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D&#39;or &gt; Solicitação de exames </strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2><strong>Solicitação de exames de imagens e analises clínicas</strong></h2>
    <p>&nbsp;</p>
    <p>Data Inicio e Fim da data de solicitação (dd/mm/aaaa): <asp:TextBox ID="txtDataInicio" CssClass="txt" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDataInicio" Text="*"></asp:RequiredFieldValidator> e <asp:TextBox CssClass="txt" ID="txtDataFim" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDataFim" Text="*" /> <asp:Button ID="btnOK" Text="Buscar" runat="server" /></p>
    <p><span style="cursor:pointer; text-decoration: underline; color:blue;" onclick="window.open('formularioExport.aspx?txtDataInicio=' + $('#ContentPlaceHolder1_txtDataInicio').val() + '&txtDataFim=' + $('#ContentPlaceHolder1_txtDataFim').val(), 'excel')">Exportar para arquivo xls</span></p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_exames_imagem" DataSourceID="ds_paginas" 
            ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id_exames_imagem" HeaderText="Protoco" 
                    SortExpression="id_exames_imagem">
                <HeaderStyle Height="30px" HorizontalAlign="Left" Width="80px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_nome" HeaderText="Solicitante"
                    SortExpression="ds_nome">
                <HeaderStyle Height="30px" HorizontalAlign="Left" Width="400px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="dt_Atendimento" DataFormatString="{0:Y}" HeaderText="Data do Exame" 
                    SortExpression="ds_nome">
                <HeaderStyle Height="30px" HorizontalAlign="Left" Width="120px" />
                <ItemStyle Height="30px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Some Column Text" ItemStyle-Font-Underline="true">
                    <ItemTemplate>
                       <a href="#" onclick="window.open('formulario_exames_protocolo.aspx?id=<%# Eval("id_exames_imagem")%>','protocolo','width=600,height=600, top=100, left=100')">visualizar</a>
                     </ItemTemplate>
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
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            SelectCommand="SELECT 0 id_conteudo, * FROM TB_FORMULARIO_EXAMES WHERE id_hospital = @idHosp AND (@dtStart IS NULL OR dt_solicitacao >= @dtStart) and (@dtEnd is null OR dt_solicitacao <= DATEADD(day, 1, @dtEnd))" >
            <SelectParameters>
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
                <asp:ControlParameter ControlID="txtDataFim" Name="dtEnd" DbType="DateTime" ConvertEmptyStringToNull="true" />
                <asp:ControlParameter ControlID="txtDataInicio" Name="dtStart" DbType="DateTime" ConvertEmptyStringToNull="true" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

