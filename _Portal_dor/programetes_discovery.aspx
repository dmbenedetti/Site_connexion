<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_espacoSaude.master" AutoEventWireup="true" CodeFile="programetes_discovery.aspx.cs" Inherits="programetes_discovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Programetes da Discovery</h2>

    <p><asp:Literal ID="ltr_texto" runat="server"></asp:Literal></p>
    <div style="max-width:550px; width:100%; margin:40px 0;">
        <h3><strong><asp:Label ID="lbl_titulo_destaque" runat="server" Text=""></asp:Label></strong></h3><br />
        <asp:Literal ID="ltr_video_destaque" runat="server"></asp:Literal>
    </div>
	<div style="margin:40px 0;">

    <asp:ListView ID="LstView2" runat="server" DataKeyNames="id_programete" 
        DataSourceID="ds_videos_programete" GroupItemCount="4">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        
        <ItemTemplate>
            <div style="width: 100%; max-width: 220px; height: 250px; float: left;">
                <h3 style="width:220px;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("nm_titulo") %>' /></h3>
                <%# Eval("ds_video") %>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="programetesdiscovery" id="groupPlaceholderContainer" runat="server">
                <div class="videos_progametes">
                    <asp:Literal ID="groupPlaceholder" runat="server"></asp:Literal>
                </div>
            </div>
        </LayoutTemplate>
    </asp:ListView>

    
    </div>
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="LstView2" PageSize="8">
        <Fields>
            <asp:NumericPagerField />
        </Fields>
    </asp:DataPager>
    <asp:SqlDataSource ID="ds_videos_programete" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
        SelectCommand="SELECT [id_programete], [nm_titulo], [ds_video] FROM [TB_PORTAL_PROGRAMETES] WHERE ([id_status] = @id_status)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

