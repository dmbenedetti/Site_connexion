<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_am.master" AutoEventWireup="true" CodeFile="am_docs.aspx.cs" Inherits="campanhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>

    

.botao2 
{
    background-color: #f1f1f1;
    color: #666;
    padding: 10px 15px 10px 15px;
    margin: 0 10px;
    font-size: 15px;
}

.botao2 a
{
    color: #a0a0a0;
}


</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2><asp:Literal ID="ltlTitulo" runat="server"></asp:Literal></h2>
<br />
<span></span>
<br /><br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #efefef; margin-bottom:20px; padding-bottom:20px;" class="campanhas_front">
					<%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%><br />
                    <h3><strong><%# Eval("nm_titulo") %></strong></h3>
                    <p><%# Eval("ds_resumo") %></p><br />
                    <p id="pfile" runat="server" visible='<%# !String.IsNullOrEmpty(Eval("ds_file").ToString()) %>'><strong>Faça o download do arquivo:  &nbsp</strong> <a href='<%# "pdf/am/" + Eval("ds_file").ToString() %>' target="_blank"><%# Eval("ds_file")%></a></p>
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
            
            
            SelectCommand="SELECT a.[id_conteudo], ds_file, [nm_titulo], [dt_conteudo], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] a INNER JOIN [TB_PORTAL_CONTEUDO_HOSPITAL] b ON a.id_conteudo = b.id_conteudo WHERE (([id_tipo] = @id_tipo) AND ([id_sessao] = @id_sessao) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND b.id_hospital = @idHosp) order by dt_conteudo desc">

            <SelectParameters>
                <asp:Parameter DefaultValue="7" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="13" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

