<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_revista_suaSaude.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Publicações e Campanhas > Revista Sua Saúde </strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Revista Sua Saúde</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" ForeColor="White" Height="35px" OnClick="Button1_Click1" Text="Nova Edição" Width="200px" />
    </p>
    <p>&nbsp;</p>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_edicao" 
        DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <img src="../Revista_SuaSaude/<%# Eval("ds_imagem") %>" width="100" height="140" style="float:left;margin:5px;"/>
                <br /><br />
                <p><strong>Edição Nº<%# Eval("nr_edicao")%></strong></span></p>
                <br />
                <p>Data da Edição: <%# string.Format("{0:dd/MM/yyyy}", Eval("dt_edicao"))%></p>
                <br /><br />
                <p><a href="portal_revista_suaSaude_editar.aspx?id=<%# Eval("id_edicao") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="portal_revista_suaSaude_excluir.aspx?id=<%# Eval("id_edicao") %>">Excluir</a>
                | &nbsp;&nbsp;<a href="portal_revista_suaSaude_edicao_materias.aspx?id=<%# Eval("id_edicao") %>">Ver Matérias >></a>
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
     <p>
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            
             
             SelectCommand="SELECT id_edicao, nr_edicao, dt_edicao, ds_imagem FROM dbo.TB_PORTAL_EDICAO_REVISTA WHERE (id_status = 1) ORDER BY nr_edicao DESC">
        </asp:SqlDataSource>
<p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

