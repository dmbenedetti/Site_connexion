<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_homepage.aspx.cs" Inherits="admincms_portal_homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>Portal Rede D'or > Gerenciar Home Page</p>
 <br />
  <br />
<h2>Gerenciar Home Page</h2>
   
    <br />
    <br />
<img src="images/print_home_portal.jpg" width="709" height="724" border="0" usemap="#Map" />
<map name="Map" id="Map">
  <area shape="rect" coords="3,133,708,359" href="portal_home_slider.aspx" alt="slider" />
  <area shape="rect" coords="-1,376,529,543" href="portal_home_banner.aspx?id=<% =banner1 %>" alt="banner1" />
  <area shape="rect" coords="544,378,708,543" href="portal_home_banner.aspx?id=<% =banner2 %>" alt="banner2" />
  <area shape="rect" coords="-2,558,346,722" href="portal_home_banner.aspx?id=<% =banner3 %>" alt="banner3" />
  <area shape="rect" coords="363,557,707,723" href="portal_home_banner.aspx?id=<% =banner4 %>" alt="banner4" />
</map>
    <br />
    <br />
</asp:Content>

