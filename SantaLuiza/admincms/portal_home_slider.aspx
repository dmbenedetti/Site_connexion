<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_home_slider.aspx.cs" Inherits="admincms_portal_home_slider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Gerenciar Home Page > Slider </strong></p>
<br /><br />
<h2>Gerenciar Slider</h2>
<br /><br />
<p>
Nova imagem: 
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="FileUpload1" ErrorMessage="Selecione uma imagem" 
        ForeColor="Red" ValidationGroup="slider">*</asp:RequiredFieldValidator>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt" Height="22px" 
        Width="300px" />
</p>
    <p>
        <br />
Link:<br />
    <asp:TextBox ID="txt_link" runat="server" CssClass="txt" Height="22px" 
            Width="300px"></asp:TextBox>
</p>
<p><br />
    Ordem (Númerico, quanto menor o número, mas no ínico irá aparecer):<br />
    <asp:TextBox ID="txtOrdem" runat="server" CssClass="txt" Height="22px" Width="300px"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtOrdem" MaximumValue="9999" Display="Dynamic" MinimumValue="-9999" ErrorMessage="Ordem deve ser númerico" ForeColor="Red" Type="Integer">*</asp:RangeValidator>
</p>
    <p>
        <asp:Label ID="lblerro" runat="server"></asp:Label>
        <br />
</p>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
    ValidationGroup="slider" />
<p>
        <br />
    <asp:Button ID="btn_gravar" runat="server" Text="Gravar" BackColor="#666666" 
            Font-Bold="True" ForeColor="White" Height="29px" onclick="btn_gravar_Click" 
            Width="83px" ValidationGroup="slider" />
</p>
<br />
    <br />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id_slider" 
        DataSourceID="ds_slider">
        <ItemTemplate>
            <div class="box_slider">
                <img src="..\images\slider_home\<%# Eval("ds_imagem") %>" width=940 height=300/>
                <br />
                <strong>Ordem: </strong> <%# Eval("nuOrdem") %><br />
                <strong>Link:</strong> <%# Eval("ds_link") %><br />
                <a href="portal_home_slider_editar.aspx?id=<%# Eval("id_slider") %>">Editar</a> 
                &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <a href="portal_home_slider_excluir.aspx?id=<%# Eval("id_slider") %>">Excluir</a>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="ds_slider" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
        SelectCommand="SELECT [id_slider], [ds_imagem], [ds_link], ISNULL(nu_ordem, 0) nuOrdem FROM [TB_PORTAL_SLIDER] WHERE (([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND id_hospital = @idHosp)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
            <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
<br />

</asp:Content>

