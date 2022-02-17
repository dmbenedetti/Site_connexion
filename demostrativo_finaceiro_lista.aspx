<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_grupo.master" AutoEventWireup="true" CodeFile="demostrativo_finaceiro_lista.aspx.cs" Inherits="demostrativo_finaceiro_lista" %>

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
<h2>Demonstrativos Financeiros</h2>
<br /><br />
<div style="width:100%; float:left; text-align:right;">Ano:
  <asp:DropDownList ID="drpAno" runat="server" AutoPostBack="true">
    <asp:ListItem Text="Todos" Value="0"></asp:ListItem>
  </asp:DropDownList>
Mes: 
<asp:DropDownList ID="drpMes" runat="server" AutoPostBack="true">
            <asp:ListItem Text="Todos" Value="0"></asp:ListItem>
            <asp:ListItem Text="Janeiro" Value="1"></asp:ListItem>
            <asp:ListItem Text="Fevereiro" Value="2"></asp:ListItem>
            <asp:ListItem Text="Março" Value="3"></asp:ListItem>
            <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
            <asp:ListItem Text="Maio" Value="5"></asp:ListItem>
            <asp:ListItem Text="Junho" Value="6"></asp:ListItem>
            <asp:ListItem Text="Julho" Value="7"></asp:ListItem>
            <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
            <asp:ListItem Text="Setembro" Value="9"></asp:ListItem>
            <asp:ListItem Text="Outubro" Value="10"></asp:ListItem>
            <asp:ListItem Text="Novembro" Value="11"></asp:ListItem>
            <asp:ListItem Text="Dezembro" Value="12"></asp:ListItem>
         </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;<br />
</div>
<br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="idDemostrativo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;" class="campanhas_front">
                <img src="images/pdf.jpg" width="20" height="20" style="float:left;margin:5px;"/>
                <h3 style="margin:5px 0;"><a target="_blank" href="pdf/df/<%# Eval("dsArquivo") %>">
                <strong><%# Eval("dsDemostrativo")%></strong></a></h3>
                <div style="clear:both"></div>
             </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
                <asp:DataPager ID="ItemDataPager" runat="server" PageSize="30">
        <Fields>
             <asp:NumericPagerField ButtonCount="8" />
        </Fields>
    </asp:DataPager> 
            </LayoutTemplate>
        </asp:ListView>
   
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            SelectCommand="SELECT [idDemostrativo], [dsDemostrativo], [dsArquivo], dtDemonstrativo FROM [TB_DEMOSTRATIVO_FINANCEIRO] WHERE ([idStatus] = @id_status) AND (@Mes = 0 OR Month(dtDemonstrativo) = @Mes) AND (@Ano = 0 OR Year(dtDemonstrativo) = @Ano) order by dsDemostrativo asc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:ControlParameter ControlID="drpMes" Name="Mes" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="drpAno" Name="Ano" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

