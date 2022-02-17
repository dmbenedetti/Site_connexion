<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="foto_bebe.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Foto Bebê</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Foto Bebê</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>
        &nbsp;</p>
            <p>
        <strong>Imagem Banner (L:169px - A:54px)</strong></p>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt" />
    </p>
    <p>
        Imagem Atual:</p>
    <p>
        <asp:Image ID="Image1" runat="server" Height="54px" Width="169px" />
    </p>
    <p>
        Link: <asp:TextBox ID="txtLink" runat="server"  CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar Banner" 
            Width="148px" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
            ID="Button3" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" Text="Remover Banner" 
            Width="148px" CausesValidation="false" onclick="Button3_Click" />

    </p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Novo Cadastro" Width="153px" onclick="Button1_Click1" 
         />
</p>

    <p>
        &nbsp;</p>
  
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_foto" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <img src="../images/foto_bebe/thumb/<%# Eval("ds_foto_thumb") %>" width="85" height="80" style="float:left;margin:5px;"/>
                <p><%# string.Format("{0:dd/MM/yyyy}", Eval("dt_nascimento"))%> - <span style="font:bold 16px; margin:5px 0;"><strong><%# Eval("ds_nome_bebe")%></strong></span></p>
                <p><%# Eval("ds_nome_mae")%></p>
                <p><a href="foto_bebe_editar.aspx?id=<%# Eval("id_foto") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="foto_bebe_excluir.aspx?id=<%# Eval("id_foto") %>">Excluir</a>
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
            
            
            SelectCommand="SELECT [id_foto],[dt_nascimento],[dt_cadastro],[ds_nome_mae],[ds_nome_pai],[ds_nome_bebe],[nu_peso] ,[nu_estatura],[ds_obstreta],[ds_pediatra],[id_hospital],[ds_foto_bebe],[ds_foto_retrato],[ds_foto_thumb],[fg_status] FROM [db_rede_dor].[dbo].[TB_FOTO_BEBE] WHERE id_hospital=@idHosp ORDER BY dt_cadastro DESC">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="idHosp" Type="Int32" SessionField="idHosp" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

