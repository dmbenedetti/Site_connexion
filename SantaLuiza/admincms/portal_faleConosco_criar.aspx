<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_faleConosco_criar.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Fale Conosco  > Nova Página</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Nova Página</h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <br />
        <b>Título&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_titulo" ErrorMessage="Digite um titulo para página" ForeColor="Red" ValidationGroup="grupo">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Resumo </b>
    </p>
    <p>
        <asp:TextBox ID="txt_resumo" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <b>Tipo de página:</b></p>
    <p>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" Height="29px" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" Width="456px">
            <asp:ListItem Selected="True" Value="1">Conteúdo</asp:ListItem>
            <asp:ListItem Value="2">Link interno</asp:ListItem>
            <asp:ListItem Value="3">Link externo</asp:ListItem>
            <asp:ListItem Value="10">Formulário</asp:ListItem>
        </asp:RadioButtonList>
    </p>
<!-- Div url-->
    <div id="url" <% =div_url %>="">
        <p>
            Digite a url:<br />
            <asp:TextBox ID="txt_url" runat="server" CssClass="txt" Width="341px"></asp:TextBox>
            <br />
        </p>
    </div>
<!-- fim Div url-->

<!-- Div formulario_pag-->
    <div id="formulario_pag" <% =div_formulario %>="">
        <p>
            <b>Escolha o formulário:</b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="DropDownList1" ErrorMessage="Escolha um formulário" 
                ForeColor="Red" ValidationGroup="grupo" Enabled="False">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txt" 
                Height="20px" Width="300px" DataSourceID="SqlDataSource1" 
                DataTextField="nm_formulário" DataValueField="id_formulario" 
                onprerender="DropDownList1_PreRender">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" SelectCommand="SELECT [id_formulario], [nm_formulário] FROM [TB_FORMULARIOS] WHERE (([id_status] = @id_status) AND ([id_hospital] = @id_hospital))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                    <asp:SessionParameter Name="id_hospital" SessionField="idHosp" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
         <p>&nbsp;</p>
        <p>
            <b>Email destinatário:</b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="DropDownList1" ErrorMessage="Digite o e-mail que receberá o formulário" 
                ForeColor="Red" ValidationGroup="grupo" Enabled="False">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" Width="200" MaxLength="200"></asp:TextBox>
        </p>
    </div>
<!-- Fim Div formulario_pag-->
    <p>
        &nbsp;</p>
    <!-- Div Conteudo_pag-->
    <div id="conteudo_pag" <% =div_conteudo %>="">
        <p>
            <b>Conteúdo</b></p>
        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../fckeditor/" Height="600px" SkinPath="skins/silver/" Width="600px"></FCKeditorV2:FCKeditor>
    </div>
<!-- Div Conteudo_pag-->
    <br />
    <p>
        &nbsp;</p>
    <p>
        Visível no menu:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            runat="server" ControlToValidate="rdo_visivel" 
            ErrorMessage="Escolha se esta página ficará visivel no menu" ForeColor="Red" 
            ValidationGroup="grupo">*</asp:RequiredFieldValidator>
    &nbsp;<asp:RadioButtonList ID="rdo_visivel" runat="server" Height="25px" RepeatDirection="Horizontal" Width="150px">
            <asp:ListItem Value="1">sim</asp:ListItem>
            <asp:ListItem Value="0">não</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
<p>&nbsp;</p>
</asp:Content>

