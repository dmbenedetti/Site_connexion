<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_home_video.aspx.cs" Inherits="admincms_portal_home_video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <p><strong>Portal Rede D'or > Home > Videos YouTube</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Videos YouTube</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Novo Video" Width="153px" 
        onclick="Button1_Click" />
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_video" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <p><%# Eval("ds_nome") %> - <%# Convert.ToInt32(Eval("id_status")) == 1 ? "Ativo" : "Inativo" %></p>
                <p><a href="portal_home_video_editar.aspx?id=<%# Eval("id_video") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="portal_home_video_excluir.aspx?id=<%# Eval("id_video") %>">Excluir</a>
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
            
            
            SelectCommand="SELECT [id_video], [ds_nome], [id_status] FROM [TB_PORTAL_VIDEO] WHERE ([id_idioma] = @id_idioma) order by id_video desc">
            <SelectParameters>
                <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

