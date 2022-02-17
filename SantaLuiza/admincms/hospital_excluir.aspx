<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="hospital_excluir.aspx.cs" Inherits="admincms_hospital_excluir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Hospitais > <asp:Label ID="lbl_hospital" runat="server" Text=""></asp:Label> > Excluir Hospital</strong></p>

   <p>&nbsp;</p>
    <h2>Excluir Hospital</h2>
    <p></p>
    <br /><br />
    <p>Você tem certeza que deseja excluir este hospital?<br />
    </p>
<p>&nbsp;</p>
<p>
        <asp:Label ID="lbl_nm_hospital" runat="server" Font-Bold="True"></asp:Label>
    </p>
<p>
        <br />
        <asp:Button ID="btn_excluir_hosp" runat="server" Text="Excluir Hospital" 
        BackColor="#666666" ForeColor="White" Height="34px" 
        onclick="btn_excluir_hosp_Click" Width="129px" />
    </p>
<p>
        &nbsp;</p>
<p>
        <input id="btn_voltar" class="btn" onclick="history.back();" type="button" 
            value="« Voltar" /><br />
    </p>
<p>&nbsp;</p>

</asp:Content>

