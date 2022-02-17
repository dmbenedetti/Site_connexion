<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="corpo_clinico.aspx.cs" Inherits="noticias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.campanhas_front a
{
    text-decoration:none;
    color:#666666;
}
.campanhas_front h3
{
    font-size:18px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container_interna">
<h2><asp:Literal ID="ltlTitulo" runat="server"></asp:Literal></h2>
<div style="border-bottom: 1px solid rgb(239, 239, 239); height: 60px;">
<div style="width: 600px; clear:both;"><p>Nosso hospital possui uma equipe de profissionais altamente qualificados, preparados para atender aos pacientes nas especialidades abaixo:</p></div>
<div style="float:right; width:300px; text-align:right;">
    <asp:DropDownList ID="drpEspecialidade" runat="server" 
        DataSourceID="ds_especialidade" DataTextField="nm_especialidade" 
        DataValueField="id_especialidade" AutoPostBack="True" 
        onselectedindexchanged="drpEspecialidade_SelectedIndexChanged"></asp:DropDownList></div>
</div>
<br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="nm_medico" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #efefef; padding-bottom:20px; margin-bottom:20px;" class="campanhas_front">
                    <p>
                        <strong><%# Eval("nm_medico") %></strong><br />
                        Subespecialidade: <%# Eval("nm_cargo")%><br />
                        Especialidade: <%# Eval("nm_especialidade")%>
                    </p>
                <div style="clear:both"></div>
             </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>
   
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="select a.nm_medico, a.nm_cargo, c.nm_especialidade from TB_HOSPITAL_CORPO_CLINICO a INNER JOIN TB_HOSPITAL_CORPO_CLINICO_HOSPITAL b ON a.id_corpo_clinico = b.id_corpo_clinico INNER JOIN TB_EPSECIALIDADE c ON a.id_especialidade = c.id_especialidade WHERE b.id_hospital = @idHosp AND (@idEsp = 0 OR c.id_especialidade = @idEsp) ORDER BY a.nm_medico">
            <SelectParameters>
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
                <asp:ControlParameter Name="idEsp" ControlID="drpEspecialidade" PropertyName="SelectedValue" DefaultValue="0" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ds_especialidade" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="select 0 id_especialidade, '  Selecione uma especialidade' nm_especialidade  UNION select distinct a.id_especialidade, nm_especialidade from TB_EPSECIALIDADE a INNER JOIN TB_HOSPITAL_CORPO_CLINICO b ON a.id_especialidade = b.id_especialidade where id_status = 1 order by nm_especialidade">
        </asp:SqlDataSource>

        </div>
</asp:Content>

