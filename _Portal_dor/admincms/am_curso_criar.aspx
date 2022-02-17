<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="am_curso_criar.aspx.cs" Inherits="admincms_ogrupo_criar" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Área Médica > Cursos e Palestras 
        &gt;Novo Post</strong></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Novo Curso ou Palestra<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
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
        <b>Data do curso</b>
    </p>
    <p>
        <asp:TextBox ID="txt_data" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
        <asp:CalendarExtender ID="txt_data_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="txt_data">
        </asp:CalendarExtender>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Horário (ex: 14h as 15h) </b>
    </p>
    <p>
        <asp:TextBox ID="txt_hora" runat="server" CssClass="txt" MaxLength="200" Width="600px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Data limite de inscrição</b>
    </p>
    <p>
        <asp:TextBox ID="txt_inscr" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
            Enabled="True" TargetControlID="txt_inscr">
        </asp:CalendarExtender>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Local do curso</b>
    </p>
    <p>
        <asp:TextBox ID="txt_local" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Link externo do curso</b>
    </p>
    <p>
        <asp:TextBox ID="txtLink" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Valor do Curso</b>
    </p>
    <p>
        <asp:TextBox ID="txtPreco" runat="server" CssClass="txt" MaxLength="100" 
            Width="150px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Descrição box superior</b>
    </p>
    <p>
        <asp:TextBox ID="txtMimDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="txt" MaxLength="300" 
            Width="350px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Título Box Inferior</b>
    </p>
    <p>
        <asp:TextBox ID="txtBox2Titulo" runat="server" CssClass="txt" MaxLength="50" 
            Width="150px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Descrição Box inferior</b>
    </p>
    <p>
        <asp:TextBox ID="txtBox2Desc" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
    </p>
        <p>
        &nbsp;</p>
    <p>
        <b>Telefone Contato</b>
    </p>
    <p>
        <asp:TextBox ID="txtTelefone" runat="server" CssClass="txt" MaxLength="50" 
            Width="150px"></asp:TextBox>
    </p>
        <p>
        &nbsp;</p>
    <p>
        <b>Email Contato</b>
    </p>
    <p>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" MaxLength="200" 
            Width="150px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Unidade </b>
    </p>
    <p>
        <asp:DropDownList ID="drp_Unidade" runat="server" CssClass="txt" DataSourceID="ds_unidade" DataTextField="nm_hospital" DataValueField="id_hospital"></asp:DropDownList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Especialidades (Ctrl + Click para selecionar mais de uma especialidade)</b>
    </p>
    <p>
        <asp:ListBox ID="lst_especialidade" Rows="6" runat="server" CssClass="txt" SelectionMode="Multiple" DataSourceID="ds_especialidade" DataTextField="nm_especialidade" DataValueField="id_especialidade"></asp:ListBox>
    </p>

    <p>
        &nbsp;</p>
    <!-- Div Conteudo_pag-->
    <div id="conteudo_pag">
        <p>
            <b>Conteúdo</b></p>
        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../fckeditor/" Height="600px" SkinPath="skins/silver/" Width="600px"></FCKeditorV2:FCKeditor>
    </div>
<!-- Fim Div formulario_pag-->
    <br />
    <strong>Publicar este curso também nos sites:</strong><br />
    <asp:CheckBox ID="chkAll" Text="Todos" runat="server" />
    <asp:CheckBoxList ID="chb_hospitais" runat="server">
    </asp:CheckBoxList>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Gravar" 
            Width="148px" ValidationGroup="grupo" />
    </p>

       <asp:SqlDataSource ID="ds_unidade" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT '' id_hospital, 'Selecione...' nm_hospital UNION SELECT CAST(id_hospital as VARCHAR(10)) id_hospital, nm_hospital FROM [TB_HOSPITAL] WHERE id_status = @id_status order by id_hospital asc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

       <asp:SqlDataSource ID="ds_especialidade" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT id_especialidade, nm_especialidade FROM [TB_EPSECIALIDADE] WHERE id_status = @id_status order by nm_especialidade asc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    
<p>&nbsp;</p>
</asp:Content>

