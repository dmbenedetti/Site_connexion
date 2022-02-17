<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="servicos_consultorios_medicos.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Serviços > Consultórios Especializados > Medicos</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Médicos</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Novo Médico" Width="153px" 
        onclick="Button1_Click" />
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

        &nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="idMedico_Consultorios" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <p><%# Eval("dsNome")%></p>
                <p>Info: <%# Eval("dsInfo")%></p>
                <p><a href="servicos_consultorios_medicos_editar.aspx?id=<%# Eval("idMedico_Consultorios") %>&idEsp=<%= Request["id"] %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="servicos_consultorios_medicos_excluir.aspx?id=<%# Eval("idMedico_Consultorios") %>&idEsp=<%= Request["id"] %>">Excluir</a>
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
            SelectCommand="SELECT * FROM TB_MEDICO_CONSULTORIOS WHERE idEspecialidade_Consutorios = @idEspecialidade order by dsNome">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="id" Name="idEspecialidade" DbType="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

