<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_home_video_excluir.aspx.cs" Inherits="admincms_portal_home_video_excluir" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D&#39;or &gt; Home > Videos YouTube &gt; Editar </strong>
        
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Editar <strong>Video YouTube </strong><asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ToolkitScriptManager>
    </h2>
    <p>&nbsp;</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grupo" />
    <p>
        <asp:Label ID="lbl_erro" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
        <br />
        <b>Título&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_nome" ErrorMessage="Digite um titulo para Video" ForeColor="Red" ValidationGroup="grupo">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="txt_nome" runat="server" CssClass="txt" MaxLength="200" Width="600px" ReadOnly="true"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Video </b>
    </p>
    <p>
        <asp:TextBox ID="txt_resumo" runat="server" CssClass="txt" MaxLength="200" 
            Width="600px" Height="44px" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <b>Status </b>
    </p>
    <p>
        <asp:DropDownList ID="drp_status" Enabled="false" DataSourceID="ds_paginas" runat="server" DataValueField="id_status" DataTextField="nm_status" ></asp:DropDownList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
            ForeColor="White" Height="33px" OnClick="Button1_Click" Text="Excuir" 
            Width="148px" ValidationGroup="grupo" />
    </p>

            <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT [id_status], [nm_status] FROM [TB_STATUS] order by nm_status">
        </asp:SqlDataSource>

<p>&nbsp;</p>
</asp:Content>

