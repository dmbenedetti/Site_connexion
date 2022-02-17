<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="corpo_clinico.aspx.cs" Inherits="admincms_ogrupo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Corpo Clínico</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Corpo Clínico</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Novo Médico" Width="153px" 
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

        &nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_corpo_clinico" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <p><%# Eval("nm_medico")%></p>
                <p>Cargo: <%# Eval("nm_cargo")%></p>
                <p>Especialidade: <%# Eval("nm_especialidade")%></p>
                <p><a href="corpo_clinico_editar.aspx?id=<%# Eval("id_corpo_clinico") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="corpo_clinico_excluir.aspx?id=<%# Eval("id_corpo_clinico") %>">Excluir</a>
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
            SelectCommand="SELECT DISTINCT a.id_corpo_clinico, a.nm_medico, a.nm_cargo, b.nm_especialidade FROM [TB_HOSPITAL_CORPO_CLINICO] a INNER JOIN [TB_EPSECIALIDADE] b ON a.id_especialidade = b.id_especialidade INNER JOIN [TB_HOSPITAL_CORPO_CLINICO_HOSPITAL] c ON a.id_corpo_clinico = c.id_corpo_clinico INNER JOIN TB_PERMISSAO_ADMIN d ON c.id_hospital = d.id_hospital  WHERE ((d.id_user = @idUser) AND c.id_hospital = @idHosp) order by a.nm_medico">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:SessionParameter Name="idUser" SessionField="iduser" Type="Int32" />
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

