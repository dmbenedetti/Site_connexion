<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="corpo_clinico_editar.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Hospital > Corpo Clínico  &gt; Editar </strong>
        
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Editar <strong>Médico </strong><asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
        <br />
        <b>Nome&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_titulo" ErrorMessage="Digite um titulo para página" ForeColor="Red" ValidationGroup="grupo">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Cargo </b>
    </p>
    <p>
        <asp:TextBox ID="txt_cargo" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>&nbsp;
        </p>
    <p>
        <b>Selecione uma especialidade</b>
    </p>
    <p>
        <asp:DropDownList ID="lst_especialidade" runat="server" CssClass="txt" SelectionMode="Single" DataSourceID="ds_especialidade" DataTextField="nm_especialidade" DataValueField="id_especialidade"></asp:DropDownList>
    </p>

    <br />
    <strong>Hospitais de Atendimento:</strong><br />
    <asp:CheckBox ID="chkAll" Text="Todos" runat="server" />
    <asp:CheckBoxList ID="chb_hospitais" runat="server">
    </asp:CheckBoxList>
    <p>&nbsp;
        </p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>

       <asp:SqlDataSource ID="ds_especialidade" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT id_especialidade, nm_especialidade FROM [TB_EPSECIALIDADE] WHERE id_status = @id_status order by nm_especialidade asc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
<p>&nbsp;</p>
</asp:Content>

