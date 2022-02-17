<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="noticias_detail.aspx.cs" Inherits="noticias_detail" %>

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
    font-size:16px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container_interna">
<h2><asp:Literal ID="ltlTitulo" runat="server"></asp:Literal></h2>

<br />
<h3><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h3>
    <asp:Literal ID="ltr_conteudo" runat="server"></asp:Literal>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" 
        DataSourceID="ds_campanhas_last_four" GroupItemCount="2">
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td id="Td1" runat="server" width=460 style="border:solid 1px #efefef">
           <div style="padding:20px;" class="campanhas_front">
                <a href="<%# Server.UrlEncode(Eval("nm_titulo").ToString().Replace(":","_").Replace("?","")).Replace("+","_") %>,n,<%# Eval("id_conteudo") %>.aspx"><img src="images/noticias/<%# Eval("imagem") %>" width="85" height="80" style="float:left;margin:5px;"/></a>
                <%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%><br />
                <h3><a href="<%# Server.UrlEncode(Eval("nm_titulo").ToString().Replace(":","_").Replace("?","")).Replace("+","_") %>,n,<%# Eval("id_conteudo") %>.aspx"><strong><%# Eval("nm_titulo") %></strong></a></h3>
                <p><a href="<%# Server.UrlEncode(Eval("nm_titulo").ToString().Replace(":","_").Replace("?","")).Replace("+","_") %>,n,<%# Eval("id_conteudo") %>.aspx"><%# Eval("ds_resumo") %></a></p>
                <div style="clear:both"></div>
             </div>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table1" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td2" runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td3" runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        
    </asp:ListView>
    <asp:SqlDataSource ID="ds_campanhas_last_four" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
        SelectCommand="SELECT top 4 a.[id_conteudo], [nm_titulo], [dt_conteudo], [id_noticia], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] a INNER JOIN [TB_PORTAL_CONTEUDO_HOSPITAL] b ON a.id_conteudo = b.id_conteudo WHERE (([id_tipo] = @id_tipo) AND ([id_sessao] = @id_sessao) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND b.id_hospital = @idHosp) order by dt_conteudo desc">
        <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="5" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

