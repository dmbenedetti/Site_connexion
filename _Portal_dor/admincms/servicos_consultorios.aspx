<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="servicos_consultorios.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Serviços > Consultórios Especializados</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Consultórios Especializados</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Nova Especialidade" Width="153px" 
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
        Texto Menu: <asp:TextBox ID="txtMenu" runat="server" Width="150" CssClass="txt" MaxLength="255"></asp:TextBox>
    </p>
    <p>
        Texto Página: <asp:TextBox ID="txtTitulo" runat="server" Width="150" CssClass="txt" MaxLength="255"></asp:TextBox>
    </p>
    <p>
        Exbir Menu: <asp:CheckBox ID="chkVisivel" runat="server" CssClass="txt" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button2_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>

        &nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="idEspecialidade_Consutorios" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <p><%# Eval("dsNome")%></p>
                <p>Info: <%# Eval("dsInfo")%></p>
                <p><a href="servicos_consultorios_medicos.aspx?id=<%# Eval("idEspecialidade_Consutorios") %>">Médicos</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="servicos_consultorios_editar.aspx?id=<%# Eval("idEspecialidade_Consutorios") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="servicos_consultorios_excluir.aspx?id=<%# Eval("idEspecialidade_Consutorios") %>">Excluir</a>
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
            SelectCommand="SELECT * FROM TB_ESPECIALIDADE_CONSULTORIOS WHERE idHosp = @idHosp ORDER BY dsNome">
            <SelectParameters>
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

