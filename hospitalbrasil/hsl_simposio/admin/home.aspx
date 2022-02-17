<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="admin_Home_portal" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Relatório de inscritos</h2>
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Exportar para o Excel</asp:LinkButton>
    <br />
    <br />
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="dsSimposio" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="nm_inscrito" HeaderText="NOME" 
                    SortExpression="nm_inscrito">
                <HeaderStyle Height="30px" HorizontalAlign="Left" />
                <ItemStyle Height="30px" Width="250px" />
                </asp:BoundField>
                <asp:BoundField DataField="nr_cpf" HeaderText="CPF" SortExpression="nr_cpf">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="dt_nascimento" DataFormatString="{0:dd/MM/yyyy}" 
                    HeaderText="DATA NASC." SortExpression="dt_nascimento">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_profissao" HeaderText="PROFISSÃO" 
                    SortExpression="ds_profissao">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_endereco" HeaderText="ENDEREÇO" 
                    SortExpression="ds_endereco">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_complemento" HeaderText="COMPL." 
                    SortExpression="ds_complemento">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_bairro" HeaderText="BAIRRO" 
                    SortExpression="ds_bairro">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_cidade" HeaderText="CIDADE" 
                    SortExpression="ds_cidade">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_estado" HeaderText="UF" 
                    SortExpression="ds_estado">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="nr_cep" HeaderText="CEP" SortExpression="nr_cep">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="nr_telefone" HeaderText="TELEFONE" 
                    SortExpression="nr_telefone">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="130px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_email" HeaderText="E-MAIL" 
                    SortExpression="ds_email">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="dt_inscricao" HeaderText="DATA INSCRIÇÃO" 
                    SortExpression="dt_inscricao" DataFormatString="{0:dd/MM/yyyy hh:mm}">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="ds_conheceu" HeaderText="MÍDIA" 
                    SortExpression="ds_conheceu">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
  <%--          <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />--%>
        </asp:GridView>
        <asp:SqlDataSource ID="dsSimposio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbSimposioConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:dbSimposioConnectionString.ProviderName %>" 
            SelectCommand="SELECT tb_inscricao.id, tb_inscricao.id_conheceu, tb_conheceu.ds_conheceu, tb_inscricao.nr_cpf, tb_inscricao.nm_inscrito, tb_inscricao.dt_nascimento, tb_inscricao.ds_profissao, tb_inscricao.ds_endereco, tb_inscricao.ds_complemento, tb_inscricao.ds_bairro, tb_inscricao.ds_cidade, tb_inscricao.ds_estado, tb_inscricao.nr_cep, tb_inscricao.nr_telefone, tb_inscricao.ds_email, tb_inscricao.dt_inscricao FROM (tb_inscricao LEFT OUTER JOIN tb_conheceu ON tb_conheceu.id_conheceu = tb_inscricao.id_conheceu)">
        </asp:SqlDataSource>
    </p>
</asp:Content>

