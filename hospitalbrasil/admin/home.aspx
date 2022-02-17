<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="admin_Home_portal" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div <% =mostrar %>>
<img src="images/home.png" border="0" usemap="#Map" />
<map name="Map" id="Map">
  <area shape="rect" coords="3,280,128,395" href="banner_home.aspx?id=1" />
  <area shape="rect" coords="2,56,598,209" href="imagem_home.aspx" />
<area shape="rect" coords="3,220,107,265" href="chamadas_home.aspx?id=1" />
<area shape="rect" coords="119,218,224,266" href="chamadas_home.aspx?id=2" />
<area shape="rect" coords="238,220,344,265" href="chamadas_home.aspx?id=3" />
<area shape="rect" coords="357,219,463,265" href="chamadas_home.aspx?id=4" />
<area shape="rect" coords="477,218,583,265" href="chamadas_home.aspx?id=6" />
<area shape="rect" coords="142,300,282,383" href="noticia_home.aspx?id=1" />
<area shape="rect" coords="305,300,450,386" href="noticia_home.aspx?id=2" />
<area shape="rect" coords="472,280,597,395" href="banner_home.aspx?id=2" />
</map>
</div>
</asp:Content>

