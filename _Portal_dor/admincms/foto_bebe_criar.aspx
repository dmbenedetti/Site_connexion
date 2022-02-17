<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="foto_bebe_criar.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Foto Bebê 
        &gt;Novo Cadastro</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Novo Cadastro<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
        <br />
        <b>Nome Bebe&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_NomeBebe" ErrorMessage="Digite o nome do bebe" ForeColor="Red" ValidationGroup="grupo">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txt_NomeBebe" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Data do Nascimento </b>
    </p>
    <p>
        <asp:TextBox ID="txt_data" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
        <asp:CalendarExtender ID="txt_data_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="txt_data">
        </asp:CalendarExtender>
    </p>
    <p>
        <b>Hora do Nascimento (hh:mm)&nbsp; </b>
    </p>
    <p>
        <asp:TextBox ID="txt_horanasciemnto" runat="server" CssClass="txt" MaxLength="5" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Nome da Mãe&nbsp; </b>
    </p>
    <p>
        <asp:TextBox ID="txtNomeMae" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Nome do Pai&nbsp; </b>
    </p>
    <p>
        <asp:TextBox ID="txtNomePai" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Peso do Bebê (ex: 4,32)&nbsp; </b>
    </p>
    <p>
        <asp:TextBox ID="txtPeso" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Altura do Bebê em cm (ex: 43,5)&nbsp; </b>
    </p>
    <p>
        <asp:TextBox ID="txtAltura" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Nome do Obstetra&nbsp; </b>
    </p>
    <p>
        <asp:TextBox ID="txtObstreta" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Nome do Pediatra&nbsp; </b>
    </p>
    <p>
        <asp:TextBox ID="txtPediatra" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Unidade&nbsp; </b>
    </p>
    <p>
        <asp:DropDownList ID="drpHospital" runat="server"></asp:DropDownList>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <strong>Foto rosto do bebe (L:150px - A:150px)</strong></p>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt" />
    </p>
    <p>&nbsp;
        </p>
    <p>
        <strong>Foto do Bebe (L:230px - A:330px)</strong></p>
    <p>
        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="txt" />
    </p>
    <p>&nbsp;
        </p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>
    
<p>&nbsp;</p>
</asp:Content>

