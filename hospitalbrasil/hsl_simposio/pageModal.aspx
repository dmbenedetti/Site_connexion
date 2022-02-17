<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pageModal.aspx.cs" Inherits="pageModal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/modal.css" rel="stylesheet" media="screen" />
</head>
<body>
<div style="width:800px; border:solid 1px #fff; overflow:auto; display:block;">
    <form id="form1" runat="server">
    
    <h2>
        <asp:Label ID="lblTitulo" runat="server" Text=""></asp:Label></h2>
        <asp:Literal ID="ltrConteudo" runat="server"></asp:Literal>
    <br />
    <br />
    <br />
    </form>
    </div>
</body>
</html>
