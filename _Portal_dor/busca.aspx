<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="busca.aspx.cs" Inherits="busca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        Busca por: <%= Request["wrd"] %></h2>
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo">
        <EmptyDataTemplate>
            <span>Nenhum registro encontrado.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div style="border-bottom: solid 1px #efefef; margin-bottom: 20px; padding-bottom: 20px;" class="campanhas_front">
                <table><tr><td>
                <a href='<%# url(Eval("id_conteudo").ToString(), Convert.ToInt32(Eval("id_tipo")), Convert.ToInt32(Eval("id_sessao"))) %>'>
                    <img src="<%# image(Eval("ds_imgDestaque"), Convert.ToInt32(Eval("id_sessao"))) %>" width="85" height="80"
                        style="float: left; margin-right: 10px;" /></a>
                </td><td>
                <p>
                    <%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%>
                    -
                </p>
                <h3 style="margin: 5px 0;">
                    <a href='<%# url(Eval("id_conteudo").ToString(), Convert.ToInt32(Eval("id_tipo")), Convert.ToInt32(Eval("id_sessao"))) %>'><strong>
                        <%# Eval("nm_titulo") %></strong></a></h3>
                <p>
                    <a href='<%# url(Eval("id_conteudo").ToString(), Convert.ToInt32(Eval("id_tipo")), Convert.ToInt32(Eval("id_sessao"))) %>'>
                        <%# Eval("ds_resumo") %></a></p>
                    </td></tr></table>
                <div style="clear: both">
                </div>
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
                    <asp:NumericPagerField ButtonCount="7" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
