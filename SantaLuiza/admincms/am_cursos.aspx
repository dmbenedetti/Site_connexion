<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="am_cursos.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Área Médica > Cursos e Palestras</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Cursos e Palestras</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Novo Curso" Width="153px" 
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

        &nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <p><%# string.Format("{0:dd/MM/yyyy HH:mm:ss}", Eval("dt_curso"))%> - <span style="font:bold 16px; margin:5px 0;"><strong><%# Eval("ds_curso") %></strong></span></p>
                <p>Unidade: <%# Eval("nm_hospital")%></p>
                <p><a href="am_curso_editar.aspx?id=<%# Eval("id") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="am_curso_excluir.aspx?id=<%# Eval("id") %>">Excluir</a>
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
            SelectCommand="SELECT DISTINCT id, ds_Curso, dt_curso, b.nm_hospital FROM [TB_AREA_MEDICA_CURSO] a INNER JOIN [TB_HOSPITAL] b ON a.id_hospital = b.id_hospital INNER JOIN [TB_AREA_MEDICA_CURSO_HOSPITAL] c ON a.id = c.id_curso INNER JOIN TB_PERMISSAO_ADMIN d ON c.id_hospital = d.id_hospital  WHERE ((a.id_status = @id_status)  AND (d.id_user = @idUser)) order by dt_curso desc, id desc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="idUser" SessionField="iduser" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

