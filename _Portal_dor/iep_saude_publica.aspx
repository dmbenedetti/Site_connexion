<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_iep.master" AutoEventWireup="true" CodeFile="iep_saude_publica.aspx.cs" Inherits="campanhas" %>

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
<h2>Instituto D'Or Gestão de Saúde Pública</h2>
<br />
<span>O Instituto D'Or de Pesquisa e Ensino é uma organização sem fins lucrativos que tem como objetivo estimular a pesquisa científica e contribuir para uma formação diferenciada de profissionais na área biomédica e pesquisa.</span>
<br /><br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;" class="campanhas_front">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td width="85">
                            <a name="<%# Eval("id_conteudo") %>">
                            <img src="images/iep/<%# Eval("imagem") %>" width="85" height="80" style="float:left;margin:5px;"/></a>
                        </td>
                        <td>
                            <p><%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%> - 
                            </p>
                            <h3 style="margin:5px 0;">
                            <strong><%# Eval("nm_titulo") %></strong></h3>
                            <p><%# Eval("ds_resumo") %></p><br />
                            <p id="pfile" runat="server" visible='<%# !String.IsNullOrEmpty(Eval("ds_file").ToString()) %>'><strong>Faça o download do arquivo:</strong> <a href='<%# "pdf/iep/" + Eval("ds_file").ToString() %>' target="_blank"><%# Eval("ds_file")%></a></p>
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
             <asp:NumericPagerField ButtonCount="8" />
        </Fields>
    </asp:DataPager> 
            </LayoutTemplate>
        </asp:ListView>
   
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT [id_conteudo], ds_file, [nm_titulo], [dt_conteudo], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] WHERE (([id_sessao] = @id_sessao) AND ([id_tipo] = @id_tipo) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma)) order by dt_conteudo desc,id_conteudo desc ">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="15" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

