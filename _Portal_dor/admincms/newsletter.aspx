<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsletter.aspx.cs" Inherits="admincms_newsletter" ViewStateMode="Disabled" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="application/vnd.ms-excel" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Repeater ID="rptNewsLetter" runat="server" DataSourceID="ds_newsletter">
        <HeaderTemplate>
            <table cellpadding="0" cellspacing="0" border="1">
        </HeaderTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Eval("ds_email")%>
                </td>
                <td>
                    <%# Eval("nm_hospital")%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="ds_newsletter" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT a.ds_email, b.nm_hospital FROM [TB_NEWSLETTER] a INNER JOIN tb_Hospital b ON a.id_hospital = b.id_hospital ">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
