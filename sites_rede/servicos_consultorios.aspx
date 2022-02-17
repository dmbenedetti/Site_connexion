<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="servicos_consultorios.aspx.cs" Inherits="servicos_consultorios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container_interna">
        <asp:Image ID="imgConsultorios" runat="server" style="width: 100%;" />

        <br /><br />
        <div style="float:left; padding-right: 10px;">
            Especialidade:  <asp:DropDownList ID="drpEsp" runat="server" CssClass="text_field" style=""></asp:DropDownList> 
        </div>
        <div style="float:left;">
            Médico: <asp:TextBox ID="txtMedico" runat="server" CssClass="text_field" style="width:164px;"></asp:TextBox> <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>


        <asp:Repeater ID="rptEspecialidades" runat="server" OnItemDataBound="rptEspecialidades_ItemDataBound">
            <ItemTemplate>
                <div class="" style="padding-top: 30px; float:left; clear:both; width: 100%;">
                    <div>
                        <asp:HiddenField ID="idEspecialidade" runat="server" Value='<%# Eval("idEspecialidade_Consutorios") %>' />
                        <div style="width: 5px; background: RGB(0,142,70); height: 50px; float: left;"></div>
                        <div style="float: left; padding-left: 10px;"><span style="color: RGB(89,89,89); font-size: 18px;"><%# Eval("dsNome") %></span><br /><span style="color: RGB(89,89,89); font-size: 13px;"><%# Eval("dsInfo") %></span></div>
                    </div>
                    <asp:Repeater ID="rptMedicos" runat="server">
                        <HeaderTemplate>
                            <div style="padding-top: 7px; clear:both; float: left; width: 100%;">
                                <table style="width:100%">
                        </HeaderTemplate>
                        <FooterTemplate>
                                </table>
                            </div>
                        </FooterTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="width:50%; background: RGB(242,242,242)"><%# Eval("dsNome") %></td>
                                <td style="width:50%; background: RGB(229,229,229)"><%# Eval("dsInfo") %></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr>
                                <td style="width:50%; background: RGB(229,229,229)"><%# Eval("dsNome") %></td>
                                <td style="width:50%; background: RGB(242,242,242)"><%# Eval("dsInfo") %></td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

