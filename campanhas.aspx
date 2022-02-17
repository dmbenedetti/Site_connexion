<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_grupo.master" AutoEventWireup="true" CodeFile="campanhas.aspx.cs" Inherits="campanhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.campanhas_front a
{
    text-decoration:none;
    color:#666666;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Campanhas</h2>
<br /><br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #efefef; padding-bottom:20px; margin-bottom:20px;" class="campanhas_front">
                    <table><tr><td>
                <a href="campanhas_detail.aspx?id=<%# Eval("id_conteudo") %>"><img src="images/campanhas_publicitarias/<%# Eval("imagem") %>" width="85" height="80" style="float:left; margin-right:20px;"/></a>
                </td><td>
                <%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%><br />
                <h3><a href="campanhas_detail.aspx?id=<%# Eval("id_conteudo") %>">
                <strong><%# Eval("nm_titulo") %></strong></a></h3>
                <p><a href="campanhas_detail.aspx?id=<%# Eval("id_conteudo") %>"><%# Eval("ds_resumo") %></a></p>
                    </td></tr></table>
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
   
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT [id_conteudo], [nm_titulo], [dt_conteudo], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] WHERE (([id_sessao] = @id_sessao) AND ([id_tipo] = @id_tipo) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma)) order by dt_conteudo desc,id_conteudo desc ">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="4" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

