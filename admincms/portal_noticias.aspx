<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_noticias.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Imprensa > Notícias</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Notícias</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Nova Notícia" Width="110px" 
        onclick="Button1_Click" />
</p>
    <p>
        &nbsp;</p>
    <p>
        Menu:
    </p>
    <p>
        Texto Menu: <asp:TextBox ID="txtMenu" CssClass="txt" runat="server" Width="150" MaxLength="255"></asp:TextBox>
    </p>
    <p>
        Texto Página: <asp:TextBox ID="txtTitulo" CssClass="txt" runat="server" Width="150" MaxLength="255"></asp:TextBox>
    </p>
    <p>
        Exbir Menu: <asp:CheckBox ID="chkVisivel" CssClass="txt" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button2_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
    <p>
        &nbsp;</p>
    <p>

        &nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <img src="../images/noticias/<%# Eval("imagem") %>" width="85" height="80" style="float:left;margin:5px;"/>
                <p><%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%> - <span style="font:bold 16px; margin:5px 0;"><strong><%# Eval("nm_titulo") %></strong></span></p>
                <p><%# Eval("ds_resumo") %></p>
                <p><a href="adm_metatags_editar.aspx?id_conteudo=<%# Eval("id_conteudo") %>&r=1">Meta Tags</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="portal_noticias_editar.aspx?id=<%# Eval("id_conteudo") %>&id_not=<%# Eval("id_noticia") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="portal_noticias_excluir.aspx?id=<%# Eval("id_conteudo") %>&id_not=<%# Eval("id_noticia") %>"">Excluir</a>
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
     </p>
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT DISTINCT a.[id_conteudo], a.[nm_titulo], a.[dt_conteudo], a.[id_noticia], (CASE WHEN a.[ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE a.[ds_imgDestaque] END)as imagem , a.[ds_resumo] FROM [TB_PORTAL_CONTEUDO] a INNER JOIN [TB_PORTAL_CONTEUDO_HOSPITAL] b ON a.id_conteudo = b.id_conteudo INNER JOIN TB_PERMISSAO_ADMIN c ON b.id_hospital = c.id_hospital WHERE (([id_tipo] = @id_tipo) AND (a.id_sessao = @id_sessao) AND (a.id_status = @id_status) AND (a.id_idioma = @id_idioma) AND (c.id_user = @idUser)) order by dt_conteudo desc">
            <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="5" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
                <asp:SessionParameter DefaultValue="1" Name="id_hospital" Type="Int32" SessionField="idHosp" />
                <asp:SessionParameter Name="idUser" SessionField="iduser" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

