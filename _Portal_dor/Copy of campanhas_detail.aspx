<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_grupo.master" AutoEventWireup="true" CodeFile="Copy of campanhas_detail.aspx.cs" Inherits="campanhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<h2>Campanhas</h2>
<br /><br />
<h3>
    <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h3>
    <br />
    <asp:Literal ID="ltr_conteudo" runat="server"></asp:Literal>
    <br /><br />
    <hr />

    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" 
        DataSourceID="ds_campanhas_last_four" GroupItemCount="2">
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server" width=460 style="border:solid 1px #ccc">
           <div style="margin-bottom:20px;" class="campanhas_front">
                <a href="campanhas_detail.aspx?id=<%# Eval("id_conteudo") %>"><img src="images/campanhas_publicitarias/<%# Eval("imagem") %>" width="85" height="80" style="float:left;margin:5px;"/></a>
                <p><%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%> - 
                </p>
                <h3 style="margin:5px 0;"><a href="campanhas_detail.aspx?id=<%# Eval("id_conteudo") %>">
                <strong><%# Eval("nm_titulo") %></strong></a></h3>
                <p><a href="campanhas_detail.aspx?id=<%# Eval("id_conteudo") %>"><%# Eval("ds_resumo") %></a></p>
                <div style="clear:both"></div>
             </div>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        
    </asp:ListView>
    <asp:SqlDataSource ID="ds_campanhas_last_four" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
        SelectCommand="SELECT top 4 [id_conteudo], [nm_titulo], [dt_conteudo], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] WHERE (([id_sessao] = @id_sessao) AND ([id_tipo] = @id_tipo) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND id_conteudo <> @idConteudo) order by dt_conteudo desc,id_conteudo desc ">
        <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="4" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:QueryStringParameter QueryStringField="id" Name="idConteudo" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />

            </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

