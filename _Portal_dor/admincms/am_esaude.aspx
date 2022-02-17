<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="am_esaude.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Área Médica > E-Saúde</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>E-Saúde</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Novo E-Saúde" Width="153px" 
        onclick="Button1_Click" />
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        Menu:
    </p>
    <p>
        Texto Menu: <asp:TextBox ID="txtMenu" runat="server" CssClass="txt" Width="150" MaxLength="255"></asp:TextBox>
    </p>
    <p>
        Texto Página: <asp:TextBox ID="txtTitulo" runat="server" CssClass="txt" Width="150" MaxLength="255"></asp:TextBox>
    </p>
    <p>
        Exbir Menu: <asp:CheckBox ID="chkVisivel" runat="server" CssClass="txt" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button2_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
    <p>
        &nbsp;</p>
    <p>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <img src="../images/sua_saude/<%# Eval("imagem") %>" width="85" height="80" style="float:left;margin:5px;"/>
                <p><%# string.Format("{0:dd/MM/yyyy}", Eval("dt_conteudo"))%> - <span style="font:bold 16px; margin:5px 0;"><strong><%# Eval("nm_titulo") %></strong></span></p>
                <p><%# Eval("ds_resumo") %></p>
                <p><a href="adm_metatags_editar.aspx?id_conteudo=<%# Eval("id_conteudo") %>&r=3">Meta Tags</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="am_revista_meddor_editar.aspx?id=<%# Eval("id_conteudo") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="am_revista_meddor_excluir.aspx?id=<%# Eval("id_conteudo") %>">Excluir</a>
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
     <p>
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT [id_conteudo], [nm_titulo], [dt_conteudo], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] WHERE (([id_sessao] = @id_sessao) AND ([id_tipo] = @id_tipo) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma)) order by dt_conteudo desc, id_conteudo desc">
            <SelectParameters>
                <asp:Parameter DefaultValue="7" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="17" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

