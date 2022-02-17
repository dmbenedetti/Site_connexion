<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="adm_metatags.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Meta Tags</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Meta Tags</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
<p>
    Sessão: <asp:DropDownList ID="drpSessao" runat="server" DataSourceID="ds_sessao" DataTextField="nm_sessao" DataValueField="id_sessao"></asp:DropDownList> 
    <asp:ImageButton ID="btnFiltro" runat="server" ImageUrl="images/btn_buscar.jpg" 
        onclick="btnFiltro_Click" />
</p>
    <p>
        &nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style="width:100%; border-bottom:solid 1px #cccccc; margin-bottom:20px; clear:both;">
                <%# Eval("pagina") %>
                <div style="float:right;"><a href="adm_metatags_editar.aspx?id=<%# Eval("id_metatag") %>&id_conteudo=<%# Eval("id_conteudo") %>&pagina=<%# Eval("ds_pagina") %>">Editar</a>&nbsp;&nbsp;</div>
             </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="width:100%;">
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
        <asp:SqlDataSource ID="ds_sessao" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            SelectCommand="SELECT 0 id_sessao, 'Selecione' nm_sessao UNION SELECT id_sessao, nm_sessao FROM TB_PORTAL_SESSAO">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ds_tipo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            SelectCommand="SELECT 0 id_tipo, 'Selecione' nm_tipo UNION SELECT id_tipo, nm_tipo FROM TB_PORTAL_TIPO">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="idUser" SessionField="iduser" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

