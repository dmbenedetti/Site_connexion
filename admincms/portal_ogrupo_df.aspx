<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_ogrupo_df.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > O Grupo > Demostrativo Financeiro</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Demostrativo Financeiro</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Novo Demonstrativo" Width="153px" 
        onclick="Button1_Click" />
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="idDemostrativo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <p><span style="font:bold 16px; margin:5px 0;"><strong><%# Eval("dsDemostrativo")%></strong> - Data: <%# Eval("dtDemonstrativo") %></p>
                <p><a href="portal_ogrupo_df_editar.aspx?id=<%# Eval("idDemostrativo") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="portal_ogrupo_df_excluir.aspx?id=<%# Eval("idDemostrativo") %>">Excluir</a>
                <div style="clear:both"></div>
             </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
                <asp:DataPager ID="ItemDataPager" runat="server" PageSize="15">
        <Fields>
             <asp:NumericPagerField ButtonCount="8" />
        </Fields>
    </asp:DataPager> 
            </LayoutTemplate>
        </asp:ListView>
    </p>
     <p>
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT [idDemostrativo], [dsDemostrativo], ISNULL(dtDemonstrativo, GETDATE()) dtDemonstrativo FROM [TB_DEMOSTRATIVO_FINANCEIRO] WHERE ([idStatus] = @id_status) order by dsDemostrativo asc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

