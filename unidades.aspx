<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_unidades.master" AutoEventWireup="true" CodeFile="unidades.aspx.cs" Inherits="unidades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Nossas Unidades</h2>
    <div>
        
        &nbsp;&nbsp;&nbsp;
        </div>
    <table cellpadding="0" cellspacing="0" style="max-width:370px; width:100%;" align="right">
        <tr>
            <td width="160"><asp:DropDownList ID="drp_estado" runat="server" Height="25px" Width="150px" CssClass="selectDefault" OnPreRender="DropDownList1_PreRender" AutoPostBack="True" OnSelectedIndexChanged="drp_estado_SelectedIndexChanged"></asp:DropDownList> 
                
            </td>
            <td width="210"><asp:DropDownList ID="drp_especialidade" runat="server" Height="25px" Width="100%" CssClass="selectDefault" OnPreRender="drp_especialidade_PreRender" AutoPostBack="True" OnSelectedIndexChanged="drp_especialidade_SelectedIndexChanged" ></asp:DropDownList></td>
        </tr>
    </table>
        
    <br />
    <div style="width:100%; max-width:350px; float:left;">
        <asp:Image ID="img_map" runat="server"  Width="300" />
    </div>
    
    <br />
    <div style="width:100%; max-width:542px; float:right;">
        <asp:Literal ID="ltr_hosp" runat="server"></asp:Literal>
    </div>
    
        
            <div style="clear:both"></div>
    </asp:Content>

