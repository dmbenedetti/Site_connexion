<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="am_docs.aspx.cs" Inherits="campanhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
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
<br />
<span></span>
<br /><br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #efefef; margin-bottom:20px; padding-bottom:20px;" class="campanhas_front">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
							<%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%><br />
                            <h3><strong><%# Eval("nm_titulo") %></strong></h3>
                            <p><%# Eval("ds_resumo") %></p><br />
                            <p id="pfile" runat="server" visible='<%# !String.IsNullOrEmpty(Eval("ds_file").ToString()) %>'><strong>Faça o download do arquivo:  &nbsp</strong> <a href='<%# "pdf/am/" + Eval("ds_file").ToString() %>' target="_blank"><span id="arquivo"><%# Eval("ds_file")%></span><span id="download">Download</span></a></p>
                        </td>
                    </tr>
                </table>
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
             <asp:NumericPagerField ButtonCount="3" />
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
</div>
</asp:Content>

